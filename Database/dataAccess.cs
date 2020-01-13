
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;
using WebsiteCollegeLatest.classes;

namespace WebsiteCollegeLatest.Database
{
    public class dataAccess
    {

        DateTime localTime;
        public Int64 id { get; set; }
        public string uname { get; set; }
        public string picname { get; set; }
        public Int64 did { get; set; }
        public string dname { get; set; }
        public Int64 subid { get; set; }
        public string subname { get; set; }
        public string uploadername { get; set; }
        public string filename { get; set; }
        public Int32 downloads { get; set; }
        public string topic { get; set; }
        public string scode { get; set; }
        public Int64 notesid { get; set; }
        public profile p { get; set; }

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ToString());
        SqlCommand cmd = null;

        public dataAccess() {

          
           
        }

        public dataAccess(SqlDataReader dr)
        {
            if (dr.HasRows && !dr.IsClosed)
            {
                did = Convert.ToInt64(dr["deptid"]);
                dname = dr["deptname"].ToString();
            }
        }

        public dataAccess(SqlDataReader dr, int x)
        {
            if (dr.HasRows && !dr.IsClosed)
            {
                subid = Convert.ToInt64(dr["subjectid"]);
                subname = dr["subjectname"].ToString();
            }
        }


        public dataAccess(SqlDataReader dr, int x, int y)
        {
            if (dr.HasRows && !dr.IsClosed)
            {
                notesid = Convert.ToInt64(dr["notesid"]);
                uploadername = dr["uploader"].ToString();
                filename = "/Notes/" + dr["filename"].ToString();
                downloads = Convert.ToInt32(dr["downloads"]);
                topic = dr["topic"].ToString();
                scode = dr["subjectid"].ToString();
            }
        }

        public void updatedownload(Int64 notesid)
        {
            cmd = new SqlCommand("proc_update_downloads", con);
            cmd.CommandType = CommandType.StoredProcedure;
            try
            {
                con.Open();
                cmd.Parameters.AddWithValue("@notesid", notesid);

                cmd.ExecuteNonQuery();

            }
            catch
            {
                throw;
            }
            finally
            {
                con.Close();
                cmd.Dispose();
            }
        }

        public int checkUnique(String s, int val)
        {
            String cmps = null;

            switch (val)
            {
                case 1: cmps = "uname"; break;
                case 2: cmps = "email"; break;
            }

            cmd = new SqlCommand("select count(*) from tbl_login where '" + s + "'=" + cmps, con);
            con.Open();
            int res = Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();
            return res;
        }

        public int uploadNotes(Int64 id, String fname, Int64 branch, int sem, Int64 subj, string desc)
        {
            cmd = new SqlCommand("proc_upload_notes", con);
            cmd.CommandType = CommandType.StoredProcedure;
            try
            {
                con.Open();
                cmd.Parameters.AddWithValue("@uploadedbyID", id);
                cmd.Parameters.AddWithValue("@file", fname);
                cmd.Parameters.AddWithValue("@deptID", branch);
                cmd.Parameters.AddWithValue("@sem", sem);
                cmd.Parameters.AddWithValue("@sub", subj);
                cmd.Parameters.AddWithValue("@desc", desc);
                return cmd.ExecuteNonQuery();

            }
            catch
            {
                throw;
            }
            finally
            {
                con.Close();
                cmd.Dispose();
            }
        }

        public void sendmessage(Int64 toid, string msg, Int64 fromid)
        {
            cmd = new SqlCommand("proc_insertinto_tbl_message", con);
            cmd.CommandType = CommandType.StoredProcedure;
            try
            {
                con.Open();
                cmd.Parameters.AddWithValue("@toid", toid);
                cmd.Parameters.AddWithValue("@fromid", fromid);
                cmd.Parameters.AddWithValue("@message", msg);

                cmd.ExecuteNonQuery();

            }
            catch
            {
                throw;
            }
            finally
            {
                con.Close();
                cmd.Dispose();
            }
        }

        public int countmessages(Int64 id)
        {
            cmd = new SqlCommand("select count(DISTINCT fromid) from tbl_msg where '" + id + "'= toid", con);
            con.Open();
            int res = Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();
            return res;
        }

        public int registerUser(String name, String pwd, String usn, String email, Int64 phone)
        {
            cmd = new SqlCommand("proc_insertinto_tbl_login", con);
            cmd.CommandType = CommandType.StoredProcedure;
            DateTime utcTime = DateTime.UtcNow;
            TimeZoneInfo tzi = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");
            DateTime localTime = TimeZoneInfo.ConvertTimeFromUtc(utcTime, tzi);
            char[] c = { '2', '0', usn[3], usn[4] };
            string s = new string(c);
            int year = localTime.Year - Convert.ToInt16(s) + 1;
            if (year <= 0) return 0;
            int sem;
            if (localTime.Month < 8) sem = year * 2;
            else sem = year * 2-1;

            char[] dept = { usn[5], usn[6] };
            string deptname = new string(dept);
            deptname.ToUpper();

            try
            {
                con.Open();
                cmd.Parameters.AddWithValue("@name", name+"-"+sem.ToString()+"@"+deptname);
                cmd.Parameters.AddWithValue("@pwd", pwd);
                cmd.Parameters.AddWithValue("@usn", usn);
                cmd.Parameters.AddWithValue("@email", email);
                cmd.Parameters.AddWithValue("@phone", phone);
                cmd.Parameters.AddWithValue("@dept", deptname);
                cmd.Parameters.AddWithValue("@sem", sem);

                return cmd.ExecuteNonQuery();

            }
            catch
            {
                throw;
            }
            finally
                {
                con.Close();
                cmd.Dispose();
            }
        }


        public int uploadprofile(string s, Int64 i)
        {
            cmd = new SqlCommand("proc_updateinfo", con);
            cmd.CommandType = CommandType.StoredProcedure;
            try
            {
                con.Open();
                cmd.Parameters.AddWithValue("@picpath", s);
                cmd.Parameters.AddWithValue("@userid", i);

                return cmd.ExecuteNonQuery();

            }
            catch
            {
                throw;
            }
            finally
            {
                con.Close();
                cmd.Dispose();
            }
        }

        public bool loginUser(String name, String pass)
        {
            bool val = false;
            cmd = new SqlCommand("proc_check_login", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@uemail", name);
            cmd.Parameters.AddWithValue("@pass", pass);

            con.Open();
            try
            {
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    if (dr.HasRows && !dr.IsClosed)
                    {
                        id = Convert.ToInt64(dr["id"]);
                        uname = dr["uname"].ToString();
                        if (dr["picpath"].ToString() == "-")
                            picname = "noprofilepic.jpg";
                        else
                            picname = dr["picpath"].ToString();
                        val = true;

                    }
                }
                dr.Close();
                return val;
            }

            catch
            {
                throw;
            }
            finally
            {
                con.Close();
                cmd.Dispose();

            }
        }

        public List<dataAccess> load_dept()
        {
            cmd = new SqlCommand("proc_load_tbl_dept", con);
            cmd.CommandType = CommandType.StoredProcedure;
            List<dataAccess> d = new List<dataAccess>();
            try
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    d.Add(new dataAccess(dr));
                }
                dr.Close();
                return d;
            }

            catch
            {
                throw;
            }

            finally
            {
                con.Close();
                cmd.Dispose();

            }

        }

        public List<profile> load_profiles(string key)
        {
            string path;
            cmd = new SqlCommand("proc_load_profiles", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@keyword", key);
            List<profile> p = new List<profile>();
            try
            {

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                   
                    if ( dr["profilepicpath"].ToString()!= "")
                        path = "/profilePics/" + dr["profilepicpath"].ToString();
                    else
                        path = "/profilePics/noprofilepic.jpg";
                    p.Add(new profile(dr["uname"].ToString(), path, Convert.ToInt64(dr["id"])));
                }
                dr.Close();
                return p;
            }
            catch
            {
                throw;
            }
            finally
            {
                con.Close();
                cmd.Dispose();
            }
        }

        public List<messages> load_messages(Int64 id)
        {

            cmd = new SqlCommand("proc_load_inbox", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", id);
            List<messages> p = new List<messages>();
            try
            {

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    p.Add(new messages(dr["fromname"].ToString(),Convert.ToInt64(dr["fromid"]),Convert.ToInt16(dr["c"])));
                }
                dr.Close();
                return p;
            }
            catch
            {
                throw;
            }
            finally
            {
                con.Close();
                cmd.Dispose();
            }
        }

        public List<messages> load_conversation(Int64 toid,Int64 fromid )
        {

            cmd = new SqlCommand("proc_load_a_message", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@toid", toid);
            cmd.Parameters.AddWithValue("@fromid", fromid);

            List<messages> p = new List<messages>();
            try
            {

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    p.Add(new messages(dr["msg"].ToString(), Convert.ToDateTime(dr["senttime"])));
                }
                dr.Close();
                return p;
            }
            catch
            {
                throw;
            }
            finally
            {
                con.Close();
                cmd.Dispose();
            }
        }

        public List<dataAccess> search_results(Int64 branch, int sem, Int64 sub, string keyword)
        {
            cmd = new SqlCommand("proc_search_notes", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@branch", branch);
            cmd.Parameters.AddWithValue("@sem", sem);
            cmd.Parameters.AddWithValue("@subjectid", sub);
            cmd.Parameters.AddWithValue("@keyword", keyword);

            List<dataAccess> d = new List<dataAccess>();

            try
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    d.Add(new dataAccess(dr, 2, 2));
                }
                dr.Close();
                return d;

            }
            catch
            {
                throw;
            }
            finally
            {
                con.Close();
                cmd.Dispose();

            }

        }
        public List<dataAccess> load_subjects(Int64 deptid, int sem)
        {
            cmd = new SqlCommand("proc_load_subjects", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@did", deptid);
            cmd.Parameters.AddWithValue("@sem", sem);

            List<dataAccess> d = new List<dataAccess>();

            try
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    d.Add(new dataAccess(dr, 2));
                }
                dr.Close();
                return d;
            }

            catch
            {
                throw;
            }

            finally
            {
                con.Close();
                cmd.Dispose();

            }

        }

    }
}
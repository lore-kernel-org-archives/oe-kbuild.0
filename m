Content-Type: multipart/mixed; boundary="===============3929561139609716712=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [brauner:debugfs_namespaces 3/5] kernel/utsname.c:108 copy_utsname() error: 'new_ns' dereferencing possible ERR_PTR()
Date: Mon, 07 Oct 2019 12:57:57 +0300
Message-ID: <20191007095756.GC21515@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3929561139609716712==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brauner/linux.git d=
ebugfs_namespaces
head:   aef8406e30cf9b60c76e5de205fa77f3791e2c54
commit: fce9acb4ffd1b7b342c69f0c39d49835b7232414 [3/5] DEBUG

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/utsname.c:108 copy_utsname() error: 'new_ns' dereferencing possible =
ERR_PTR()

# https://git.kernel.org/pub/scm/linux/kernel/git/brauner/linux.git/commit/=
?id=3Dfce9acb4ffd1b7b342c69f0c39d49835b7232414
git remote add brauner https://git.kernel.org/pub/scm/linux/kernel/git/brau=
ner/linux.git
git remote update brauner
git checkout fce9acb4ffd1b7b342c69f0c39d49835b7232414
vim +/new_ns +108 kernel/utsname.c

071df104f808b8 Serge E. Hallyn   2006-10-02   84  =

4865ecf1315b45 Serge E. Hallyn   2006-10-02   85  /*
4865ecf1315b45 Serge E. Hallyn   2006-10-02   86   * Copy task tsk's utsnam=
e namespace, or clone it if flags
4865ecf1315b45 Serge E. Hallyn   2006-10-02   87   * specifies CLONE_NEWUTS=
.  In latter case, changes to the
4865ecf1315b45 Serge E. Hallyn   2006-10-02   88   * utsname of this proces=
s won't be seen by parent, and vice
4865ecf1315b45 Serge E. Hallyn   2006-10-02   89   * versa.
4865ecf1315b45 Serge E. Hallyn   2006-10-02   90   */
bb96a6f50be273 Serge E. Hallyn   2011-03-23   91  struct uts_namespace *cop=
y_utsname(unsigned long flags,
bcf58e725ddc45 Eric W. Biederman 2012-07-26   92  	struct user_namespace *u=
ser_ns, struct uts_namespace *old_ns)
4865ecf1315b45 Serge E. Hallyn   2006-10-02   93  {
071df104f808b8 Serge E. Hallyn   2006-10-02   94  	struct uts_namespace *ne=
w_ns;
fce9acb4ffd1b7 Christian Brauner 2019-10-02   95  	char name[50];
4865ecf1315b45 Serge E. Hallyn   2006-10-02   96  =

e3222c4ecc649c Badari Pulavarty  2007-05-08   97  	BUG_ON(!old_ns);
4865ecf1315b45 Serge E. Hallyn   2006-10-02   98  	get_uts_ns(old_ns);
4865ecf1315b45 Serge E. Hallyn   2006-10-02   99  =

071df104f808b8 Serge E. Hallyn   2006-10-02  100  	if (!(flags & CLONE_NEWU=
TS))
e3222c4ecc649c Badari Pulavarty  2007-05-08  101  		return old_ns;
071df104f808b8 Serge E. Hallyn   2006-10-02  102  =

bcf58e725ddc45 Eric W. Biederman 2012-07-26  103  	new_ns =3D clone_uts_ns(=
user_ns, old_ns);
                                                        ^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^
This isn't checked for errors

071df104f808b8 Serge E. Hallyn   2006-10-02  104  =

071df104f808b8 Serge E. Hallyn   2006-10-02  105  	put_uts_ns(old_ns);
fce9acb4ffd1b7 Christian Brauner 2019-10-02  106  =

fce9acb4ffd1b7 Christian Brauner 2019-10-02  107  	if (uts_debugfs) {
fce9acb4ffd1b7 Christian Brauner 2019-10-02 @108  		snprintf(name, 50, "uts=
:[%u]", new_ns->ns.inum);
                                                                           =
                    ^^^^^^^^^^^^^^^
Oops

fce9acb4ffd1b7 Christian Brauner 2019-10-02  109  		new_ns->ns.debugfs =3D =
debugfs_create_file(name, 0600, uts_debugfs,
fce9acb4ffd1b7 Christian Brauner 2019-10-02  110  					    &new_ns->ns, &ns=
_file_operations);
fce9acb4ffd1b7 Christian Brauner 2019-10-02  111  	}
fce9acb4ffd1b7 Christian Brauner 2019-10-02  112  =

e3222c4ecc649c Badari Pulavarty  2007-05-08  113  	return new_ns;
4865ecf1315b45 Serge E. Hallyn   2006-10-02  114  }
4865ecf1315b45 Serge E. Hallyn   2006-10-02  115  =


---
0-DAY kernel test infrastructure                Open Source Technology Cent=
er
https://lists.01.org/pipermail/kbuild-all                   Intel Corporati=
on
--===============3929561139609716712==--


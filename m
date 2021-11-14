Content-Type: multipart/mixed; boundary="===============6349317768042545122=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [driver-core:debugfs_cleanup 1/1] fs/d_path.c:20:20: warning: Unsigned variable '.' can't be negative so it is unnecessary to test it. [unsignedPositive]
Date: Mon, 15 Nov 2021 00:20:12 +0800
Message-ID: <202111150057.2Z3oqaBC-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6349317768042545122==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: devel(a)driverdev.osuosl.org
CC: linux-kernel(a)vger.kernel.org
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.=
git debugfs_cleanup
head:   8247270bcf99bc7bf661ae2a3f2ee6e64c7f957d
commit: 8247270bcf99bc7bf661ae2a3f2ee6e64c7f957d [1/1] fs: make d_path-like=
 functions all have unsigned size
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
compiler: ia64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> fs/d_path.c:20:20: warning: Unsigned variable '.' can't be negative so i=
t is unnecessary to test it. [unsignedPositive]
    if (likely(p->len >=3D 0))
                      ^

vim +20 fs/d_path.c

7a5cf791a74764 Al Viro            2018-03-05  10  =

ad08ae586586ea Al Viro            2021-05-12  11  struct prepend_buffer {
ad08ae586586ea Al Viro            2021-05-12  12  	char *buf;
8247270bcf99bc Greg Kroah-Hartman 2021-07-27  13  	unsigned int len;
ad08ae586586ea Al Viro            2021-05-12  14  };
ad08ae586586ea Al Viro            2021-05-12  15  #define DECLARE_BUFFER(__=
name, __buf, __len) \
ad08ae586586ea Al Viro            2021-05-12  16  	struct prepend_buffer __=
name =3D {.buf =3D __buf + __len, .len =3D __len}
ad08ae586586ea Al Viro            2021-05-12  17  =

ad08ae586586ea Al Viro            2021-05-12  18  static char *extract_stri=
ng(struct prepend_buffer *p)
7a5cf791a74764 Al Viro            2018-03-05  19  {
ad08ae586586ea Al Viro            2021-05-12 @20  	if (likely(p->len >=3D 0=
))
ad08ae586586ea Al Viro            2021-05-12  21  		return p->buf;
ad08ae586586ea Al Viro            2021-05-12  22  	return ERR_PTR(-ENAMETOO=
LONG);
ad08ae586586ea Al Viro            2021-05-12  23  }
ad08ae586586ea Al Viro            2021-05-12  24  =


:::::: The code at line 20 was first introduced by commit
:::::: ad08ae586586ea9e2c0228a3d5a083500ea54202 d_path: introduce struct pr=
epend_buffer

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6349317768042545122==--


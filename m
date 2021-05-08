Content-Type: multipart/mixed; boundary="===============7067092873676326400=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 1/3] 9p: add support for root file systems
Date: Sat, 08 May 2021 13:55:50 +0800
Message-ID: <202105081353.RAcPgxl3-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7067092873676326400==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20210507235842.16796-2-changbin.du@gmail.com>
References: <20210507235842.16796-2-changbin.du@gmail.com>
TO: Changbin Du <changbin.du@gmail.com>
TO: Eric Van Hensbergen <ericvh@gmail.com>
TO: Latchesar Ionkov <lucho@ionkov.net>
TO: Dominique Martinet <asmadeus@codewreck.org>
CC: Jonathan Corbet <corbet@lwn.net>
CC: linux-doc(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org
CC: v9fs-developer(a)lists.sourceforge.net
CC: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
CC: Changbin Du <changbin.du@gmail.com>

Hi Changbin,

I love your patch! Perhaps something to improve:

[auto build test WARNING on lwn/docs-next]
[also build test WARNING on linus/master v5.12 next-20210507]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Changbin-Du/9p-add-support=
-for-root-file-systems/20210508-080129
base:   git://git.lwn.net/linux-2.6 docs-next
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
compiler: xtensa-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> init/do_mounts.c:573:0: warning: syntax error [syntaxError]
   =

   ^

vim +573 init/do_mounts.c

2fc1f1b77f2594 Changbin Du 2021-05-08  555  =

2fc1f1b77f2594 Changbin Du 2021-05-08  556  static int __init mount_v9fs_ro=
ot(void)
2fc1f1b77f2594 Changbin Du 2021-05-08  557  {
2fc1f1b77f2594 Changbin Du 2021-05-08  558  	char *root_dev, *root_data;
2fc1f1b77f2594 Changbin Du 2021-05-08  559  	unsigned int timeout;
2fc1f1b77f2594 Changbin Du 2021-05-08  560  	int try, err;
2fc1f1b77f2594 Changbin Du 2021-05-08  561  =

2fc1f1b77f2594 Changbin Du 2021-05-08  562  	err =3D v9fs_root_data(&root_d=
ev, &root_data);
2fc1f1b77f2594 Changbin Du 2021-05-08  563  	if (err !=3D 0)
2fc1f1b77f2594 Changbin Du 2021-05-08  564  		return 0;
2fc1f1b77f2594 Changbin Du 2021-05-08  565  =

2fc1f1b77f2594 Changbin Du 2021-05-08  566  	timeout =3D V9FSROOT_TIMEOUT_M=
IN;
2fc1f1b77f2594 Changbin Du 2021-05-08  567  	for (try =3D 1; ; try++) {
2fc1f1b77f2594 Changbin Du 2021-05-08  568  		err =3D do_mount_root(root_de=
v, "9p",
2fc1f1b77f2594 Changbin Du 2021-05-08  569  				    root_mountflags, root_d=
ata);
2fc1f1b77f2594 Changbin Du 2021-05-08  570  		if (err =3D=3D 0)
2fc1f1b77f2594 Changbin Du 2021-05-08  571  			return 1;
2fc1f1b77f2594 Changbin Du 2021-05-08  572  =

2fc1f1b77f2594 Changbin Du 2021-05-08 @573  		if (!v9fs_need_retry(root_dat=
a) || try > V9FSROOT_RETRY_MAX)
2fc1f1b77f2594 Changbin Du 2021-05-08  574  			break;
2fc1f1b77f2594 Changbin Du 2021-05-08  575  =

2fc1f1b77f2594 Changbin Du 2021-05-08  576  		/* Wait, in case the server r=
efused us immediately */
2fc1f1b77f2594 Changbin Du 2021-05-08  577  		ssleep(timeout);
2fc1f1b77f2594 Changbin Du 2021-05-08  578  		timeout <<=3D 1;
2fc1f1b77f2594 Changbin Du 2021-05-08  579  		if (timeout > V9FSROOT_TIMEOU=
T_MAX)
2fc1f1b77f2594 Changbin Du 2021-05-08  580  			timeout =3D V9FSROOT_TIMEOUT=
_MAX;
2fc1f1b77f2594 Changbin Du 2021-05-08  581  	}
2fc1f1b77f2594 Changbin Du 2021-05-08  582  	return 0;
2fc1f1b77f2594 Changbin Du 2021-05-08  583  }
2fc1f1b77f2594 Changbin Du 2021-05-08  584  #endif
2fc1f1b77f2594 Changbin Du 2021-05-08  585  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7067092873676326400==--


Content-Type: multipart/mixed; boundary="===============0183826065621167450=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v1 2/2] ucounts: Move rlimit max values from ucounts max
Date: Sun, 28 Nov 2021 00:42:32 +0800
Message-ID: <202111280022.ugxpiKpA-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0183826065621167450==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <bcc85eae4f5e3799f9efdf2d73572bb88616ebac.1637934917.git.legio=
n@kernel.org>
References: <bcc85eae4f5e3799f9efdf2d73572bb88616ebac.1637934917.git.legion=
@kernel.org>
TO: Alexey Gladkov <legion@kernel.org>
TO: LKML <linux-kernel@vger.kernel.org>
TO: Linux Containers <containers@lists.linux.dev>
CC: "Eric W . Biederman" <ebiederm@xmission.com>

Hi Alexey,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linux/master]
[also build test WARNING on linus/master v5.16-rc2 next-20211126]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Alexey-Gladkov/ucounts-Fix=
-rlimit-max-values-check/20211126-224059
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
136057256686de39cc3a07c2e39ef6bc43003ff6
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: i386-randconfig-m021-20211126 (https://download.01.org/0day-ci/arch=
ive/20211128/202111280022.ugxpiKpA-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/ucount.c:109 setup_userns_sysctls() error: buffer overflow 'ns->ucou=
nt_max' 10 <=3D 13

vim +109 kernel/ucount.c

dbec28460a89aa Eric W. Biederman 2016-07-30   97  =

dbec28460a89aa Eric W. Biederman 2016-07-30   98  bool setup_userns_sysctls=
(struct user_namespace *ns)
dbec28460a89aa Eric W. Biederman 2016-07-30   99  {
dbec28460a89aa Eric W. Biederman 2016-07-30  100  #ifdef CONFIG_SYSCTL
dbec28460a89aa Eric W. Biederman 2016-07-30  101  	struct ctl_table *tbl;
0f538e3e712a51 Jan Kara          2020-04-07  102  =

0f538e3e712a51 Jan Kara          2020-04-07  103  	BUILD_BUG_ON(ARRAY_SIZE(=
user_table) !=3D UCOUNT_COUNTS + 1);
dbec28460a89aa Eric W. Biederman 2016-07-30  104  	setup_sysctl_set(&ns->se=
t, &set_root, set_is_seen);
f6b2db1a3e8d14 Eric W. Biederman 2016-08-08  105  	tbl =3D kmemdup(user_tab=
le, sizeof(user_table), GFP_KERNEL);
dbec28460a89aa Eric W. Biederman 2016-07-30  106  	if (tbl) {
25f9c0817c535a Eric W. Biederman 2016-08-08  107  		int i;
25f9c0817c535a Eric W. Biederman 2016-08-08  108  		for (i =3D 0; i < UCOUN=
T_COUNTS; i++) {
25f9c0817c535a Eric W. Biederman 2016-08-08 @109  			tbl[i].data =3D &ns->u=
count_max[i];
25f9c0817c535a Eric W. Biederman 2016-08-08  110  		}
f6b2db1a3e8d14 Eric W. Biederman 2016-08-08  111  		ns->sysctls =3D __regis=
ter_sysctl_table(&ns->set, "user", tbl);
dbec28460a89aa Eric W. Biederman 2016-07-30  112  	}
dbec28460a89aa Eric W. Biederman 2016-07-30  113  	if (!ns->sysctls) {
dbec28460a89aa Eric W. Biederman 2016-07-30  114  		kfree(tbl);
dbec28460a89aa Eric W. Biederman 2016-07-30  115  		retire_sysctl_set(&ns->=
set);
dbec28460a89aa Eric W. Biederman 2016-07-30  116  		return false;
dbec28460a89aa Eric W. Biederman 2016-07-30  117  	}
dbec28460a89aa Eric W. Biederman 2016-07-30  118  #endif
dbec28460a89aa Eric W. Biederman 2016-07-30  119  	return true;
dbec28460a89aa Eric W. Biederman 2016-07-30  120  }
dbec28460a89aa Eric W. Biederman 2016-07-30  121  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0183826065621167450==--


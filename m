Content-Type: multipart/mixed; boundary="===============2672526012715501069=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] rlimits: do not grab tasklist_lock for do_prlimit on current
Date: Fri, 17 Dec 2021 04:34:56 +0800
Message-ID: <202112170456.6wFecpJp-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2672526012715501069==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211213220401.1039578-1-brho@google.com>
References: <20211213220401.1039578-1-brho@google.com>
TO: Barret Rhoden <brho@google.com>
TO: "Eric W. Biederman" <ebiederm@xmission.com>
TO: Christian Brauner <christian.brauner@ubuntu.com>
TO: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Alexey Gladkov <legion@kernel.org>
TO: William Cohen <wcohen@redhat.com>
TO: Viresh Kumar <viresh.kumar@linaro.org>
TO: Alexey Dobriyan <adobriyan@gmail.com>
TO: Chris Hyser <chris.hyser@oracle.com>
TO: Peter Collingbourne <pcc@google.com>

Hi Barret,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.16-rc5 next-20211215]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Barret-Rhoden/rlimits-do-n=
ot-grab-tasklist_lock-for-do_prlimit-on-current/20211214-060452
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
aa50faff4416c869b52dff68a937c84d29e12f4b
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-c002-20211216 (https://download.01.org/0day-ci/ar=
chive/20211217/202112170456.6wFecpJp-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> kernel/sys.c:1617:1-7: preceding lock on line 1580

vim +1617 kernel/sys.c

c022a0acad534f Jiri Slaby        2010-05-04  1560  =

1c1e618ddd15f6 Jiri Slaby        2009-08-28  1561  /* make sure you are all=
owed to change @tsk limits before calling this */
5b41535aac0c07 Jiri Slaby        2010-03-24  1562  int do_prlimit(struct ta=
sk_struct *tsk, unsigned int resource,
5b41535aac0c07 Jiri Slaby        2010-03-24  1563  		struct rlimit *new_rli=
m, struct rlimit *old_rlim)
^1da177e4c3f41 Linus Torvalds    2005-04-16  1564  {
5b41535aac0c07 Jiri Slaby        2010-03-24  1565  	struct rlimit *rlim;
86f162f4c75ceb Jiri Slaby        2009-11-14  1566  	int retval =3D 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1567  =

^1da177e4c3f41 Linus Torvalds    2005-04-16  1568  	if (resource >=3D RLIM_=
NLIMITS)
^1da177e4c3f41 Linus Torvalds    2005-04-16  1569  		return -EINVAL;
5b41535aac0c07 Jiri Slaby        2010-03-24  1570  	if (new_rlim) {
7855c35da7ba16 Jiri Slaby        2009-08-26  1571  		if (new_rlim->rlim_cur=
 > new_rlim->rlim_max)
60fd760fb9ff70 Andrew Morton     2009-02-04  1572  			return -EINVAL;
5b41535aac0c07 Jiri Slaby        2010-03-24  1573  		if (resource =3D=3D RL=
IMIT_NOFILE &&
5b41535aac0c07 Jiri Slaby        2010-03-24  1574  				new_rlim->rlim_max >=
 sysctl_nr_open)
^1da177e4c3f41 Linus Torvalds    2005-04-16  1575  			return -EPERM;
5b41535aac0c07 Jiri Slaby        2010-03-24  1576  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1577  =

1c1e618ddd15f6 Jiri Slaby        2009-08-28  1578  	/* protect tsk->signal =
and tsk->sighand from disappearing */
2a9a9e76b0164e Barret Rhoden     2021-12-13  1579  	if (tsk !=3D current)
1c1e618ddd15f6 Jiri Slaby        2009-08-28 @1580  		read_lock(&tasklist_lo=
ck);
1c1e618ddd15f6 Jiri Slaby        2009-08-28  1581  	if (!tsk->sighand) {
1c1e618ddd15f6 Jiri Slaby        2009-08-28  1582  		retval =3D -ESRCH;
1c1e618ddd15f6 Jiri Slaby        2009-08-28  1583  		goto out;
1c1e618ddd15f6 Jiri Slaby        2009-08-28  1584  	}
1c1e618ddd15f6 Jiri Slaby        2009-08-28  1585  =

5b41535aac0c07 Jiri Slaby        2010-03-24  1586  	rlim =3D tsk->signal->r=
lim + resource;
86f162f4c75ceb Jiri Slaby        2009-11-14  1587  	task_lock(tsk->group_le=
ader);
5b41535aac0c07 Jiri Slaby        2010-03-24  1588  	if (new_rlim) {
fc832ad3645f05 Serge E. Hallyn   2011-03-23  1589  		/* Keep the capable ch=
eck against init_user_ns until
fc832ad3645f05 Serge E. Hallyn   2011-03-23  1590  		   cgroups can contain=
 all limits */
5b41535aac0c07 Jiri Slaby        2010-03-24  1591  		if (new_rlim->rlim_max=
 > rlim->rlim_max &&
86f162f4c75ceb Jiri Slaby        2009-11-14  1592  				!capable(CAP_SYS_RES=
OURCE))
86f162f4c75ceb Jiri Slaby        2009-11-14  1593  			retval =3D -EPERM;
86f162f4c75ceb Jiri Slaby        2009-11-14  1594  		if (!retval)
cad4ea546b1a8a Eric W. Biederman 2017-04-12  1595  			retval =3D security_t=
ask_setrlimit(tsk, resource, new_rlim);
5b41535aac0c07 Jiri Slaby        2010-03-24  1596  	}
5b41535aac0c07 Jiri Slaby        2010-03-24  1597  	if (!retval) {
5b41535aac0c07 Jiri Slaby        2010-03-24  1598  		if (old_rlim)
5b41535aac0c07 Jiri Slaby        2010-03-24  1599  			*old_rlim =3D *rlim;
5b41535aac0c07 Jiri Slaby        2010-03-24  1600  		if (new_rlim)
5b41535aac0c07 Jiri Slaby        2010-03-24  1601  			*rlim =3D *new_rlim;
5b41535aac0c07 Jiri Slaby        2010-03-24  1602  	}
7855c35da7ba16 Jiri Slaby        2009-08-26  1603  	task_unlock(tsk->group_=
leader);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1604  =

d3561f78fd379a Andrew Morton     2006-03-24  1605  	/*
24db4dd90dd53a Thomas Gleixner   2019-08-21  1606  	 * RLIMIT_CPU handling.=
 Arm the posix CPU timer if the limit is not
5afe69c2ccd069 Xiaofeng Cao      2021-05-06  1607  	 * infinite. In case of=
 RLIM_INFINITY the posix CPU timer code
24db4dd90dd53a Thomas Gleixner   2019-08-21  1608  	 * ignores the rlimit.
d3561f78fd379a Andrew Morton     2006-03-24  1609  	 */
5b41535aac0c07 Jiri Slaby        2010-03-24  1610  	 if (!retval && new_rli=
m && resource =3D=3D RLIMIT_CPU &&
baa73d9e478ff3 Nicolas Pitre     2016-11-11  1611  	     new_rlim->rlim_cur=
 !=3D RLIM_INFINITY &&
baa73d9e478ff3 Nicolas Pitre     2016-11-11  1612  	     IS_ENABLED(CONFIG_=
POSIX_TIMERS))
7855c35da7ba16 Jiri Slaby        2009-08-26  1613  		update_rlimit_cpu(tsk,=
 new_rlim->rlim_cur);
ec9e16bacdba1d Andrew Morton     2006-03-24  1614  out:
2a9a9e76b0164e Barret Rhoden     2021-12-13  1615  	if (tsk !=3D current)
1c1e618ddd15f6 Jiri Slaby        2009-08-28  1616  		read_unlock(&tasklist_=
lock);
2fb9d2689a0041 Oleg Nesterov     2009-09-03 @1617  	return retval;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1618  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  1619  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2672526012715501069==--


Content-Type: multipart/mixed; boundary="===============1326619606623364195=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: block/blk-iolatency.c:902:24: warning: Local variable 's' shadows outer argument [shadowArgument]
Date: Thu, 02 Jun 2022 09:30:49 +0800
Message-ID: <202206020918.NIkGLnUR-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1326619606623364195==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 block/blk-iolatency.c:902:24: warning: Local variable 's' shadows outer ar=
gument [shadowArgument]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Christoph Hellwig <hch@lst.de>
CC: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   54eb8462f21fb170a05ad64620f0d8d0cf2b7fb5
commit: e4a19f7289f3fa9b2a4e65d0f4b3a7816e8e445b block: don't include blk-m=
q.h in blk.h
date:   6 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 6 months ago
compiler: sparc64-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout e4a19f7289f3fa9b2a4e65d0f4b3a7816e8e445b
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> block/blk-iolatency.c:902:24: warning: Local variable 's' shadows outer =
argument [shadowArgument]
     struct latency_stat *s;
                          ^
   block/blk-iolatency.c:894:78: note: Shadowed declaration
   static bool iolatency_ssd_stat(struct iolatency_grp *iolat, struct seq_f=
ile *s)
                                                                           =
     ^
   block/blk-iolatency.c:902:24: note: Shadow variable
     struct latency_stat *s;
                          ^

vim +/s +902 block/blk-iolatency.c

d70675121546c3 Josef Bacik       2018-07-03  893  =

252c651a4c854b Christoph Hellwig 2021-08-10  894  static bool iolatency_ssd=
_stat(struct iolatency_grp *iolat, struct seq_file *s)
1fa2840e56f903 Josef Bacik       2018-09-28  895  {
1fa2840e56f903 Josef Bacik       2018-09-28  896  	struct latency_stat stat;
1fa2840e56f903 Josef Bacik       2018-09-28  897  	int cpu;
1fa2840e56f903 Josef Bacik       2018-09-28  898  =

1fa2840e56f903 Josef Bacik       2018-09-28  899  	latency_stat_init(iolat,=
 &stat);
1fa2840e56f903 Josef Bacik       2018-09-28  900  	preempt_disable();
1fa2840e56f903 Josef Bacik       2018-09-28  901  	for_each_online_cpu(cpu)=
 {
1fa2840e56f903 Josef Bacik       2018-09-28 @902  		struct latency_stat *s;
1fa2840e56f903 Josef Bacik       2018-09-28  903  		s =3D per_cpu_ptr(iolat=
->stats, cpu);
1fa2840e56f903 Josef Bacik       2018-09-28  904  		latency_stat_sum(iolat,=
 &stat, s);
1fa2840e56f903 Josef Bacik       2018-09-28  905  	}
1fa2840e56f903 Josef Bacik       2018-09-28  906  	preempt_enable();
1fa2840e56f903 Josef Bacik       2018-09-28  907  =

1fa2840e56f903 Josef Bacik       2018-09-28  908  	if (iolat->rq_depth.max_=
depth =3D=3D UINT_MAX)
252c651a4c854b Christoph Hellwig 2021-08-10  909  		seq_printf(s, " missed=
=3D%llu total=3D%llu depth=3Dmax",
1fa2840e56f903 Josef Bacik       2018-09-28  910  			(unsigned long long)st=
at.ps.missed,
1fa2840e56f903 Josef Bacik       2018-09-28  911  			(unsigned long long)st=
at.ps.total);
252c651a4c854b Christoph Hellwig 2021-08-10  912  	else
252c651a4c854b Christoph Hellwig 2021-08-10  913  		seq_printf(s, " missed=
=3D%llu total=3D%llu depth=3D%u",
1fa2840e56f903 Josef Bacik       2018-09-28  914  			(unsigned long long)st=
at.ps.missed,
1fa2840e56f903 Josef Bacik       2018-09-28  915  			(unsigned long long)st=
at.ps.total,
1fa2840e56f903 Josef Bacik       2018-09-28  916  			iolat->rq_depth.max_de=
pth);
252c651a4c854b Christoph Hellwig 2021-08-10  917  	return true;
1fa2840e56f903 Josef Bacik       2018-09-28  918  }
1fa2840e56f903 Josef Bacik       2018-09-28  919  =


:::::: The code at line 902 was first introduced by commit
:::::: 1fa2840e56f9032e14a75fcf67edfe0f21102e4b blk-iolatency: use a percen=
tile approache for ssd's

:::::: TO: Josef Bacik <josef@toxicpanda.com>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1326619606623364195==--


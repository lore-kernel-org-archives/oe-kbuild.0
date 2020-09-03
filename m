Content-Type: multipart/mixed; boundary="===============8318834149418563417=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/scsi/scsi_debug.c:4726:5: warning: Variable 'j' is reassigned a value before the old one has been used.
Date: Thu, 03 Sep 2020 17:02:32 +0800
Message-ID: <202009031726.F2JL6I6E%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8318834149418563417==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Douglas Gilbert <dgilbert@interlog.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   fc3abb53250a90ba2150eebd182137c136f4d25a
commit: 87c715dcde633f4cc4690a24a240e838181e6a9d scsi: scsi_debug: Add per_=
host_store option
date:   4 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 4 months ago
compiler: nios2-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/scsi/scsi_debug.c:4726:5: warning: Variable 'j' is reassigned a =
value before the old one has been used. [redundantAssignment]
     j =3D 0;
       ^
   drivers/scsi/scsi_debug.c:4722:4: note: Variable 'j' is reassigned a val=
ue before the old one has been used.
      ++j;
      ^
   drivers/scsi/scsi_debug.c:4726:5: note: Variable 'j' is reassigned a val=
ue before the old one has been used.
     j =3D 0;
       ^
>> drivers/scsi/scsi_debug.c:5786:8: warning: Variable 'error' is reassigne=
d a value before the old one has been used. [redundantAssignment]
    error =3D device_register(&sdbg_host->dev);
          ^
   drivers/scsi/scsi_debug.c:5756:0: note: Variable 'error' is reassigned a=
 value before the old one has been used.
    int error =3D -ENOMEM;
   ^
   drivers/scsi/scsi_debug.c:5786:8: note: Variable 'error' is reassigned a=
 value before the old one has been used.
    error =3D device_register(&sdbg_host->dev);
          ^

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D87c715dcde633f4cc4690a24a240e838181e6a9d
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git fetch --no-tags linus master
git checkout 87c715dcde633f4cc4690a24a240e838181e6a9d
vim +/j +4726 drivers/scsi/scsi_debug.c

c8ed555aba1123 Al Viro         2013-03-31  4664  =

cbf67842c3d9e7 Douglas Gilbert 2014-07-26  4665  /* Output seen with 'cat /=
proc/scsi/scsi_debug/<host_id>'. It will be the
cbf67842c3d9e7 Douglas Gilbert 2014-07-26  4666   * same for each scsi_debu=
g host (if more than one). Some of the counters
cbf67842c3d9e7 Douglas Gilbert 2014-07-26  4667   * output are not atomics =
so might be inaccurate in a busy system. */
c8ed555aba1123 Al Viro         2013-03-31  4668  static int scsi_debug_show=
_info(struct seq_file *m, struct Scsi_Host *host)
c8ed555aba1123 Al Viro         2013-03-31  4669  {
c483739430f107 Douglas Gilbert 2016-05-06  4670  	int f, j, l;
c483739430f107 Douglas Gilbert 2016-05-06  4671  	struct sdebug_queue *sqp;
87c715dcde633f Douglas Gilbert 2020-04-21  4672  	struct sdebug_host_info *=
sdhp;
c483739430f107 Douglas Gilbert 2016-05-06  4673  =

c483739430f107 Douglas Gilbert 2016-05-06  4674  	seq_printf(m, "scsi_debug=
 adapter driver, version %s [%s]\n",
c483739430f107 Douglas Gilbert 2016-05-06  4675  		   SDEBUG_VERSION, sdebu=
g_version_date);
c483739430f107 Douglas Gilbert 2016-05-06  4676  	seq_printf(m, "num_tgts=
=3D%d, %ssize=3D%d MB, opts=3D0x%x, every_nth=3D%d\n",
c483739430f107 Douglas Gilbert 2016-05-06  4677  		   sdebug_num_tgts, "sha=
red (ram) ", sdebug_dev_size_mb,
c483739430f107 Douglas Gilbert 2016-05-06  4678  		   sdebug_opts, sdebug_e=
very_nth);
c483739430f107 Douglas Gilbert 2016-05-06  4679  	seq_printf(m, "delay=3D%d=
, ndelay=3D%d, max_luns=3D%d, sector_size=3D%d %s\n",
c483739430f107 Douglas Gilbert 2016-05-06  4680  		   sdebug_jdelay, sdebug=
_ndelay, sdebug_max_luns,
c483739430f107 Douglas Gilbert 2016-05-06  4681  		   sdebug_sector_size, "=
bytes");
c483739430f107 Douglas Gilbert 2016-05-06  4682  	seq_printf(m, "cylinders=
=3D%d, heads=3D%d, sectors=3D%d, command aborts=3D%d\n",
c483739430f107 Douglas Gilbert 2016-05-06  4683  		   sdebug_cylinders_per,=
 sdebug_heads, sdebug_sectors_per,
c483739430f107 Douglas Gilbert 2016-05-06  4684  		   num_aborts);
c483739430f107 Douglas Gilbert 2016-05-06  4685  	seq_printf(m, "RESETs: de=
vice=3D%d, target=3D%d, bus=3D%d, host=3D%d\n",
c483739430f107 Douglas Gilbert 2016-05-06  4686  		   num_dev_resets, num_t=
arget_resets, num_bus_resets,
c483739430f107 Douglas Gilbert 2016-05-06  4687  		   num_host_resets);
c483739430f107 Douglas Gilbert 2016-05-06  4688  	seq_printf(m, "dix_reads=
=3D%d, dix_writes=3D%d, dif_errors=3D%d\n",
c483739430f107 Douglas Gilbert 2016-05-06  4689  		   dix_reads, dix_writes=
, dif_errors);
458df78b1c513d Bart Van Assche 2018-01-26  4690  	seq_printf(m, "usec_in_ji=
ffy=3D%lu, statistics=3D%d\n", TICK_NSEC / 1000,
458df78b1c513d Bart Van Assche 2018-01-26  4691  		   sdebug_statistics);
c483739430f107 Douglas Gilbert 2016-05-06  4692  	seq_printf(m, "cmnd_count=
=3D%d, completions=3D%d, %s=3D%d, a_tsf=3D%d\n",
c483739430f107 Douglas Gilbert 2016-05-06  4693  		   atomic_read(&sdebug_c=
mnd_count),
c483739430f107 Douglas Gilbert 2016-05-06  4694  		   atomic_read(&sdebug_c=
ompletions),
c483739430f107 Douglas Gilbert 2016-05-06  4695  		   "miss_cpus", atomic_r=
ead(&sdebug_miss_cpus),
c483739430f107 Douglas Gilbert 2016-05-06  4696  		   atomic_read(&sdebug_a=
_tsf));
c483739430f107 Douglas Gilbert 2016-05-06  4697  =

c483739430f107 Douglas Gilbert 2016-05-06  4698  	seq_printf(m, "submit_que=
ues=3D%d\n", submit_queues);
c483739430f107 Douglas Gilbert 2016-05-06  4699  	for (j =3D 0, sqp =3D sde=
bug_q_arr; j < submit_queues; ++j, ++sqp) {
c483739430f107 Douglas Gilbert 2016-05-06  4700  		seq_printf(m, "  queue %=
d:\n", j);
c483739430f107 Douglas Gilbert 2016-05-06  4701  		f =3D find_first_bit(sqp=
->in_use_bm, sdebug_max_queue);
773642d95b8220 Douglas Gilbert 2016-04-25  4702  		if (f !=3D sdebug_max_qu=
eue) {
c483739430f107 Douglas Gilbert 2016-05-06  4703  			l =3D find_last_bit(sqp=
->in_use_bm, sdebug_max_queue);
c483739430f107 Douglas Gilbert 2016-05-06  4704  			seq_printf(m, "    in_u=
se_bm BUSY: %s: %d,%d\n",
c483739430f107 Douglas Gilbert 2016-05-06  4705  				   "first,last bits", =
f, l);
c483739430f107 Douglas Gilbert 2016-05-06  4706  		}
cbf67842c3d9e7 Douglas Gilbert 2014-07-26  4707  	}
87c715dcde633f Douglas Gilbert 2020-04-21  4708  =

87c715dcde633f Douglas Gilbert 2020-04-21  4709  	seq_printf(m, "this host_=
no=3D%d\n", host->host_no);
87c715dcde633f Douglas Gilbert 2020-04-21  4710  	if (!xa_empty(per_store_a=
p)) {
87c715dcde633f Douglas Gilbert 2020-04-21  4711  		bool niu;
87c715dcde633f Douglas Gilbert 2020-04-21  4712  		int idx;
87c715dcde633f Douglas Gilbert 2020-04-21  4713  		unsigned long l_idx;
87c715dcde633f Douglas Gilbert 2020-04-21  4714  		struct sdeb_store_info *=
sip;
87c715dcde633f Douglas Gilbert 2020-04-21  4715  =

87c715dcde633f Douglas Gilbert 2020-04-21  4716  		seq_puts(m, "\nhost list=
:\n");
87c715dcde633f Douglas Gilbert 2020-04-21  4717  		j =3D 0;
87c715dcde633f Douglas Gilbert 2020-04-21  4718  		list_for_each_entry(sdhp=
, &sdebug_host_list, host_list) {
87c715dcde633f Douglas Gilbert 2020-04-21  4719  			idx =3D sdhp->si_idx;
87c715dcde633f Douglas Gilbert 2020-04-21  4720  			seq_printf(m, "  %d: ho=
st_no=3D%d, si_idx=3D%d\n", j,
87c715dcde633f Douglas Gilbert 2020-04-21  4721  				   sdhp->shost->host_n=
o, idx);
87c715dcde633f Douglas Gilbert 2020-04-21  4722  			++j;
87c715dcde633f Douglas Gilbert 2020-04-21  4723  		}
87c715dcde633f Douglas Gilbert 2020-04-21  4724  		seq_printf(m, "\nper_sto=
re array [most_recent_idx=3D%d]:\n",
87c715dcde633f Douglas Gilbert 2020-04-21  4725  			   sdeb_most_recent_idx=
);
87c715dcde633f Douglas Gilbert 2020-04-21 @4726  		j =3D 0;
87c715dcde633f Douglas Gilbert 2020-04-21  4727  		xa_for_each(per_store_ap=
, l_idx, sip) {
87c715dcde633f Douglas Gilbert 2020-04-21  4728  			niu =3D xa_get_mark(per=
_store_ap, l_idx,
87c715dcde633f Douglas Gilbert 2020-04-21  4729  					  SDEB_XA_NOT_IN_USE);
87c715dcde633f Douglas Gilbert 2020-04-21  4730  			idx =3D (int)l_idx;
87c715dcde633f Douglas Gilbert 2020-04-21  4731  			seq_printf(m, "  %d: id=
x=3D%d%s\n", j, idx,
87c715dcde633f Douglas Gilbert 2020-04-21  4732  				   (niu ? "  not_in_us=
e" : ""));
87c715dcde633f Douglas Gilbert 2020-04-21  4733  			++j;
87c715dcde633f Douglas Gilbert 2020-04-21  4734  		}
87c715dcde633f Douglas Gilbert 2020-04-21  4735  	}
c8ed555aba1123 Al Viro         2013-03-31  4736  	return 0;
^1da177e4c3f41 Linus Torvalds  2005-04-16  4737  }
^1da177e4c3f41 Linus Torvalds  2005-04-16  4738  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8318834149418563417==--


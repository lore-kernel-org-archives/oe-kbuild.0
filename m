Content-Type: multipart/mixed; boundary="===============8870055434392805159=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/md/dm-stats.c:658:10: warning: Uninitialized variable: s->stat_flags [uninitvar]
Date: Tue, 07 Jun 2022 09:18:27 +0800
Message-ID: <202206070925.pYBBH5kG-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8870055434392805159==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/m=
d/dm-stats.c:658:10: warning: Uninitialized variable: s->stat_flags [uninit=
var]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Mike Snitzer <snitzer@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f2906aa863381afb0015a9eb7fefad885d4e5a56
commit: 8d394bc4adf588ca4a0650745167cb83f86c18c9 dm: fix double accounting =
of flush with data
date:   4 months ago
:::::: branch date: 25 hours ago
:::::: commit date: 4 months ago
compiler: riscv64-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 8d394bc4adf588ca4a0650745167cb83f86c18c9
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   drivers/md/dm-stats.c:398:10: warning: Uninitialized variable: s->id [un=
initvar]
     if (s->id > id)
            ^
   drivers/md/dm-stats.c:456:39: warning: Uninitialized variable: s->progra=
m_id [uninitvar]
     if (!program || !strcmp(program, s->program_id)) {
                                         ^
>> drivers/md/dm-stats.c:658:10: warning: Uninitialized variable: s->stat_f=
lags [uninitvar]
     if (s->stat_flags & STAT_PRECISE_TIMESTAMPS && !got_precise_time) {
            ^
   drivers/md/dm-stats.c:633:14: note: Assuming condition is false
    if (unlikely(!bi_sectors))
                ^
   drivers/md/dm-stats.c:658:10: note: Uninitialized variable: s->stat_flags
     if (s->stat_flags & STAT_PRECISE_TIMESTAMPS && !got_precise_time) {
            ^

vim +658 drivers/md/dm-stats.c

fd2ed4d252701d3 Mikulas Patocka   2013-08-16  621  =

fd2ed4d252701d3 Mikulas Patocka   2013-08-16  622  void dm_stats_account_io=
(struct dm_stats *stats, unsigned long bi_rw,
fd2ed4d252701d3 Mikulas Patocka   2013-08-16  623  			 sector_t bi_sector, =
unsigned bi_sectors, bool end,
8d394bc4adf588c Mike Snitzer      2022-02-17  624  			 unsigned long start_=
time,
c96aec344de0de8 Mikulas Patocka   2015-06-09  625  			 struct dm_stats_aux =
*stats_aux)
fd2ed4d252701d3 Mikulas Patocka   2013-08-16  626  {
fd2ed4d252701d3 Mikulas Patocka   2013-08-16  627  	struct dm_stat *s;
fd2ed4d252701d3 Mikulas Patocka   2013-08-16  628  	sector_t end_sector;
fd2ed4d252701d3 Mikulas Patocka   2013-08-16  629  	struct dm_stats_last_po=
sition *last;
c96aec344de0de8 Mikulas Patocka   2015-06-09  630  	bool got_precise_time;
8d394bc4adf588c Mike Snitzer      2022-02-17  631  	unsigned long duration_=
jiffies =3D 0;
fd2ed4d252701d3 Mikulas Patocka   2013-08-16  632  =

fd2ed4d252701d3 Mikulas Patocka   2013-08-16  633  	if (unlikely(!bi_sector=
s))
fd2ed4d252701d3 Mikulas Patocka   2013-08-16  634  		return;
fd2ed4d252701d3 Mikulas Patocka   2013-08-16  635  =

fd2ed4d252701d3 Mikulas Patocka   2013-08-16  636  	end_sector =3D bi_secto=
r + bi_sectors;
fd2ed4d252701d3 Mikulas Patocka   2013-08-16  637  =

fd2ed4d252701d3 Mikulas Patocka   2013-08-16  638  	if (!end) {
fd2ed4d252701d3 Mikulas Patocka   2013-08-16  639  		/*
fd2ed4d252701d3 Mikulas Patocka   2013-08-16  640  		 * A race condition ca=
n at worst result in the merged flag being
fd2ed4d252701d3 Mikulas Patocka   2013-08-16  641  		 * misrepresented, so =
we don't have to disable preemption here.
fd2ed4d252701d3 Mikulas Patocka   2013-08-16  642  		 */
1f125e76f5c134b Christoph Lameter 2014-08-17  643  		last =3D raw_cpu_ptr(s=
tats->last);
fd2ed4d252701d3 Mikulas Patocka   2013-08-16  644  		stats_aux->merged =3D
6aa7de059173a98 Mark Rutland      2017-10-23  645  			(bi_sector =3D=3D (RE=
AD_ONCE(last->last_sector) &&
528ec5abe6808c3 Mike Christie     2016-06-05  646  				       ((bi_rw =3D=
=3D WRITE) =3D=3D
6aa7de059173a98 Mark Rutland      2017-10-23  647  					(READ_ONCE(last->la=
st_rw) =3D=3D WRITE))
fd2ed4d252701d3 Mikulas Patocka   2013-08-16  648  				       ));
6aa7de059173a98 Mark Rutland      2017-10-23  649  		WRITE_ONCE(last->last_=
sector, end_sector);
6aa7de059173a98 Mark Rutland      2017-10-23  650  		WRITE_ONCE(last->last_=
rw, bi_rw);
8d394bc4adf588c Mike Snitzer      2022-02-17  651  	} else
8d394bc4adf588c Mike Snitzer      2022-02-17  652  		duration_jiffies =3D j=
iffies - start_time;
fd2ed4d252701d3 Mikulas Patocka   2013-08-16  653  =

fd2ed4d252701d3 Mikulas Patocka   2013-08-16  654  	rcu_read_lock();
fd2ed4d252701d3 Mikulas Patocka   2013-08-16  655  =

c96aec344de0de8 Mikulas Patocka   2015-06-09  656  	got_precise_time =3D fa=
lse;
c96aec344de0de8 Mikulas Patocka   2015-06-09  657  	list_for_each_entry_rcu=
(s, &stats->list, list_entry) {
c96aec344de0de8 Mikulas Patocka   2015-06-09 @658  		if (s->stat_flags & ST=
AT_PRECISE_TIMESTAMPS && !got_precise_time) {
c96aec344de0de8 Mikulas Patocka   2015-06-09  659  			if (!end)
c96aec344de0de8 Mikulas Patocka   2015-06-09  660  				stats_aux->duration_=
ns =3D ktime_to_ns(ktime_get());
c96aec344de0de8 Mikulas Patocka   2015-06-09  661  			else
c96aec344de0de8 Mikulas Patocka   2015-06-09  662  				stats_aux->duration_=
ns =3D ktime_to_ns(ktime_get()) - stats_aux->duration_ns;
c96aec344de0de8 Mikulas Patocka   2015-06-09  663  			got_precise_time =3D =
true;
c96aec344de0de8 Mikulas Patocka   2015-06-09  664  		}
c96aec344de0de8 Mikulas Patocka   2015-06-09  665  		__dm_stat_bio(s, bi_rw=
, bi_sector, end_sector, end, duration_jiffies, stats_aux);
c96aec344de0de8 Mikulas Patocka   2015-06-09  666  	}
fd2ed4d252701d3 Mikulas Patocka   2013-08-16  667  =

fd2ed4d252701d3 Mikulas Patocka   2013-08-16  668  	rcu_read_unlock();
fd2ed4d252701d3 Mikulas Patocka   2013-08-16  669  }
fd2ed4d252701d3 Mikulas Patocka   2013-08-16  670  =


:::::: The code at line 658 was first introduced by commit
:::::: c96aec344de0de857ef3d7fba53992c7ba311e1e dm stats: support precise t=
imestamps

:::::: TO: Mikulas Patocka <mpatocka@redhat.com>
:::::: CC: Mike Snitzer <snitzer@redhat.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8870055434392805159==--


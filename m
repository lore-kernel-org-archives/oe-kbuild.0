Content-Type: multipart/mixed; boundary="===============7134775873150697283=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: block/blk-throttle.c:1470:3: warning: %llu in format string (no. 1) requires 'unsigned long long' but the argument type is 'unsigned long'. [invalidPrintfArgType_uint]
Date: Sat, 28 May 2022 19:36:18 +0800
Message-ID: <202205281942.NGwMiBmP-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7134775873150697283==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Christoph Hellwig <hch@lst.de>
CC: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   8291eaafed36f575f23951f3ce18407f480e9ecf
commit: e4a19f7289f3fa9b2a4e65d0f4b3a7816e8e445b block: don't include blk-m=
q.h in blk.h
date:   6 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 6 months ago
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout e4a19f7289f3fa9b2a4e65d0f4b3a7816e8e445b
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)
>> block/blk-throttle.c:1470:3: warning: %llu in format string (no. 1) requ=
ires 'unsigned long long' but the argument type is 'unsigned long'. [invali=
dPrintfArgType_uint]
     snprintf(bufs[0], sizeof(bufs[0]), "%llu",
     ^
   block/blk-throttle.c:1473:3: warning: %llu in format string (no. 1) requ=
ires 'unsigned long long' but the argument type is 'unsigned long'. [invali=
dPrintfArgType_uint]
     snprintf(bufs[1], sizeof(bufs[1]), "%llu",
     ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> block/blk-throttle.c:1470:3: warning: %llu in format string (no. 1) requ=
ires 'unsigned long long' but the argument type is 'unsigned long'. [invali=
dPrintfArgType_uint]
     snprintf(bufs[0], sizeof(bufs[0]), "%llu",
     ^
   block/blk-throttle.c:1473:3: warning: %llu in format string (no. 1) requ=
ires 'unsigned long long' but the argument type is 'unsigned long'. [invali=
dPrintfArgType_uint]
     snprintf(bufs[1], sizeof(bufs[1]), "%llu",
     ^
>> block/blk-throttle.c:1767:21: warning: Parameter 'this_tg' can be declar=
ed with const [constParameter]
    struct throtl_grp *this_tg)
                       ^

vim +1470 block/blk-throttle.c

60c2bc2d5a1236 Tejun Heo  2012-04-01  1437  =

cd5ab1b0fcb44a Shaohua Li 2017-03-27  1438  static u64 tg_prfill_limit(stru=
ct seq_file *sf, struct blkg_policy_data *pd,
2ee867dcfa2eae Tejun Heo  2015-08-18  1439  			 int off)
2ee867dcfa2eae Tejun Heo  2015-08-18  1440  {
2ee867dcfa2eae Tejun Heo  2015-08-18  1441  	struct throtl_grp *tg =3D pd_t=
o_tg(pd);
2ee867dcfa2eae Tejun Heo  2015-08-18  1442  	const char *dname =3D blkg_dev=
_name(pd->blkg);
2ee867dcfa2eae Tejun Heo  2015-08-18  1443  	char bufs[4][21] =3D { "max", =
"max", "max", "max" };
cd5ab1b0fcb44a Shaohua Li 2017-03-27  1444  	u64 bps_dft;
cd5ab1b0fcb44a Shaohua Li 2017-03-27  1445  	unsigned int iops_dft;
ada75b6e5b2a93 Shaohua Li 2017-03-27  1446  	char idle_time[26] =3D "";
ec80991d6fc2cb Shaohua Li 2017-03-27  1447  	char latency_time[26] =3D "";
2ee867dcfa2eae Tejun Heo  2015-08-18  1448  =

2ee867dcfa2eae Tejun Heo  2015-08-18  1449  	if (!dname)
2ee867dcfa2eae Tejun Heo  2015-08-18  1450  		return 0;
9f626e372a6024 Shaohua Li 2017-03-27  1451  =

cd5ab1b0fcb44a Shaohua Li 2017-03-27  1452  	if (off =3D=3D LIMIT_LOW) {
cd5ab1b0fcb44a Shaohua Li 2017-03-27  1453  		bps_dft =3D 0;
cd5ab1b0fcb44a Shaohua Li 2017-03-27  1454  		iops_dft =3D 0;
cd5ab1b0fcb44a Shaohua Li 2017-03-27  1455  	} else {
cd5ab1b0fcb44a Shaohua Li 2017-03-27  1456  		bps_dft =3D U64_MAX;
cd5ab1b0fcb44a Shaohua Li 2017-03-27  1457  		iops_dft =3D UINT_MAX;
cd5ab1b0fcb44a Shaohua Li 2017-03-27  1458  	}
cd5ab1b0fcb44a Shaohua Li 2017-03-27  1459  =

cd5ab1b0fcb44a Shaohua Li 2017-03-27  1460  	if (tg->bps_conf[READ][off] =
=3D=3D bps_dft &&
cd5ab1b0fcb44a Shaohua Li 2017-03-27  1461  	    tg->bps_conf[WRITE][off] =
=3D=3D bps_dft &&
cd5ab1b0fcb44a Shaohua Li 2017-03-27  1462  	    tg->iops_conf[READ][off] =
=3D=3D iops_dft &&
ada75b6e5b2a93 Shaohua Li 2017-03-27  1463  	    tg->iops_conf[WRITE][off] =
=3D=3D iops_dft &&
ec80991d6fc2cb Shaohua Li 2017-03-27  1464  	    (off !=3D LIMIT_LOW ||
b4f428ef2844e9 Shaohua Li 2017-05-17  1465  	     (tg->idletime_threshold_c=
onf =3D=3D DFL_IDLE_THRESHOLD &&
5b81fc3cc625e8 Shaohua Li 2017-05-17  1466  	      tg->latency_target_conf =
=3D=3D DFL_LATENCY_TARGET)))
2ee867dcfa2eae Tejun Heo  2015-08-18  1467  		return 0;
2ee867dcfa2eae Tejun Heo  2015-08-18  1468  =

9bb67aeb967845 Shaohua Li 2017-05-17  1469  	if (tg->bps_conf[READ][off] !=
=3D U64_MAX)
9f626e372a6024 Shaohua Li 2017-03-27 @1470  		snprintf(bufs[0], sizeof(bufs=
[0]), "%llu",
cd5ab1b0fcb44a Shaohua Li 2017-03-27  1471  			tg->bps_conf[READ][off]);
9bb67aeb967845 Shaohua Li 2017-05-17  1472  	if (tg->bps_conf[WRITE][off] !=
=3D U64_MAX)
9f626e372a6024 Shaohua Li 2017-03-27  1473  		snprintf(bufs[1], sizeof(bufs=
[1]), "%llu",
cd5ab1b0fcb44a Shaohua Li 2017-03-27  1474  			tg->bps_conf[WRITE][off]);
9bb67aeb967845 Shaohua Li 2017-05-17  1475  	if (tg->iops_conf[READ][off] !=
=3D UINT_MAX)
9f626e372a6024 Shaohua Li 2017-03-27  1476  		snprintf(bufs[2], sizeof(bufs=
[2]), "%u",
cd5ab1b0fcb44a Shaohua Li 2017-03-27  1477  			tg->iops_conf[READ][off]);
9bb67aeb967845 Shaohua Li 2017-05-17  1478  	if (tg->iops_conf[WRITE][off] =
!=3D UINT_MAX)
9f626e372a6024 Shaohua Li 2017-03-27  1479  		snprintf(bufs[3], sizeof(bufs=
[3]), "%u",
cd5ab1b0fcb44a Shaohua Li 2017-03-27  1480  			tg->iops_conf[WRITE][off]);
ada75b6e5b2a93 Shaohua Li 2017-03-27  1481  	if (off =3D=3D LIMIT_LOW) {
5b81fc3cc625e8 Shaohua Li 2017-05-17  1482  		if (tg->idletime_threshold_co=
nf =3D=3D ULONG_MAX)
ada75b6e5b2a93 Shaohua Li 2017-03-27  1483  			strcpy(idle_time, " idle=3Dm=
ax");
ada75b6e5b2a93 Shaohua Li 2017-03-27  1484  		else
ada75b6e5b2a93 Shaohua Li 2017-03-27  1485  			snprintf(idle_time, sizeof(i=
dle_time), " idle=3D%lu",
5b81fc3cc625e8 Shaohua Li 2017-05-17  1486  				tg->idletime_threshold_conf=
);
ec80991d6fc2cb Shaohua Li 2017-03-27  1487  =

5b81fc3cc625e8 Shaohua Li 2017-05-17  1488  		if (tg->latency_target_conf =
=3D=3D ULONG_MAX)
ec80991d6fc2cb Shaohua Li 2017-03-27  1489  			strcpy(latency_time, " laten=
cy=3Dmax");
ec80991d6fc2cb Shaohua Li 2017-03-27  1490  		else
ec80991d6fc2cb Shaohua Li 2017-03-27  1491  			snprintf(latency_time, sizeo=
f(latency_time),
5b81fc3cc625e8 Shaohua Li 2017-05-17  1492  				" latency=3D%lu", tg->laten=
cy_target_conf);
ada75b6e5b2a93 Shaohua Li 2017-03-27  1493  	}
2ee867dcfa2eae Tejun Heo  2015-08-18  1494  =

ec80991d6fc2cb Shaohua Li 2017-03-27  1495  	seq_printf(sf, "%s rbps=3D%s w=
bps=3D%s riops=3D%s wiops=3D%s%s%s\n",
ec80991d6fc2cb Shaohua Li 2017-03-27  1496  		   dname, bufs[0], bufs[1], b=
ufs[2], bufs[3], idle_time,
ec80991d6fc2cb Shaohua Li 2017-03-27  1497  		   latency_time);
2ee867dcfa2eae Tejun Heo  2015-08-18  1498  	return 0;
2ee867dcfa2eae Tejun Heo  2015-08-18  1499  }
2ee867dcfa2eae Tejun Heo  2015-08-18  1500  =


:::::: The code at line 1470 was first introduced by commit
:::::: 9f626e372a602486fa319c2c6ab18e8068b30094 blk-throttle: prepare suppo=
rt multiple limits

:::::: TO: Shaohua Li <shli@fb.com>
:::::: CC: Jens Axboe <axboe@fb.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7134775873150697283==--


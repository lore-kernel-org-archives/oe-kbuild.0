Content-Type: multipart/mixed; boundary="===============4320097305882170731=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [jonmason-ntb:ntb-next 2/2] drivers/ntb/test/ntb_perf.c:1454:5-20: duplicated argument to && or ||
Date: Mon, 18 Apr 2022 11:50:35 +0800
Message-ID: <202204181138.SMFMdIbn-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4320097305882170731==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-ntb(a)googlegroups.com
CC: linux-kernel(a)vger.kernel.org
TO: Alexander Fomichev <fomichev.ru@gmail.com>
CC: Jon Mason <jdmason@kudzu.us>

tree:   https://github.com/jonmason/ntb ntb-next
head:   10003e852471b1214f4383d79592497b3f4c7b39
commit: 10003e852471b1214f4383d79592497b3f4c7b39 [2/2] ntb_perf: extend wit=
h burst/poll/doorbell latency measurement
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
config: s390-randconfig-c003-20220417 (https://download.01.org/0day-ci/arch=
ive/20220418/202204181138.SMFMdIbn-lkp(a)intel.com/config)
compiler: s390-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/ntb/test/ntb_perf.c:1454:5-20: duplicated argument to && or ||
   drivers/ntb/test/ntb_perf.c:1454:24-39: duplicated argument to && or ||

vim +1454 drivers/ntb/test/ntb_perf.c

10003e852471b1 Alexander Fomichev 2022-04-18  1449  =

10003e852471b1 Alexander Fomichev 2022-04-18  1450  static void perf_ext_la=
t_work(struct work_struct *work)
10003e852471b1 Alexander Fomichev 2022-04-18  1451  {
10003e852471b1 Alexander Fomichev 2022-04-18  1452  	struct perf_ext_lat_da=
ta *data =3D to_ext_lat_data(work);
10003e852471b1 Alexander Fomichev 2022-04-18  1453  =

10003e852471b1 Alexander Fomichev 2022-04-18 @1454  	if (!data->ops.init ||=
 !data->ops.init || !data->ops.init) {
10003e852471b1 Alexander Fomichev 2022-04-18  1455  		struct perf_ctx *perf=
 =3D data->perf;
10003e852471b1 Alexander Fomichev 2022-04-18  1456  =

10003e852471b1 Alexander Fomichev 2022-04-18  1457  		data->status =3D -EFA=
ULT;
10003e852471b1 Alexander Fomichev 2022-04-18  1458  		atomic_set(&perf->run=
ning, 0);
10003e852471b1 Alexander Fomichev 2022-04-18  1459  		wake_up(&perf->twait);
10003e852471b1 Alexander Fomichev 2022-04-18  1460  		return;
10003e852471b1 Alexander Fomichev 2022-04-18  1461  	}
10003e852471b1 Alexander Fomichev 2022-04-18  1462  =

10003e852471b1 Alexander Fomichev 2022-04-18  1463  	data->status =3D data-=
>ops.init(data);
10003e852471b1 Alexander Fomichev 2022-04-18  1464  	if (data->status)
10003e852471b1 Alexander Fomichev 2022-04-18  1465  		return;
10003e852471b1 Alexander Fomichev 2022-04-18  1466  =

10003e852471b1 Alexander Fomichev 2022-04-18  1467  	data->status =3D data-=
>ops.run(data);
10003e852471b1 Alexander Fomichev 2022-04-18  1468  =

10003e852471b1 Alexander Fomichev 2022-04-18  1469  	data->ops.clear(data);
10003e852471b1 Alexander Fomichev 2022-04-18  1470  }
10003e852471b1 Alexander Fomichev 2022-04-18  1471  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4320097305882170731==--


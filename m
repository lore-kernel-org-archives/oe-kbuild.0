Content-Type: multipart/mixed; boundary="===============6253235541860956388=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [mptcp:export 524/569] drivers/net/dsa/qca8k.c:293:46: warning: Uninitialized variable: val [uninitvar]
Date: Tue, 01 Jun 2021 04:57:22 +0800
Message-ID: <202106010417.kAl1BtmT-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6253235541860956388==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: mptcp(a)lists.linux.dev
TO: Yang Yingliang <yangyingliang@huawei.com>
CC: Jakub Kicinski <kuba@kernel.org>

tree:   https://github.com/multipath-tcp/mptcp_net-next.git export
head:   e0200f10bd651bddb5344ce2d61ef251a8a15f78
commit: 7c9896e37807862e276064dd9331860f5d27affc [524/569] net: dsa: qca8k:=
 check return value of read functions correctly
:::::: branch date: 5 hours ago
:::::: commit date: 24 hours ago
compiler: nios2-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/net/dsa/qca8k.c:293:46: warning: Uninitialized variable: val [un=
initvar]
    ret =3D read_poll_timeout(qca8k_read, ret1, !(val & mask),
                                                ^
   drivers/net/dsa/qca8k.c:632:52: warning: Uninitialized variable: val [un=
initvar]
    ret =3D read_poll_timeout(qca8k_mii_read32, ret1, !(val & mask), 0,
                                                      ^

vim +293 drivers/net/dsa/qca8k.c

6b93fb46480a9c John Crispin   2016-09-15  286  =

6b93fb46480a9c John Crispin   2016-09-15  287  static int
6b93fb46480a9c John Crispin   2016-09-15  288  qca8k_busy_wait(struct qca8k=
_priv *priv, u32 reg, u32 mask)
6b93fb46480a9c John Crispin   2016-09-15  289  {
7c9896e3780786 Yang Yingliang 2021-05-29  290  	int ret, ret1;
2ad255f2faaffb Ansuel Smith   2021-05-14  291  	u32 val;
6b93fb46480a9c John Crispin   2016-09-15  292  =

7c9896e3780786 Yang Yingliang 2021-05-29 @293  	ret =3D read_poll_timeout(q=
ca8k_read, ret1, !(val & mask),
2ad255f2faaffb Ansuel Smith   2021-05-14  294  				0, QCA8K_BUSY_WAIT_TIMEO=
UT * USEC_PER_MSEC, false,
7c9896e3780786 Yang Yingliang 2021-05-29  295  				priv, reg, &val);
6b93fb46480a9c John Crispin   2016-09-15  296  =

2ad255f2faaffb Ansuel Smith   2021-05-14  297  	/* Check if qca8k_read has =
failed for a different reason
2ad255f2faaffb Ansuel Smith   2021-05-14  298  	 * before returning -ETIMED=
OUT
2ad255f2faaffb Ansuel Smith   2021-05-14  299  	 */
7c9896e3780786 Yang Yingliang 2021-05-29  300  	if (ret < 0 && ret1 < 0)
7c9896e3780786 Yang Yingliang 2021-05-29  301  		return ret1;
6b93fb46480a9c John Crispin   2016-09-15  302  =

2ad255f2faaffb Ansuel Smith   2021-05-14  303  	return ret;
6b93fb46480a9c John Crispin   2016-09-15  304  }
6b93fb46480a9c John Crispin   2016-09-15  305  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============6253235541860956388==--


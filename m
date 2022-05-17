Content-Type: multipart/mixed; boundary="===============7439459493746520221=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/dsa/qca8k.c:293:46: warning: Uninitialized variable: val [uninitvar]
Date: Tue, 17 May 2022 21:26:27 +0800
Message-ID: <202205172138.8FxDSr1a-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7439459493746520221==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Yang Yingliang <yangyingliang@huawei.com>
CC: Jakub Kicinski <kuba@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   42226c989789d8da4af1de0c31070c96726d990c
commit: 7c9896e37807862e276064dd9331860f5d27affc net: dsa: qca8k: check ret=
urn value of read functions correctly
date:   12 months ago
:::::: branch date: 2 days ago
:::::: commit date: 12 months ago
compiler: powerpc64-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 7c9896e37807862e276064dd9331860f5d27affc
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   drivers/net/dsa/qca8k.c:1505:76: warning: Parameter 'br' can be declared=
 with const [constParameter]
   qca8k_port_bridge_join(struct dsa_switch *ds, int port, struct net_devic=
e *br)
                                                                           =
   ^
   drivers/net/dsa/qca8k.c:1534:77: warning: Parameter 'br' can be declared=
 with const [constParameter]
   qca8k_port_bridge_leave(struct dsa_switch *ds, int port, struct net_devi=
ce *br)
                                                                           =
    ^
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


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7439459493746520221==--


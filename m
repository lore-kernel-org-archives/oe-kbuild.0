Content-Type: multipart/mixed; boundary="===============8371930985521270554=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15 498/1080] drivers/ptp/ptp_xilinx.c:216:24: sparse: sparse: shift too big (47) for type unsigned long
Date: Wed, 06 Apr 2022 21:47:55 +0800
Message-ID: <202204062114.dRsSDUIr-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8371930985521270554==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-arm-kernel(a)lists.infradead.org
TO: Harini Katakam <harini.katakam@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>
CC: Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15
head:   4cf4408c2dbe725bb8530f851fbf277b9343f602
commit: 98c6cc90c5d398e87b8602a47eb26f9702064a0d [498/1080] ptp: Add Xilinx=
 PTP timer driver
:::::: branch date: 6 days ago
:::::: commit date: 9 weeks ago
config: parisc-randconfig-s031-20220406 (https://download.01.org/0day-ci/ar=
chive/20220406/202204062114.dRsSDUIr-lkp(a)intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/Xilinx/linux-xlnx/commit/98c6cc90c5d398e87b860=
2a47eb26f9702064a0d
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.15
        git checkout 98c6cc90c5d398e87b8602a47eb26f9702064a0d
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.2.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dp=
arisc SHELL=3D/bin/bash drivers/ptp/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> drivers/ptp/ptp_xilinx.c:216:24: sparse: sparse: shift too big (47) for =
type unsigned long
>> drivers/ptp/ptp_xilinx.c:107:51: sparse: sparse: shift count is negative=
 (-16)
   drivers/ptp/ptp_xilinx.c:347:50: sparse: sparse: shift count is negative=
 (-16)

vim +216 drivers/ptp/ptp_xilinx.c

98c6cc90c5d398 Harini Katakam 2020-09-24   89  =

98c6cc90c5d398 Harini Katakam 2020-09-24   90  /*
98c6cc90c5d398 Harini Katakam 2020-09-24   91   * Inline timer helpers
98c6cc90c5d398 Harini Katakam 2020-09-24   92   */
98c6cc90c5d398 Harini Katakam 2020-09-24   93  static inline void xlnx_tod_=
read(struct xlnx_ptp_timer *timer,
98c6cc90c5d398 Harini Katakam 2020-09-24   94  				 struct timespec64 *ts)
98c6cc90c5d398 Harini Katakam 2020-09-24   95  {
98c6cc90c5d398 Harini Katakam 2020-09-24   96  	u32 sech, secl, nsec;
98c6cc90c5d398 Harini Katakam 2020-09-24   97  =

98c6cc90c5d398 Harini Katakam 2020-09-24   98  	xlnx_ptp_iow(timer, XPTPTIM=
ER_TOD_SNAPSHOT_OFFSET,
98c6cc90c5d398 Harini Katakam 2020-09-24   99  		     XPTPTIMER_SNAPSHOT_MA=
SK);
98c6cc90c5d398 Harini Katakam 2020-09-24  100  =

98c6cc90c5d398 Harini Katakam 2020-09-24  101  	/* use TX port here */
98c6cc90c5d398 Harini Katakam 2020-09-24  102  	nsec =3D xlnx_ptp_ior(timer=
, XPTPTIMER_PORT_TX_NS_SNAP_OFFSET);
98c6cc90c5d398 Harini Katakam 2020-09-24  103  	secl =3D xlnx_ptp_ior(timer=
, XPTPTIMER_PORT_TX_SEC_0_SNAP_OFFSET);
98c6cc90c5d398 Harini Katakam 2020-09-24  104  	sech =3D xlnx_ptp_ior(timer=
, XPTPTIMER_PORT_TX_SEC_1_SNAP_OFFSET);
98c6cc90c5d398 Harini Katakam 2020-09-24  105  =

98c6cc90c5d398 Harini Katakam 2020-09-24  106  	ts->tv_nsec =3D nsec;
98c6cc90c5d398 Harini Katakam 2020-09-24 @107  	ts->tv_sec =3D (((u64)sech =
<< 32) | secl) & XPTPTIMER_MAX_SEC_MASK;
98c6cc90c5d398 Harini Katakam 2020-09-24  108  }
98c6cc90c5d398 Harini Katakam 2020-09-24  109  =

98c6cc90c5d398 Harini Katakam 2020-09-24  110  static inline void xlnx_tod_=
offset_write(struct xlnx_ptp_timer *timer,
98c6cc90c5d398 Harini Katakam 2020-09-24  111  					 const struct timespec6=
4 *ts)
98c6cc90c5d398 Harini Katakam 2020-09-24  112  {
98c6cc90c5d398 Harini Katakam 2020-09-24  113  	xlnx_ptp_iow(timer, XPTPTIM=
ER_TOD_SEC_SYS_OFST_1_OFFSET,
98c6cc90c5d398 Harini Katakam 2020-09-24  114  		     upper_32_bits(ts->tv_=
sec));
98c6cc90c5d398 Harini Katakam 2020-09-24  115  	xlnx_ptp_iow(timer, XPTPTIM=
ER_TOD_SEC_SYS_OFST_0_OFFSET,
98c6cc90c5d398 Harini Katakam 2020-09-24  116  		     lower_32_bits(ts->tv_=
sec));
98c6cc90c5d398 Harini Katakam 2020-09-24  117  	xlnx_ptp_iow(timer, XPTPTIM=
ER_TOD_NS_SYS_OFST_OFFSET,
98c6cc90c5d398 Harini Katakam 2020-09-24  118  		     (u32)(ts->tv_nsec));
98c6cc90c5d398 Harini Katakam 2020-09-24  119  =

98c6cc90c5d398 Harini Katakam 2020-09-24  120  	xlnx_ptp_iow(timer, XPTPTIM=
ER_TOD_SW_LOAD_OFFSET,
98c6cc90c5d398 Harini Katakam 2020-09-24  121  		     XPTPTIMER_LOAD_OFFSET=
_MASK);
98c6cc90c5d398 Harini Katakam 2020-09-24  122  }
98c6cc90c5d398 Harini Katakam 2020-09-24  123  =

98c6cc90c5d398 Harini Katakam 2020-09-24  124  static inline void xlnx_tod_=
load_write(struct xlnx_ptp_timer *timer,
98c6cc90c5d398 Harini Katakam 2020-09-24  125  				       const struct time=
spec64 *ts)
98c6cc90c5d398 Harini Katakam 2020-09-24  126  {
98c6cc90c5d398 Harini Katakam 2020-09-24  127  	struct timespec64 offset;
98c6cc90c5d398 Harini Katakam 2020-09-24  128  =

98c6cc90c5d398 Harini Katakam 2020-09-24  129  	offset.tv_sec =3D 0;
98c6cc90c5d398 Harini Katakam 2020-09-24  130  	offset.tv_nsec =3D 0;
98c6cc90c5d398 Harini Katakam 2020-09-24  131  =

98c6cc90c5d398 Harini Katakam 2020-09-24  132  	xlnx_ptp_iow(timer, XPTPTIM=
ER_TOD_SW_SEC_1_OFFSET,
98c6cc90c5d398 Harini Katakam 2020-09-24  133  		     upper_32_bits(ts->tv_=
sec));
98c6cc90c5d398 Harini Katakam 2020-09-24  134  	xlnx_ptp_iow(timer, XPTPTIM=
ER_TOD_SW_SEC_0_OFFSET,
98c6cc90c5d398 Harini Katakam 2020-09-24  135  		     lower_32_bits(ts->tv_=
sec));
98c6cc90c5d398 Harini Katakam 2020-09-24  136  	xlnx_ptp_iow(timer, XPTPTIM=
ER_TOD_SW_NS_OFFSET, ts->tv_nsec);
98c6cc90c5d398 Harini Katakam 2020-09-24  137  =

98c6cc90c5d398 Harini Katakam 2020-09-24  138  	/* Make sure offset registe=
rs are cleared */
98c6cc90c5d398 Harini Katakam 2020-09-24  139  	xlnx_tod_offset_write(timer=
, &offset);
98c6cc90c5d398 Harini Katakam 2020-09-24  140  	xlnx_ptp_iow(timer, XPTPTIM=
ER_TOD_SW_LOAD_OFFSET,
98c6cc90c5d398 Harini Katakam 2020-09-24  141  		     XPTPTIMER_LOAD_OFFSET=
_MASK);
98c6cc90c5d398 Harini Katakam 2020-09-24  142  =

98c6cc90c5d398 Harini Katakam 2020-09-24  143  	xlnx_ptp_iow(timer, XPTPTIM=
ER_TOD_SW_LOAD_OFFSET,
98c6cc90c5d398 Harini Katakam 2020-09-24  144  		     XPTPTIMER_LOAD_TOD_MA=
SK);
98c6cc90c5d398 Harini Katakam 2020-09-24  145  	timer->timeoffset =3D 0;
98c6cc90c5d398 Harini Katakam 2020-09-24  146  }
98c6cc90c5d398 Harini Katakam 2020-09-24  147  =

98c6cc90c5d398 Harini Katakam 2020-09-24  148  static inline void xlnx_port=
_period_write(struct xlnx_ptp_timer *timer, u64 adj)
98c6cc90c5d398 Harini Katakam 2020-09-24  149  {
98c6cc90c5d398 Harini Katakam 2020-09-24  150  	u32 adjhigh =3D upper_32_bi=
ts(adj);
98c6cc90c5d398 Harini Katakam 2020-09-24  151  =

98c6cc90c5d398 Harini Katakam 2020-09-24  152  	xlnx_ptp_iow(timer, XPTPTIM=
ER_PORT_TX_PERIOD_0_OFFSET, (u32)(adj));
98c6cc90c5d398 Harini Katakam 2020-09-24  153  	xlnx_ptp_iow(timer, XPTPTIM=
ER_PORT_RX_PERIOD_0_OFFSET, (u32)(adj));
98c6cc90c5d398 Harini Katakam 2020-09-24  154  	spin_lock(&timer->reg_lock);
98c6cc90c5d398 Harini Katakam 2020-09-24  155  	xlnx_ptp_iow(timer, XPTPTIM=
ER_PORT_TX_PERIOD_1_OFFSET, adjhigh);
98c6cc90c5d398 Harini Katakam 2020-09-24  156  	xlnx_ptp_iow(timer, XPTPTIM=
ER_PORT_RX_PERIOD_1_OFFSET, adjhigh);
98c6cc90c5d398 Harini Katakam 2020-09-24  157  =

98c6cc90c5d398 Harini Katakam 2020-09-24  158  	spin_unlock(&timer->reg_loc=
k);
98c6cc90c5d398 Harini Katakam 2020-09-24  159  }
98c6cc90c5d398 Harini Katakam 2020-09-24  160  =

98c6cc90c5d398 Harini Katakam 2020-09-24  161  /*
98c6cc90c5d398 Harini Katakam 2020-09-24  162   * PTP clock operations
98c6cc90c5d398 Harini Katakam 2020-09-24  163   */
98c6cc90c5d398 Harini Katakam 2020-09-24  164  /**
98c6cc90c5d398 Harini Katakam 2020-09-24  165   * xlnx_ptp_adjfine - Fine a=
djustment of the frequency on the hardware clock
98c6cc90c5d398 Harini Katakam 2020-09-24  166   * @ptp: ptp clock structure
98c6cc90c5d398 Harini Katakam 2020-09-24  167   * @scaled_ppm: signed scale=
d parts per million for frequency adjustment.
98c6cc90c5d398 Harini Katakam 2020-09-24  168   * Return: 0 on success
98c6cc90c5d398 Harini Katakam 2020-09-24  169   * TX and RX port periods ar=
e reloaded with the adjusted value.
98c6cc90c5d398 Harini Katakam 2020-09-24  170   *
98c6cc90c5d398 Harini Katakam 2020-09-24  171   */
98c6cc90c5d398 Harini Katakam 2020-09-24  172  static int xlnx_ptp_adjfine(=
struct ptp_clock_info *ptp, long scaled_ppm)
98c6cc90c5d398 Harini Katakam 2020-09-24  173  {
98c6cc90c5d398 Harini Katakam 2020-09-24  174  	struct xlnx_ptp_timer *time=
r =3D container_of(ptp, struct xlnx_ptp_timer,
98c6cc90c5d398 Harini Katakam 2020-09-24  175  					ptp_clock_info);
98c6cc90c5d398 Harini Katakam 2020-09-24  176  	bool neg_adj =3D false;
98c6cc90c5d398 Harini Katakam 2020-09-24  177  	u64 adj;
98c6cc90c5d398 Harini Katakam 2020-09-24  178  =

98c6cc90c5d398 Harini Katakam 2020-09-24  179  	if (scaled_ppm < 0) {
98c6cc90c5d398 Harini Katakam 2020-09-24  180  		neg_adj =3D true;
98c6cc90c5d398 Harini Katakam 2020-09-24  181  		scaled_ppm =3D -scaled_ppm;
98c6cc90c5d398 Harini Katakam 2020-09-24  182  	}
98c6cc90c5d398 Harini Katakam 2020-09-24  183  =

98c6cc90c5d398 Harini Katakam 2020-09-24  184  	adj =3D mul_u64_u32_div(tim=
er->incr, scaled_ppm, USEC_PER_SEC);
98c6cc90c5d398 Harini Katakam 2020-09-24  185  	adj >>=3D PPM_FRACTION; /* =
remove fractions */
98c6cc90c5d398 Harini Katakam 2020-09-24  186  	adj =3D neg_adj ? (timer->i=
ncr - adj) : (timer->incr + adj);
98c6cc90c5d398 Harini Katakam 2020-09-24  187  =

98c6cc90c5d398 Harini Katakam 2020-09-24  188  	xlnx_port_period_write(time=
r, adj);
98c6cc90c5d398 Harini Katakam 2020-09-24  189  =

98c6cc90c5d398 Harini Katakam 2020-09-24  190  	return 0;
98c6cc90c5d398 Harini Katakam 2020-09-24  191  }
98c6cc90c5d398 Harini Katakam 2020-09-24  192  =

98c6cc90c5d398 Harini Katakam 2020-09-24  193  /**
98c6cc90c5d398 Harini Katakam 2020-09-24  194   * xlnx_ptp_adjtime - Adjust=
 the current time on the hardware clock
98c6cc90c5d398 Harini Katakam 2020-09-24  195   * @ptp: ptp clock structure
98c6cc90c5d398 Harini Katakam 2020-09-24  196   * @delta: signed time in ns=
 to be adjusted.
98c6cc90c5d398 Harini Katakam 2020-09-24  197   * Return: 0 on success
98c6cc90c5d398 Harini Katakam 2020-09-24  198   * System, TX and RX ports a=
re reloaded with the adjusted time.
98c6cc90c5d398 Harini Katakam 2020-09-24  199   *
98c6cc90c5d398 Harini Katakam 2020-09-24  200   */
98c6cc90c5d398 Harini Katakam 2020-09-24  201  static int xlnx_ptp_adjtime(=
struct ptp_clock_info *ptp, s64 delta)
98c6cc90c5d398 Harini Katakam 2020-09-24  202  {
98c6cc90c5d398 Harini Katakam 2020-09-24  203  	struct xlnx_ptp_timer *time=
r =3D container_of(ptp, struct xlnx_ptp_timer,
98c6cc90c5d398 Harini Katakam 2020-09-24  204  						ptp_clock_info);
98c6cc90c5d398 Harini Katakam 2020-09-24  205  	struct timespec64 offset;
98c6cc90c5d398 Harini Katakam 2020-09-24  206  	u64 sign =3D 0;
98c6cc90c5d398 Harini Katakam 2020-09-24  207  	s64 cumulative_delta =3D ti=
mer->timeoffset;
98c6cc90c5d398 Harini Katakam 2020-09-24  208  =

98c6cc90c5d398 Harini Katakam 2020-09-24  209  	spin_lock(&timer->reg_lock);
98c6cc90c5d398 Harini Katakam 2020-09-24  210  =

98c6cc90c5d398 Harini Katakam 2020-09-24  211  	/* Fixed offset between sys=
tem and port timer */
98c6cc90c5d398 Harini Katakam 2020-09-24  212  	delta +=3D timer->static_de=
lay;
98c6cc90c5d398 Harini Katakam 2020-09-24  213  	cumulative_delta +=3D delta;
98c6cc90c5d398 Harini Katakam 2020-09-24  214  	timer->timeoffset =3D cumul=
ative_delta;
98c6cc90c5d398 Harini Katakam 2020-09-24  215  	if (cumulative_delta < 0) {
98c6cc90c5d398 Harini Katakam 2020-09-24 @216  		sign =3D XPTPTIMER_TOD_OFF=
SET_NEG;
98c6cc90c5d398 Harini Katakam 2020-09-24  217  		cumulative_delta =3D -cumu=
lative_delta;
98c6cc90c5d398 Harini Katakam 2020-09-24  218  	}
98c6cc90c5d398 Harini Katakam 2020-09-24  219  	offset =3D ns_to_timespec64=
(cumulative_delta);
98c6cc90c5d398 Harini Katakam 2020-09-24  220  	offset.tv_sec |=3D sign;
98c6cc90c5d398 Harini Katakam 2020-09-24  221  =

98c6cc90c5d398 Harini Katakam 2020-09-24  222  	xlnx_tod_offset_write(timer=
, (const struct timespec64 *)&offset);
98c6cc90c5d398 Harini Katakam 2020-09-24  223  =

98c6cc90c5d398 Harini Katakam 2020-09-24  224  	spin_unlock(&timer->reg_loc=
k);
98c6cc90c5d398 Harini Katakam 2020-09-24  225  =

98c6cc90c5d398 Harini Katakam 2020-09-24  226  	return 0;
98c6cc90c5d398 Harini Katakam 2020-09-24  227  }
98c6cc90c5d398 Harini Katakam 2020-09-24  228  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8371930985521270554==--


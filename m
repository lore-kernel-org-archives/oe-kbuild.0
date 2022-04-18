Content-Type: multipart/mixed; boundary="===============1523656349622131440=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/clk/clk-apple-nco.c:216:20: warning: Parameter 'parent_rate' can be declared with const [constParameter]
Date: Tue, 19 Apr 2022 03:13:59 +0800
Message-ID: <202204190342.2AtIuYEQ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1523656349622131440==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: "Martin Povi=C5=A1er" <povik+lin@cutebit.org>
CC: Stephen Boyd <sboyd@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b2d229d4ddb17db541098b83524d901257e93845
commit: 6641057d5dba87338780cf3e0d0ae8389ef1125c clk: clk-apple-nco: Add dr=
iver for Apple NCO
date:   5 weeks ago
:::::: branch date: 22 hours ago
:::::: commit date: 5 weeks ago
compiler: ia64-linux-gcc (GCC) 11.2.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 6641057d5dba87338780cf3e0d0ae8389ef1125c
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/clk/clk-apple-nco.c:216:20: warning: Parameter 'parent_rate' can=
 be declared with const [constParameter]
       unsigned long *parent_rate)
                      ^
>> drivers/clk/clk-apple-nco.c:180:19: warning: Shifting signed 32-bit valu=
e by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
    writel_relaxed(1 << 31, chan->base + REG_ACCINIT);
                     ^
   drivers/clk/clk-apple-nco.c:205:17: warning: Shifting signed 32-bit valu=
e by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
    if (inc1 >=3D (1 << 31) || inc2 < (1 << 31) || (inc1 =3D=3D 0 && inc2 =
=3D=3D 0))
                   ^
>> drivers/clk/clk-apple-nco.c:180:19: warning: Signed integer overflow for=
 expression '1<<31'. [integerOverflow]
    writel_relaxed(1 << 31, chan->base + REG_ACCINIT);
                     ^
   drivers/clk/clk-apple-nco.c:205:17: warning: Signed integer overflow for=
 expression '1<<31'. [integerOverflow]
    if (inc1 >=3D (1 << 31) || inc2 < (1 << 31) || (inc1 =3D=3D 0 && inc2 =
=3D=3D 0))
                   ^
--
>> drivers/pwm/pwm-mediatek.c:246:3: warning: %d in format string (no. 1) r=
equires 'int' but the argument type is 'unsigned int'. [invalidPrintfArgTyp=
e_sint]
     snprintf(name, sizeof(name), "pwm%d", i + 1);
     ^
--
>> drivers/clk/sifive/sifive-prci.c:237:10: warning: Shifting signed 32-bit=
 value by 31 bits is implementation-defined behaviour [shiftTooManyBitsSign=
ed]
    if (r & PRCI_COREPLLCFG1_CKE_MASK)
            ^
   drivers/clk/sifive/sifive-prci.c:252:35: warning: Shifting signed 32-bit=
 value by 31 bits is implementation-defined behaviour [shiftTooManyBitsSign=
ed]
    __prci_wrpll_write_cfg1(pd, pwd, PRCI_COREPLLCFG1_CKE_MASK);
                                     ^
   drivers/clk/sifive/sifive-prci.c:271:8: warning: Shifting signed 32-bit =
value by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigne=
d]
    r &=3D ~PRCI_COREPLLCFG1_CKE_MASK;
          ^
>> drivers/clk/sifive/sifive-prci.c:237:10: warning: Signed integer overflo=
w for expression '0x1<<31'. [integerOverflow]
    if (r & PRCI_COREPLLCFG1_CKE_MASK)
            ^
   drivers/clk/sifive/sifive-prci.c:252:35: warning: Signed integer overflo=
w for expression '0x1<<31'. [integerOverflow]
    __prci_wrpll_write_cfg1(pd, pwd, PRCI_COREPLLCFG1_CKE_MASK);
                                     ^
   drivers/clk/sifive/sifive-prci.c:271:8: warning: Signed integer overflow=
 for expression '0x1<<31'. [integerOverflow]
    r &=3D ~PRCI_COREPLLCFG1_CKE_MASK;
          ^
>> drivers/clk/qcom/clk-smd-rpm.c:293:40: warning: Same expression in both =
branches of ternary operator. [duplicateExpressionTernary]
    active_rate =3D r->branch ? !!peer_rate : peer_rate;
                                          ^
   drivers/clk/qcom/clk-smd-rpm.c:298:45: warning: Same expression in both =
branches of ternary operator. [duplicateExpressionTernary]
    sleep_rate =3D r->branch ? !!peer_sleep_rate : peer_sleep_rate;
                                               ^
--
>> drivers/vfio/platform/vfio_platform_common.c:701:34: warning: Parameter =
'fn' can be declared with const [constParameter]
           vfio_platform_reset_fn_t fn)
                                    ^
>> drivers/vfio/platform/vfio_platform_common.c:442:47: warning: Parameter =
'ppos' can be declared with const [constParameter]
         char __user *buf, size_t count, loff_t *ppos)
                                                 ^
   drivers/vfio/platform/vfio_platform_common.c:519:30: warning: Parameter =
'ppos' can be declared with const [constParameter]
          size_t count, loff_t *ppos)
                                ^
>> drivers/vfio/platform/vfio_platform_common.c:39:21: warning: Uninitializ=
ed variable: iter->compat [uninitvar]
     if (!strcmp(iter->compat, compat) &&
                       ^
   drivers/vfio/platform/vfio_platform_common.c:707:21: warning: Uninitiali=
zed variable: iter->compat [uninitvar]
     if (!strcmp(iter->compat, compat) && (iter->of_reset =3D=3D fn)) {
                       ^

vim +/parent_rate +216 drivers/clk/clk-apple-nco.c

6641057d5dba87 Martin Povi=C5=A1er 2022-02-08  153  =

6641057d5dba87 Martin Povi=C5=A1er 2022-02-08  154  static int applnco_set_=
rate(struct clk_hw *hw, unsigned long rate,
6641057d5dba87 Martin Povi=C5=A1er 2022-02-08  155  				unsigned long paren=
t_rate)
6641057d5dba87 Martin Povi=C5=A1er 2022-02-08  156  {
6641057d5dba87 Martin Povi=C5=A1er 2022-02-08  157  	struct applnco_channel=
 *chan =3D to_applnco_channel(hw);
6641057d5dba87 Martin Povi=C5=A1er 2022-02-08  158  	unsigned long flags;
6641057d5dba87 Martin Povi=C5=A1er 2022-02-08  159  	u32 div, inc1, inc2;
6641057d5dba87 Martin Povi=C5=A1er 2022-02-08  160  	bool was_enabled;
6641057d5dba87 Martin Povi=C5=A1er 2022-02-08  161  =

6641057d5dba87 Martin Povi=C5=A1er 2022-02-08  162  	div =3D 2 * parent_rat=
e / rate;
6641057d5dba87 Martin Povi=C5=A1er 2022-02-08  163  	inc1 =3D 2 * parent_ra=
te - div * rate;
6641057d5dba87 Martin Povi=C5=A1er 2022-02-08  164  	inc2 =3D inc1 - rate;
6641057d5dba87 Martin Povi=C5=A1er 2022-02-08  165  =

6641057d5dba87 Martin Povi=C5=A1er 2022-02-08  166  	if (applnco_div_out_of=
_range(div))
6641057d5dba87 Martin Povi=C5=A1er 2022-02-08  167  		return -EINVAL;
6641057d5dba87 Martin Povi=C5=A1er 2022-02-08  168  =

6641057d5dba87 Martin Povi=C5=A1er 2022-02-08  169  	div =3D applnco_div_tr=
anslate(chan->tbl, div);
6641057d5dba87 Martin Povi=C5=A1er 2022-02-08  170  =

6641057d5dba87 Martin Povi=C5=A1er 2022-02-08  171  	spin_lock_irqsave(&cha=
n->lock, flags);
6641057d5dba87 Martin Povi=C5=A1er 2022-02-08  172  	was_enabled =3D applnc=
o_is_enabled(hw);
6641057d5dba87 Martin Povi=C5=A1er 2022-02-08  173  	applnco_disable_nolock=
(hw);
6641057d5dba87 Martin Povi=C5=A1er 2022-02-08  174  =

6641057d5dba87 Martin Povi=C5=A1er 2022-02-08  175  	writel_relaxed(div,  c=
han->base + REG_DIV);
6641057d5dba87 Martin Povi=C5=A1er 2022-02-08  176  	writel_relaxed(inc1, c=
han->base + REG_INC1);
6641057d5dba87 Martin Povi=C5=A1er 2022-02-08  177  	writel_relaxed(inc2, c=
han->base + REG_INC2);
6641057d5dba87 Martin Povi=C5=A1er 2022-02-08  178  =

6641057d5dba87 Martin Povi=C5=A1er 2022-02-08  179  	/* Presumably a neutra=
l initial value for accumulator */
6641057d5dba87 Martin Povi=C5=A1er 2022-02-08 @180  	writel_relaxed(1 << 31=
, chan->base + REG_ACCINIT);
6641057d5dba87 Martin Povi=C5=A1er 2022-02-08  181  =

6641057d5dba87 Martin Povi=C5=A1er 2022-02-08  182  	if (was_enabled)
6641057d5dba87 Martin Povi=C5=A1er 2022-02-08  183  		applnco_enable_nolock=
(hw);
6641057d5dba87 Martin Povi=C5=A1er 2022-02-08  184  	spin_unlock_irqrestore=
(&chan->lock, flags);
6641057d5dba87 Martin Povi=C5=A1er 2022-02-08  185  =

6641057d5dba87 Martin Povi=C5=A1er 2022-02-08  186  	return 0;
6641057d5dba87 Martin Povi=C5=A1er 2022-02-08  187  }
6641057d5dba87 Martin Povi=C5=A1er 2022-02-08  188  =

6641057d5dba87 Martin Povi=C5=A1er 2022-02-08  189  static unsigned long ap=
plnco_recalc_rate(struct clk_hw *hw,
6641057d5dba87 Martin Povi=C5=A1er 2022-02-08  190  				unsigned long paren=
t_rate)
6641057d5dba87 Martin Povi=C5=A1er 2022-02-08  191  {
6641057d5dba87 Martin Povi=C5=A1er 2022-02-08  192  	struct applnco_channel=
 *chan =3D to_applnco_channel(hw);
6641057d5dba87 Martin Povi=C5=A1er 2022-02-08  193  	u32 div, inc1, inc2, i=
ncbase;
6641057d5dba87 Martin Povi=C5=A1er 2022-02-08  194  =

6641057d5dba87 Martin Povi=C5=A1er 2022-02-08  195  	div =3D applnco_div_tr=
anslate_inv(chan->tbl,
6641057d5dba87 Martin Povi=C5=A1er 2022-02-08  196  			readl_relaxed(chan->=
base + REG_DIV));
6641057d5dba87 Martin Povi=C5=A1er 2022-02-08  197  =

6641057d5dba87 Martin Povi=C5=A1er 2022-02-08  198  	inc1 =3D readl_relaxed=
(chan->base + REG_INC1);
6641057d5dba87 Martin Povi=C5=A1er 2022-02-08  199  	inc2 =3D readl_relaxed=
(chan->base + REG_INC2);
6641057d5dba87 Martin Povi=C5=A1er 2022-02-08  200  =

6641057d5dba87 Martin Povi=C5=A1er 2022-02-08  201  	/*
6641057d5dba87 Martin Povi=C5=A1er 2022-02-08  202  	 * We don't support wr=
aparound of accumulator
6641057d5dba87 Martin Povi=C5=A1er 2022-02-08  203  	 * nor the edge case o=
f both increments being zero
6641057d5dba87 Martin Povi=C5=A1er 2022-02-08  204  	 */
6641057d5dba87 Martin Povi=C5=A1er 2022-02-08  205  	if (inc1 >=3D (1 << 31=
) || inc2 < (1 << 31) || (inc1 =3D=3D 0 && inc2 =3D=3D 0))
6641057d5dba87 Martin Povi=C5=A1er 2022-02-08  206  		return 0;
6641057d5dba87 Martin Povi=C5=A1er 2022-02-08  207  =

6641057d5dba87 Martin Povi=C5=A1er 2022-02-08  208  	/* Scale both sides of=
 division by incbase to maintain precision */
6641057d5dba87 Martin Povi=C5=A1er 2022-02-08  209  	incbase =3D inc1 - inc=
2;
6641057d5dba87 Martin Povi=C5=A1er 2022-02-08  210  =

6641057d5dba87 Martin Povi=C5=A1er 2022-02-08  211  	return div64_u64(((u64=
) parent_rate) * 2 * incbase,
6641057d5dba87 Martin Povi=C5=A1er 2022-02-08  212  			((u64) div) * incbas=
e + inc1);
6641057d5dba87 Martin Povi=C5=A1er 2022-02-08  213  }
6641057d5dba87 Martin Povi=C5=A1er 2022-02-08  214  =

6641057d5dba87 Martin Povi=C5=A1er 2022-02-08  215  static long applnco_rou=
nd_rate(struct clk_hw *hw, unsigned long rate,
6641057d5dba87 Martin Povi=C5=A1er 2022-02-08 @216  				unsigned long *pare=
nt_rate)
6641057d5dba87 Martin Povi=C5=A1er 2022-02-08  217  {
6641057d5dba87 Martin Povi=C5=A1er 2022-02-08  218  	unsigned long lo =3D *=
parent_rate / (COARSE_DIV_OFFSET + LFSR_TBLSIZE) + 1;
6641057d5dba87 Martin Povi=C5=A1er 2022-02-08  219  	unsigned long hi =3D *=
parent_rate / COARSE_DIV_OFFSET;
6641057d5dba87 Martin Povi=C5=A1er 2022-02-08  220  =

6641057d5dba87 Martin Povi=C5=A1er 2022-02-08  221  	return clamp(rate, lo,=
 hi);
6641057d5dba87 Martin Povi=C5=A1er 2022-02-08  222  }
6641057d5dba87 Martin Povi=C5=A1er 2022-02-08  223  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1523656349622131440==--


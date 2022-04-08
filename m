Content-Type: multipart/mixed; boundary="===============6891075701273135015=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/clk/clk-apple-nco.c:216:20: warning: Parameter 'parent_rate' can be declared with const [constParameter]
Date: Fri, 08 Apr 2022 22:20:20 +0800
Message-ID: <202204082212.Qpe6iBSB-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6891075701273135015==
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
head:   1831fed559732b132aef0ea8261ac77e73f7eadf
commit: 6641057d5dba87338780cf3e0d0ae8389ef1125c clk: clk-apple-nco: Add dr=
iver for Apple NCO
date:   4 weeks ago
:::::: branch date: 9 hours ago
:::::: commit date: 4 weeks ago
compiler: aarch64-linux-gcc (GCC) 11.2.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 6641057d5dba87338780cf3e0d0ae8389ef1125c
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/clk/socfpga/clk-s10.c:401:53: warning: Uninitialized variable: c=
lk_data [uninitvar]
    clk_data =3D devm_kzalloc(dev, struct_size(clk_data, clk_data.hws,
                                                       ^
--
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
>> drivers/dma/qcom/hidma.c:135:48: warning: Uninitialized variable: mdesc-=
>tre_ch [uninitvar]
     llstat =3D hidma_ll_status(mdma->lldev, mdesc->tre_ch);
                                                  ^
>> drivers/dma/qcom/hidma.c:239:48: warning: Uninitialized variable: qdesc-=
>tre_ch [uninitvar]
     hidma_ll_queue_request(dmadev->lldev, qdesc->tre_ch);
                                                  ^
   drivers/dma/qcom/hidma.c:542:37: warning: Uninitialized variable: mdesc-=
>tre_ch [uninitvar]
     hidma_ll_free(mdma->lldev, mdesc->tre_ch);
                                       ^

vim +/parent_rate +216 drivers/clk/clk-apple-nco.c

6641057d5dba873 Martin Povi=C5=A1er 2022-02-08  153  =

6641057d5dba873 Martin Povi=C5=A1er 2022-02-08  154  static int applnco_set=
_rate(struct clk_hw *hw, unsigned long rate,
6641057d5dba873 Martin Povi=C5=A1er 2022-02-08  155  				unsigned long pare=
nt_rate)
6641057d5dba873 Martin Povi=C5=A1er 2022-02-08  156  {
6641057d5dba873 Martin Povi=C5=A1er 2022-02-08  157  	struct applnco_channe=
l *chan =3D to_applnco_channel(hw);
6641057d5dba873 Martin Povi=C5=A1er 2022-02-08  158  	unsigned long flags;
6641057d5dba873 Martin Povi=C5=A1er 2022-02-08  159  	u32 div, inc1, inc2;
6641057d5dba873 Martin Povi=C5=A1er 2022-02-08  160  	bool was_enabled;
6641057d5dba873 Martin Povi=C5=A1er 2022-02-08  161  =

6641057d5dba873 Martin Povi=C5=A1er 2022-02-08  162  	div =3D 2 * parent_ra=
te / rate;
6641057d5dba873 Martin Povi=C5=A1er 2022-02-08  163  	inc1 =3D 2 * parent_r=
ate - div * rate;
6641057d5dba873 Martin Povi=C5=A1er 2022-02-08  164  	inc2 =3D inc1 - rate;
6641057d5dba873 Martin Povi=C5=A1er 2022-02-08  165  =

6641057d5dba873 Martin Povi=C5=A1er 2022-02-08  166  	if (applnco_div_out_o=
f_range(div))
6641057d5dba873 Martin Povi=C5=A1er 2022-02-08  167  		return -EINVAL;
6641057d5dba873 Martin Povi=C5=A1er 2022-02-08  168  =

6641057d5dba873 Martin Povi=C5=A1er 2022-02-08  169  	div =3D applnco_div_t=
ranslate(chan->tbl, div);
6641057d5dba873 Martin Povi=C5=A1er 2022-02-08  170  =

6641057d5dba873 Martin Povi=C5=A1er 2022-02-08  171  	spin_lock_irqsave(&ch=
an->lock, flags);
6641057d5dba873 Martin Povi=C5=A1er 2022-02-08  172  	was_enabled =3D appln=
co_is_enabled(hw);
6641057d5dba873 Martin Povi=C5=A1er 2022-02-08  173  	applnco_disable_noloc=
k(hw);
6641057d5dba873 Martin Povi=C5=A1er 2022-02-08  174  =

6641057d5dba873 Martin Povi=C5=A1er 2022-02-08  175  	writel_relaxed(div,  =
chan->base + REG_DIV);
6641057d5dba873 Martin Povi=C5=A1er 2022-02-08  176  	writel_relaxed(inc1, =
chan->base + REG_INC1);
6641057d5dba873 Martin Povi=C5=A1er 2022-02-08  177  	writel_relaxed(inc2, =
chan->base + REG_INC2);
6641057d5dba873 Martin Povi=C5=A1er 2022-02-08  178  =

6641057d5dba873 Martin Povi=C5=A1er 2022-02-08  179  	/* Presumably a neutr=
al initial value for accumulator */
6641057d5dba873 Martin Povi=C5=A1er 2022-02-08 @180  	writel_relaxed(1 << 3=
1, chan->base + REG_ACCINIT);
6641057d5dba873 Martin Povi=C5=A1er 2022-02-08  181  =

6641057d5dba873 Martin Povi=C5=A1er 2022-02-08  182  	if (was_enabled)
6641057d5dba873 Martin Povi=C5=A1er 2022-02-08  183  		applnco_enable_noloc=
k(hw);
6641057d5dba873 Martin Povi=C5=A1er 2022-02-08  184  	spin_unlock_irqrestor=
e(&chan->lock, flags);
6641057d5dba873 Martin Povi=C5=A1er 2022-02-08  185  =

6641057d5dba873 Martin Povi=C5=A1er 2022-02-08  186  	return 0;
6641057d5dba873 Martin Povi=C5=A1er 2022-02-08  187  }
6641057d5dba873 Martin Povi=C5=A1er 2022-02-08  188  =

6641057d5dba873 Martin Povi=C5=A1er 2022-02-08  189  static unsigned long a=
pplnco_recalc_rate(struct clk_hw *hw,
6641057d5dba873 Martin Povi=C5=A1er 2022-02-08  190  				unsigned long pare=
nt_rate)
6641057d5dba873 Martin Povi=C5=A1er 2022-02-08  191  {
6641057d5dba873 Martin Povi=C5=A1er 2022-02-08  192  	struct applnco_channe=
l *chan =3D to_applnco_channel(hw);
6641057d5dba873 Martin Povi=C5=A1er 2022-02-08  193  	u32 div, inc1, inc2, =
incbase;
6641057d5dba873 Martin Povi=C5=A1er 2022-02-08  194  =

6641057d5dba873 Martin Povi=C5=A1er 2022-02-08  195  	div =3D applnco_div_t=
ranslate_inv(chan->tbl,
6641057d5dba873 Martin Povi=C5=A1er 2022-02-08  196  			readl_relaxed(chan-=
>base + REG_DIV));
6641057d5dba873 Martin Povi=C5=A1er 2022-02-08  197  =

6641057d5dba873 Martin Povi=C5=A1er 2022-02-08  198  	inc1 =3D readl_relaxe=
d(chan->base + REG_INC1);
6641057d5dba873 Martin Povi=C5=A1er 2022-02-08  199  	inc2 =3D readl_relaxe=
d(chan->base + REG_INC2);
6641057d5dba873 Martin Povi=C5=A1er 2022-02-08  200  =

6641057d5dba873 Martin Povi=C5=A1er 2022-02-08  201  	/*
6641057d5dba873 Martin Povi=C5=A1er 2022-02-08  202  	 * We don't support w=
raparound of accumulator
6641057d5dba873 Martin Povi=C5=A1er 2022-02-08  203  	 * nor the edge case =
of both increments being zero
6641057d5dba873 Martin Povi=C5=A1er 2022-02-08  204  	 */
6641057d5dba873 Martin Povi=C5=A1er 2022-02-08  205  	if (inc1 >=3D (1 << 3=
1) || inc2 < (1 << 31) || (inc1 =3D=3D 0 && inc2 =3D=3D 0))
6641057d5dba873 Martin Povi=C5=A1er 2022-02-08  206  		return 0;
6641057d5dba873 Martin Povi=C5=A1er 2022-02-08  207  =

6641057d5dba873 Martin Povi=C5=A1er 2022-02-08  208  	/* Scale both sides o=
f division by incbase to maintain precision */
6641057d5dba873 Martin Povi=C5=A1er 2022-02-08  209  	incbase =3D inc1 - in=
c2;
6641057d5dba873 Martin Povi=C5=A1er 2022-02-08  210  =

6641057d5dba873 Martin Povi=C5=A1er 2022-02-08  211  	return div64_u64(((u6=
4) parent_rate) * 2 * incbase,
6641057d5dba873 Martin Povi=C5=A1er 2022-02-08  212  			((u64) div) * incba=
se + inc1);
6641057d5dba873 Martin Povi=C5=A1er 2022-02-08  213  }
6641057d5dba873 Martin Povi=C5=A1er 2022-02-08  214  =

6641057d5dba873 Martin Povi=C5=A1er 2022-02-08  215  static long applnco_ro=
und_rate(struct clk_hw *hw, unsigned long rate,
6641057d5dba873 Martin Povi=C5=A1er 2022-02-08 @216  				unsigned long *par=
ent_rate)
6641057d5dba873 Martin Povi=C5=A1er 2022-02-08  217  {
6641057d5dba873 Martin Povi=C5=A1er 2022-02-08  218  	unsigned long lo =3D =
*parent_rate / (COARSE_DIV_OFFSET + LFSR_TBLSIZE) + 1;
6641057d5dba873 Martin Povi=C5=A1er 2022-02-08  219  	unsigned long hi =3D =
*parent_rate / COARSE_DIV_OFFSET;
6641057d5dba873 Martin Povi=C5=A1er 2022-02-08  220  =

6641057d5dba873 Martin Povi=C5=A1er 2022-02-08  221  	return clamp(rate, lo=
, hi);
6641057d5dba873 Martin Povi=C5=A1er 2022-02-08  222  }
6641057d5dba873 Martin Povi=C5=A1er 2022-02-08  223  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6891075701273135015==--


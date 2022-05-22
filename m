Content-Type: multipart/mixed; boundary="===============0293455117841335269=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 12283/13468] drivers/rtc/rtc-rzn1.c:291:3: warning: Uninitialized variable: val [uninitvar]
Date: Sun, 22 May 2022 19:29:17 +0800
Message-ID: <202205221908.UuYa7GbQ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0293455117841335269==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   18ecd30af1a8402c162cca1bd58771c0e5be7815
commit: be4a11cf98aff5d456eae947a49b6163393d9420 [12283/13468] rtc: rzn1: A=
dd oscillator offset support
:::::: branch date: 2 days ago
:::::: commit date: 5 days ago
compiler: arc-elf-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout be4a11cf98aff5d456eae947a49b6163393d9420
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)
>> net/rxrpc/input.c:469:18: warning: Local variable 'serial' shadows outer=
 variable [shadowVariable]
     rxrpc_serial_t serial =3D sp->hdr.serial + j;
                    ^
   net/rxrpc/input.c:416:17: note: Shadowed declaration
    rxrpc_serial_t serial =3D sp->hdr.serial, ack_serial =3D 0;
                   ^
   net/rxrpc/input.c:469:18: note: Shadow variable
     rxrpc_serial_t serial =3D sp->hdr.serial + j;
                    ^
--

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/rtc/rtc-rzn1.c:291:3: warning: Uninitialized variable: val [unin=
itvar]
     val |=3D RZN1_RTC_SUBU_DEV;
     ^
--
>> net/ipv4/netfilter/ipt_CLUSTERIP.c:154:10: warning: Uninitialized variab=
le: c->clusterip [uninitvar]
     if (c->clusterip =3D=3D clusterip)
            ^
>> net/ipv4/netfilter/ipt_CLUSTERIP.c:705:62: warning: Parameter 'pos' can =
be declared with const [constParameter]
   static void *clusterip_seq_start(struct seq_file *s, loff_t *pos)
                                                                ^
--
>> net/rxrpc/conn_object.c:356:2: warning: Syntax Error: AST broken, 'conn'=
 doesn't have a parent. [internalAstError]
    ASSERTCMP(atomic_read(&conn->usage), =3D=3D, 0);
    ^
--
>> net/rxrpc/call_object.c:536:2: warning: Syntax Error: AST broken, 'call'=
 doesn't have a parent. [internalAstError]
    ASSERTCMP(call->state, =3D=3D, RXRPC_CALL_COMPLETE);
    ^
--
>> net/rxrpc/conn_client.c:806:3: warning: Syntax Error: AST broken, 'call'=
 doesn't have a parent. [internalAstError]
     ASSERTCMP(call->call_id, =3D=3D, 0);
     ^
--
>> net/rxrpc/sendmsg.c:369:4: warning: Syntax Error: AST broken, 'skb' does=
n't have a parent. [internalAstError]
      ASSERTCMP(skb->mark, =3D=3D, 0);
      ^
--
>> net/netfilter/core.c:330:41: warning: Parameter 'net' can be declared wi=
th const [constParameter]
   static int nf_ingress_check(struct net *net, const struct nf_hook_ops *r=
eg,
                                           ^
--
>> net/netfilter/nf_nat_proto.c:500:25: warning: Parameter 'data' can be de=
clared with const [constParameter]
           u8 proto, void *data, __sum16 *check,
                           ^
>> kernel/bpf/syscall.c:2924:12: warning: Boolean result is used in bitwise=
 operation. Clarify expression with parentheses. [clarifyCondition]
    if (!ulen ^ !ubuf)
              ^
>> kernel/bpf/syscall.c:1982:28: warning: Parameter 'attach_type' can be de=
clared with const [constParameter]
          enum bpf_prog_type *attach_type, bool attach_drv)
                              ^
>> kernel/bpf/syscall.c:2062:19: warning: Parameter 'attach_btf' can be dec=
lared with const [constParameter]
         struct btf *attach_btf, u32 btf_id,
                     ^
>> kernel/bpf/syscall.c:2063:24: warning: Parameter 'dst_prog' can be decla=
red with const [constParameter]
         struct bpf_prog *dst_prog)
                          ^

vim +291 drivers/rtc/rtc-rzn1.c

be4a11cf98aff5 Miquel Raynal 2022-05-16  269  =

be4a11cf98aff5 Miquel Raynal 2022-05-16  270  static int rzn1_rtc_set_offse=
t(struct device *dev, long offset)
be4a11cf98aff5 Miquel Raynal 2022-05-16  271  {
be4a11cf98aff5 Miquel Raynal 2022-05-16  272  	struct rzn1_rtc *rtc =3D dev=
_get_drvdata(dev);
be4a11cf98aff5 Miquel Raynal 2022-05-16  273  	unsigned int steps;
be4a11cf98aff5 Miquel Raynal 2022-05-16  274  	int stepsh, stepsl;
be4a11cf98aff5 Miquel Raynal 2022-05-16  275  	u32 val;
be4a11cf98aff5 Miquel Raynal 2022-05-16  276  	int ret;
be4a11cf98aff5 Miquel Raynal 2022-05-16  277  =

be4a11cf98aff5 Miquel Raynal 2022-05-16  278  	/*
be4a11cf98aff5 Miquel Raynal 2022-05-16  279  	 * Check which resolution mo=
de (every 20 or 60s) can be used.
be4a11cf98aff5 Miquel Raynal 2022-05-16  280  	 * Between 2 and 124 clock p=
ulses can be added or substracted.
be4a11cf98aff5 Miquel Raynal 2022-05-16  281  	 *
be4a11cf98aff5 Miquel Raynal 2022-05-16  282  	 * In 20s mode, the minimum =
resolution is 2 / (32768 * 20) which is
be4a11cf98aff5 Miquel Raynal 2022-05-16  283  	 * close to 3051 ppb. In 60s=
 mode, the resolution is closer to 1017.
be4a11cf98aff5 Miquel Raynal 2022-05-16  284  	 */
be4a11cf98aff5 Miquel Raynal 2022-05-16  285  	stepsh =3D DIV_ROUND_CLOSEST=
(offset, 1017);
be4a11cf98aff5 Miquel Raynal 2022-05-16  286  	stepsl =3D DIV_ROUND_CLOSEST=
(offset, 3051);
be4a11cf98aff5 Miquel Raynal 2022-05-16  287  =

be4a11cf98aff5 Miquel Raynal 2022-05-16  288  	if (stepsh >=3D -0x3E && ste=
psh <=3D 0x3E) {
be4a11cf98aff5 Miquel Raynal 2022-05-16  289  		/* 1017 ppb per step */
be4a11cf98aff5 Miquel Raynal 2022-05-16  290  		steps =3D stepsh;
be4a11cf98aff5 Miquel Raynal 2022-05-16 @291  		val |=3D RZN1_RTC_SUBU_DEV;
be4a11cf98aff5 Miquel Raynal 2022-05-16  292  	} else if (stepsl >=3D -0x3E=
 && stepsl <=3D 0x3E) {
be4a11cf98aff5 Miquel Raynal 2022-05-16  293  		/* 3051 ppb per step */
be4a11cf98aff5 Miquel Raynal 2022-05-16  294  		steps =3D stepsl;
be4a11cf98aff5 Miquel Raynal 2022-05-16  295  	} else {
be4a11cf98aff5 Miquel Raynal 2022-05-16  296  		return -ERANGE;
be4a11cf98aff5 Miquel Raynal 2022-05-16  297  	}
be4a11cf98aff5 Miquel Raynal 2022-05-16  298  =

be4a11cf98aff5 Miquel Raynal 2022-05-16  299  	if (!steps)
be4a11cf98aff5 Miquel Raynal 2022-05-16  300  		return 0;
be4a11cf98aff5 Miquel Raynal 2022-05-16  301  =

be4a11cf98aff5 Miquel Raynal 2022-05-16  302  	if (steps > 0) {
be4a11cf98aff5 Miquel Raynal 2022-05-16  303  		val |=3D steps + 1;
be4a11cf98aff5 Miquel Raynal 2022-05-16  304  	} else {
be4a11cf98aff5 Miquel Raynal 2022-05-16  305  		val |=3D RZN1_RTC_SUBU_DECR;
be4a11cf98aff5 Miquel Raynal 2022-05-16  306  		val |=3D (~(-steps - 1)) & =
0x3F;
be4a11cf98aff5 Miquel Raynal 2022-05-16  307  	}
be4a11cf98aff5 Miquel Raynal 2022-05-16  308  =

be4a11cf98aff5 Miquel Raynal 2022-05-16  309  	ret =3D readl_poll_timeout(r=
tc->base + RZN1_RTC_CTL2, val,
be4a11cf98aff5 Miquel Raynal 2022-05-16  310  				 !(val & RZN1_RTC_CTL2_WU=
ST), 100, 2000000);
be4a11cf98aff5 Miquel Raynal 2022-05-16  311  	if (ret)
be4a11cf98aff5 Miquel Raynal 2022-05-16  312  		return ret;
be4a11cf98aff5 Miquel Raynal 2022-05-16  313  =

be4a11cf98aff5 Miquel Raynal 2022-05-16  314  	writel(val, rtc->base + RZN1=
_RTC_SUBU);
be4a11cf98aff5 Miquel Raynal 2022-05-16  315  =

be4a11cf98aff5 Miquel Raynal 2022-05-16  316  	return 0;
be4a11cf98aff5 Miquel Raynal 2022-05-16  317  }
be4a11cf98aff5 Miquel Raynal 2022-05-16  318  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0293455117841335269==--


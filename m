Content-Type: multipart/mixed; boundary="===============0414498948578165212=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH net-next 2/3] net: gro: minor optimization for dev_gro_receive()
Date: Fri, 04 Feb 2022 09:31:00 +0800
Message-ID: <202202040843.8N7gkJXc-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0414498948578165212==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <2a6db6d6ca415cb35cc7b3e4d9424baf0516d782.1643902526.git.paben=
i@redhat.com>
References: <2a6db6d6ca415cb35cc7b3e4d9424baf0516d782.1643902526.git.pabeni=
@redhat.com>
TO: Paolo Abeni <pabeni@redhat.com>

Hi Paolo,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on net-next/master]

url:    https://github.com/0day-ci/linux/commits/Paolo-Abeni/gro-some-minor=
-optimization/20220203-235014
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git =
156a532b48125896c8518a64ada2afdc05017eee
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: i386-randconfig-s001 (https://download.01.org/0day-ci/archive/20220=
204/202202040843.8N7gkJXc-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/0day-ci/linux/commit/5684b5749ac64ce4aab3319bd=
ffe02071604f7fc
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Paolo-Abeni/gro-some-minor-optimiz=
ation/20220203-235014
        git checkout 5684b5749ac64ce4aab3319bdffe02071604f7fc
        # save the config file to linux build tree
        mkdir build_dir
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3D=
build_dir ARCH=3Di386 SHELL=3D/bin/bash net/ipv6/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   net/ipv6/udp_offload.c: note: in included file:
>> include/net/gro.h:58:1: sparse: sparse: directive in macro's argument li=
st
   include/net/gro.h:59:1: sparse: sparse: directive in macro's argument li=
st
--
   net/ipv6/tcpv6_offload.c: note: in included file:
>> include/net/gro.h:58:1: sparse: sparse: directive in macro's argument li=
st
   include/net/gro.h:59:1: sparse: sparse: directive in macro's argument li=
st
--
   net/ipv6/ip6_offload.c: note: in included file:
>> include/net/gro.h:58:1: sparse: sparse: directive in macro's argument li=
st
   include/net/gro.h:59:1: sparse: sparse: directive in macro's argument li=
st

vim +58 include/net/gro.h

e75ec151c1088c1 Alexander Lobakin 2021-03-18  12  =

4721031c3559db8 Eric Dumazet      2021-11-15  13  struct napi_gro_cb {
4721031c3559db8 Eric Dumazet      2021-11-15  14  	/* Virtual address of sk=
b_shinfo(skb)->frags[0].page + offset. */
4721031c3559db8 Eric Dumazet      2021-11-15  15  	void	*frag0;
4721031c3559db8 Eric Dumazet      2021-11-15  16  =

4721031c3559db8 Eric Dumazet      2021-11-15  17  	/* Length of frag0. */
4721031c3559db8 Eric Dumazet      2021-11-15  18  	unsigned int frag0_len;
4721031c3559db8 Eric Dumazet      2021-11-15  19  =

4721031c3559db8 Eric Dumazet      2021-11-15  20  	/* This indicates where =
we are processing relative to skb->data. */
4721031c3559db8 Eric Dumazet      2021-11-15  21  	int	data_offset;
4721031c3559db8 Eric Dumazet      2021-11-15  22  =

4721031c3559db8 Eric Dumazet      2021-11-15  23  	/* This is non-zero if t=
he packet cannot be merged with the new skb. */
4721031c3559db8 Eric Dumazet      2021-11-15  24  	u16	flush;
4721031c3559db8 Eric Dumazet      2021-11-15  25  =

4721031c3559db8 Eric Dumazet      2021-11-15  26  	/* Save the IP ID here a=
nd check when we get to the transport layer */
4721031c3559db8 Eric Dumazet      2021-11-15  27  	u16	flush_id;
4721031c3559db8 Eric Dumazet      2021-11-15  28  =

4721031c3559db8 Eric Dumazet      2021-11-15  29  	/* Number of segments ag=
gregated. */
4721031c3559db8 Eric Dumazet      2021-11-15  30  	u16	count;
4721031c3559db8 Eric Dumazet      2021-11-15  31  =

5684b5749ac64ce Paolo Abeni       2022-02-03  32  	/* Used in ipv6_gro_rece=
ive() and foo-over-udp */
5684b5749ac64ce Paolo Abeni       2022-02-03  33  	u16	proto;
4721031c3559db8 Eric Dumazet      2021-11-15  34  =

4721031c3559db8 Eric Dumazet      2021-11-15  35  	/* jiffies when first pa=
cket was created/queued */
4721031c3559db8 Eric Dumazet      2021-11-15  36  	unsigned long age;
4721031c3559db8 Eric Dumazet      2021-11-15  37  =

5684b5749ac64ce Paolo Abeni       2022-02-03  38  	/* portion of the cb set=
 to zero at every gro iteration */
5684b5749ac64ce Paolo Abeni       2022-02-03  39  	__struct_group(/* no tag=
 */, zeroed, /* no attrs */,
5684b5749ac64ce Paolo Abeni       2022-02-03  40  =

5684b5749ac64ce Paolo Abeni       2022-02-03  41  		/* Start offset for rem=
ote checksum offload */
5684b5749ac64ce Paolo Abeni       2022-02-03  42  		u16	gro_remcsum_start;
4721031c3559db8 Eric Dumazet      2021-11-15  43  =

4721031c3559db8 Eric Dumazet      2021-11-15  44  		/* This is non-zero if =
the packet may be of the same flow. */
4721031c3559db8 Eric Dumazet      2021-11-15  45  		u8	same_flow:1;
4721031c3559db8 Eric Dumazet      2021-11-15  46  =

4721031c3559db8 Eric Dumazet      2021-11-15  47  		/* Used in tunnel GRO r=
eceive */
4721031c3559db8 Eric Dumazet      2021-11-15  48  		u8	encap_mark:1;
4721031c3559db8 Eric Dumazet      2021-11-15  49  =

4721031c3559db8 Eric Dumazet      2021-11-15  50  		/* GRO checksum is vali=
d */
4721031c3559db8 Eric Dumazet      2021-11-15  51  		u8	csum_valid:1;
4721031c3559db8 Eric Dumazet      2021-11-15  52  =

4721031c3559db8 Eric Dumazet      2021-11-15  53  		/* Number of checksums =
via CHECKSUM_UNNECESSARY */
4721031c3559db8 Eric Dumazet      2021-11-15  54  		u8	csum_cnt:3;
4721031c3559db8 Eric Dumazet      2021-11-15  55  =

4721031c3559db8 Eric Dumazet      2021-11-15  56  		/* Free the skb? */
4721031c3559db8 Eric Dumazet      2021-11-15  57  		u8	free:2;
4721031c3559db8 Eric Dumazet      2021-11-15 @58  #define NAPI_GRO_FREE		  1
4721031c3559db8 Eric Dumazet      2021-11-15  59  #define NAPI_GRO_FREE_STO=
LEN_HEAD 2
4721031c3559db8 Eric Dumazet      2021-11-15  60  =

4721031c3559db8 Eric Dumazet      2021-11-15  61  		/* Used in foo-over-udp=
, set in udp[46]_gro_receive */
4721031c3559db8 Eric Dumazet      2021-11-15  62  		u8	is_ipv6:1;
4721031c3559db8 Eric Dumazet      2021-11-15  63  =

4721031c3559db8 Eric Dumazet      2021-11-15  64  		/* Used in GRE, set in =
fou/gue_gro_receive */
4721031c3559db8 Eric Dumazet      2021-11-15  65  		u8	is_fou:1;
4721031c3559db8 Eric Dumazet      2021-11-15  66  =

4721031c3559db8 Eric Dumazet      2021-11-15  67  		/* Used to determine if=
 flush_id can be ignored */
4721031c3559db8 Eric Dumazet      2021-11-15  68  		u8	is_atomic:1;
4721031c3559db8 Eric Dumazet      2021-11-15  69  =

4721031c3559db8 Eric Dumazet      2021-11-15  70  		/* Number of gro_receiv=
e callbacks this packet already went through */
4721031c3559db8 Eric Dumazet      2021-11-15  71  		u8 recursion_counter:4;
4721031c3559db8 Eric Dumazet      2021-11-15  72  =

4721031c3559db8 Eric Dumazet      2021-11-15  73  		/* GRO is done by frag_=
list pointer chaining. */
4721031c3559db8 Eric Dumazet      2021-11-15  74  		u8	is_flist:1;
5684b5749ac64ce Paolo Abeni       2022-02-03  75  	);
4721031c3559db8 Eric Dumazet      2021-11-15  76  =

4721031c3559db8 Eric Dumazet      2021-11-15  77  	/* used to support CHECK=
SUM_COMPLETE for tunneling protocols */
4721031c3559db8 Eric Dumazet      2021-11-15  78  	__wsum	csum;
4721031c3559db8 Eric Dumazet      2021-11-15  79  =

4721031c3559db8 Eric Dumazet      2021-11-15  80  	/* used in skb_gro_recei=
ve() slow path */
4721031c3559db8 Eric Dumazet      2021-11-15  81  	struct sk_buff *last;
4721031c3559db8 Eric Dumazet      2021-11-15  82  };
4721031c3559db8 Eric Dumazet      2021-11-15  83  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0414498948578165212==--


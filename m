Content-Type: multipart/mixed; boundary="===============3695470859081867957=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [tnguy-next-queue:dev-queue 41/144] include/net/gro.h:58:1: sparse: sparse: directive in macro's argument list
Date: Tue, 08 Feb 2022 12:58:56 +0800
Message-ID: <202202081257.bj8Fl3Sn-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3695470859081867957==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Intel Wired LAN <intel-wired-lan@lists.osuosl.org>
CC: linux-kernel(a)vger.kernel.org
TO: Paolo Abeni <pabeni@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.gi=
t dev-queue
head:   813d4b9de3b79e60cb9f25b5f60de6ddd24f2d0b
commit: de5a1f3ce4c862150dc442530dba19e1d1dc6bc2 [41/144] net: gro: minor o=
ptimization for dev_gro_receive()
:::::: branch date: 5 hours ago
:::::: commit date: 3 days ago
config: nios2-randconfig-s031-20220207 (https://download.01.org/0day-ci/arc=
hive/20220208/202202081257.bj8Fl3Sn-lkp(a)intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.=
git/commit/?id=3Dde5a1f3ce4c862150dc442530dba19e1d1dc6bc2
        git remote add tnguy-next-queue https://git.kernel.org/pub/scm/linu=
x/kernel/git/tnguy/next-queue.git
        git fetch --no-tags tnguy-next-queue dev-queue
        git checkout de5a1f3ce4c862150dc442530dba19e1d1dc6bc2
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.2.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dn=
ios2 SHELL=3D/bin/bash net/core/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   net/core/gro.c: note: in included file:
>> include/net/gro.h:58:1: sparse: sparse: directive in macro's argument li=
st
   include/net/gro.h:59:1: sparse: sparse: directive in macro's argument li=
st
   net/core/gro.c: note: in included file (through include/net/checksum.h, =
include/linux/skbuff.h, include/linux/ip.h, include/net/gro.h):
   arch/nios2/include/asm/checksum.h:30:24: sparse: sparse: restricted __ws=
um degrades to integer
--
   net/core/dev.c: note: in included file:
>> include/net/gro.h:58:1: sparse: sparse: directive in macro's argument li=
st
   include/net/gro.h:59:1: sparse: sparse: directive in macro's argument li=
st
   net/core/dev.c:3207:23: sparse: sparse: incorrect type in argument 4 (di=
fferent base types) @@     expected restricted __wsum [usertype] csum @@   =
  got unsigned int @@
   net/core/dev.c:3207:23: sparse:     expected restricted __wsum [usertype=
] csum
   net/core/dev.c:3207:23: sparse:     got unsigned int
   net/core/dev.c:3207:23: sparse: sparse: cast from restricted __wsum
   net/core/dev.c: note: in included file (through include/uapi/linux/swab.=
h, include/linux/swab.h, include/uapi/linux/byteorder/little_endian.h, ...):
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many argum=
ents for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many argum=
ents for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many argum=
ents for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many argum=
ents for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many argum=
ents for function __builtin_custom_ini

vim +58 include/net/gro.h

e75ec151c1088c Alexander Lobakin 2021-03-18  12  =

4721031c3559db Eric Dumazet      2021-11-15  13  struct napi_gro_cb {
4721031c3559db Eric Dumazet      2021-11-15  14  	/* Virtual address of skb=
_shinfo(skb)->frags[0].page + offset. */
4721031c3559db Eric Dumazet      2021-11-15  15  	void	*frag0;
4721031c3559db Eric Dumazet      2021-11-15  16  =

4721031c3559db Eric Dumazet      2021-11-15  17  	/* Length of frag0. */
4721031c3559db Eric Dumazet      2021-11-15  18  	unsigned int frag0_len;
4721031c3559db Eric Dumazet      2021-11-15  19  =

4721031c3559db Eric Dumazet      2021-11-15  20  	/* This indicates where w=
e are processing relative to skb->data. */
4721031c3559db Eric Dumazet      2021-11-15  21  	int	data_offset;
4721031c3559db Eric Dumazet      2021-11-15  22  =

4721031c3559db Eric Dumazet      2021-11-15  23  	/* This is non-zero if th=
e packet cannot be merged with the new skb. */
4721031c3559db Eric Dumazet      2021-11-15  24  	u16	flush;
4721031c3559db Eric Dumazet      2021-11-15  25  =

4721031c3559db Eric Dumazet      2021-11-15  26  	/* Save the IP ID here an=
d check when we get to the transport layer */
4721031c3559db Eric Dumazet      2021-11-15  27  	u16	flush_id;
4721031c3559db Eric Dumazet      2021-11-15  28  =

4721031c3559db Eric Dumazet      2021-11-15  29  	/* Number of segments agg=
regated. */
4721031c3559db Eric Dumazet      2021-11-15  30  	u16	count;
4721031c3559db Eric Dumazet      2021-11-15  31  =

de5a1f3ce4c862 Paolo Abeni       2022-02-04  32  	/* Used in ipv6_gro_recei=
ve() and foo-over-udp */
de5a1f3ce4c862 Paolo Abeni       2022-02-04  33  	u16	proto;
4721031c3559db Eric Dumazet      2021-11-15  34  =

4721031c3559db Eric Dumazet      2021-11-15  35  	/* jiffies when first pac=
ket was created/queued */
4721031c3559db Eric Dumazet      2021-11-15  36  	unsigned long age;
4721031c3559db Eric Dumazet      2021-11-15  37  =

de5a1f3ce4c862 Paolo Abeni       2022-02-04  38  	/* portion of the cb set =
to zero at every gro iteration */
de5a1f3ce4c862 Paolo Abeni       2022-02-04  39  	struct_group(zeroed,
de5a1f3ce4c862 Paolo Abeni       2022-02-04  40  =

de5a1f3ce4c862 Paolo Abeni       2022-02-04  41  		/* Start offset for remo=
te checksum offload */
de5a1f3ce4c862 Paolo Abeni       2022-02-04  42  		u16	gro_remcsum_start;
4721031c3559db Eric Dumazet      2021-11-15  43  =

4721031c3559db Eric Dumazet      2021-11-15  44  		/* This is non-zero if t=
he packet may be of the same flow. */
4721031c3559db Eric Dumazet      2021-11-15  45  		u8	same_flow:1;
4721031c3559db Eric Dumazet      2021-11-15  46  =

4721031c3559db Eric Dumazet      2021-11-15  47  		/* Used in tunnel GRO re=
ceive */
4721031c3559db Eric Dumazet      2021-11-15  48  		u8	encap_mark:1;
4721031c3559db Eric Dumazet      2021-11-15  49  =

4721031c3559db Eric Dumazet      2021-11-15  50  		/* GRO checksum is valid=
 */
4721031c3559db Eric Dumazet      2021-11-15  51  		u8	csum_valid:1;
4721031c3559db Eric Dumazet      2021-11-15  52  =

4721031c3559db Eric Dumazet      2021-11-15  53  		/* Number of checksums v=
ia CHECKSUM_UNNECESSARY */
4721031c3559db Eric Dumazet      2021-11-15  54  		u8	csum_cnt:3;
4721031c3559db Eric Dumazet      2021-11-15  55  =

4721031c3559db Eric Dumazet      2021-11-15  56  		/* Free the skb? */
4721031c3559db Eric Dumazet      2021-11-15  57  		u8	free:2;
4721031c3559db Eric Dumazet      2021-11-15 @58  #define NAPI_GRO_FREE		  1
4721031c3559db Eric Dumazet      2021-11-15  59  #define NAPI_GRO_FREE_STOL=
EN_HEAD 2
4721031c3559db Eric Dumazet      2021-11-15  60  =

4721031c3559db Eric Dumazet      2021-11-15  61  		/* Used in foo-over-udp,=
 set in udp[46]_gro_receive */
4721031c3559db Eric Dumazet      2021-11-15  62  		u8	is_ipv6:1;
4721031c3559db Eric Dumazet      2021-11-15  63  =

4721031c3559db Eric Dumazet      2021-11-15  64  		/* Used in GRE, set in f=
ou/gue_gro_receive */
4721031c3559db Eric Dumazet      2021-11-15  65  		u8	is_fou:1;
4721031c3559db Eric Dumazet      2021-11-15  66  =

4721031c3559db Eric Dumazet      2021-11-15  67  		/* Used to determine if =
flush_id can be ignored */
4721031c3559db Eric Dumazet      2021-11-15  68  		u8	is_atomic:1;
4721031c3559db Eric Dumazet      2021-11-15  69  =

4721031c3559db Eric Dumazet      2021-11-15  70  		/* Number of gro_receive=
 callbacks this packet already went through */
4721031c3559db Eric Dumazet      2021-11-15  71  		u8 recursion_counter:4;
4721031c3559db Eric Dumazet      2021-11-15  72  =

4721031c3559db Eric Dumazet      2021-11-15  73  		/* GRO is done by frag_l=
ist pointer chaining. */
4721031c3559db Eric Dumazet      2021-11-15  74  		u8	is_flist:1;
de5a1f3ce4c862 Paolo Abeni       2022-02-04  75  	);
4721031c3559db Eric Dumazet      2021-11-15  76  =

4721031c3559db Eric Dumazet      2021-11-15  77  	/* used to support CHECKS=
UM_COMPLETE for tunneling protocols */
4721031c3559db Eric Dumazet      2021-11-15  78  	__wsum	csum;
4721031c3559db Eric Dumazet      2021-11-15  79  =

4721031c3559db Eric Dumazet      2021-11-15  80  	/* used in skb_gro_receiv=
e() slow path */
4721031c3559db Eric Dumazet      2021-11-15  81  	struct sk_buff *last;
4721031c3559db Eric Dumazet      2021-11-15  82  };
4721031c3559db Eric Dumazet      2021-11-15  83  =


:::::: The code at line 58 was first introduced by commit
:::::: 4721031c3559db8eae61df305f10c00099a7c1d0 net: move gro definitions t=
o include/net/gro.h

:::::: TO: Eric Dumazet <edumazet@google.com>
:::::: CC: David S. Miller <davem@davemloft.net>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3695470859081867957==--


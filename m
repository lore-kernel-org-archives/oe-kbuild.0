Content-Type: multipart/mixed; boundary="===============3207337816853009051=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH MPTCP-next] mptcp: fix checksum byte order
Date: Fri, 06 May 2022 07:18:30 +0800
Message-ID: <202205060733.fq2O0rJw-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3207337816853009051==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <1a8201582e7fd63db7b5c9c4077af1ab1953c57e.1651763323.git.paben=
i@redhat.com>
References: <1a8201582e7fd63db7b5c9c4077af1ab1953c57e.1651763323.git.pabeni=
@redhat.com>
TO: Paolo Abeni <pabeni@redhat.com>
TO: mptcp(a)lists.linux.dev

Hi Paolo,

I love your patch! Perhaps something to improve:

[auto build test WARNING on mptcp/export]
[cannot apply to linus/master v5.18-rc5 next-20220505]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Paolo-Abeni/mptcp-fi=
x-checksum-byte-order/20220505-233437
base:   https://github.com/multipath-tcp/mptcp_net-next.git export
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: i386-randconfig-s001 (https://download.01.org/0day-ci/archive/20220=
506/202205060733.fq2O0rJw-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/intel-lab-lkp/linux/commit/7c590435ab3cef4d69c=
98e00effb7882679a7861
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Paolo-Abeni/mptcp-fix-checksum-byt=
e-order/20220505-233437
        git checkout 7c590435ab3cef4d69c98e00effb7882679a7861
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3D=
build_dir ARCH=3Di386 SHELL=3D/bin/bash net/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   net/mptcp/options.c:1285:9: sparse: sparse: symbol '__mptcp_make_csum' r=
edeclared with different type (different base types):
>> net/mptcp/options.c:1285:9: sparse:    restricted __sum16 extern [addres=
sable] [toplevel] __mptcp_make_csum( ... )
   net/mptcp/options.c: note: in included file:
   net/mptcp/protocol.h:766:5: sparse: note: previously declared as:
>> net/mptcp/protocol.h:766:5: sparse:    unsigned short extern [addressabl=
e] [toplevel] [unsigned] __mptcp_make_csum( ... )
>> net/mptcp/options.c:1315:9: sparse: sparse: incorrect type in assignment=
 (different base types) @@     expected restricted __be16 x @@     got rest=
ricted __sum16 [usertype] csum @@
   net/mptcp/options.c:1315:9: sparse:     expected restricted __be16 x
   net/mptcp/options.c:1315:9: sparse:     got restricted __sum16 [usertype=
] csum

vim +1285 net/mptcp/options.c

fa3fe2b150316b Florian Westphal 2020-11-19  1284  =

7c590435ab3cef Paolo Abeni      2022-05-05 @1285  __sum16 __mptcp_make_csum=
(u64 data_seq, u32 subflow_seq, u16 data_len, __wsum sum)
c94b1f96dcfb2e Geliang Tang     2021-06-17  1286  {
c94b1f96dcfb2e Geliang Tang     2021-06-17  1287  	struct csum_pseudo_heade=
r header;
c94b1f96dcfb2e Geliang Tang     2021-06-17  1288  	__wsum csum;
c94b1f96dcfb2e Geliang Tang     2021-06-17  1289  =

c94b1f96dcfb2e Geliang Tang     2021-06-17  1290  	/* cfr RFC 8684 3.3.1.:
c94b1f96dcfb2e Geliang Tang     2021-06-17  1291  	 * the data sequence num=
ber used in the pseudo-header is
c94b1f96dcfb2e Geliang Tang     2021-06-17  1292  	 * always the 64-bit val=
ue, irrespective of what length is used in the
c94b1f96dcfb2e Geliang Tang     2021-06-17  1293  	 * DSS option itself.
c94b1f96dcfb2e Geliang Tang     2021-06-17  1294  	 */
f7cc8890f30d3d Davide Caratti   2021-10-27  1295  	header.data_seq =3D cpu_=
to_be64(data_seq);
f7cc8890f30d3d Davide Caratti   2021-10-27  1296  	header.subflow_seq =3D h=
tonl(subflow_seq);
f7cc8890f30d3d Davide Caratti   2021-10-27  1297  	header.data_len =3D hton=
s(data_len);
c94b1f96dcfb2e Geliang Tang     2021-06-17  1298  	header.csum =3D 0;
c94b1f96dcfb2e Geliang Tang     2021-06-17  1299  =

c312ee219100e8 Geliang Tang     2022-01-07  1300  	csum =3D csum_partial(&h=
eader, sizeof(header), sum);
7c590435ab3cef Paolo Abeni      2022-05-05  1301  	return csum_fold(csum);
c94b1f96dcfb2e Geliang Tang     2021-06-17  1302  }
c94b1f96dcfb2e Geliang Tang     2021-06-17  1303  =

7c590435ab3cef Paolo Abeni      2022-05-05  1304  static __sum16 mptcp_make=
_csum(const struct mptcp_ext *mpext)
f7cc8890f30d3d Davide Caratti   2021-10-27  1305  {
f7cc8890f30d3d Davide Caratti   2021-10-27  1306  	return __mptcp_make_csum=
(mpext->data_seq, mpext->subflow_seq, mpext->data_len,
c312ee219100e8 Geliang Tang     2022-01-07  1307  				 ~csum_unfold(mpext->=
csum));
f7cc8890f30d3d Davide Caratti   2021-10-27  1308  }
f7cc8890f30d3d Davide Caratti   2021-10-27  1309  =

7c590435ab3cef Paolo Abeni      2022-05-05  1310  static void put_len_csum(=
u16 len, __sum16 csum, __be16 *ptr)
7c590435ab3cef Paolo Abeni      2022-05-05  1311  {
7c590435ab3cef Paolo Abeni      2022-05-05  1312  	put_unaligned_be16(len, =
ptr);
7c590435ab3cef Paolo Abeni      2022-05-05  1313  =

7c590435ab3cef Paolo Abeni      2022-05-05  1314  	ptr +=3D 1;
7c590435ab3cef Paolo Abeni      2022-05-05 @1315  	put_unaligned(csum, ptr);
7c590435ab3cef Paolo Abeni      2022-05-05  1316  }
7c590435ab3cef Paolo Abeni      2022-05-05  1317  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3207337816853009051==--


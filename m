Content-Type: multipart/mixed; boundary="===============0256757463553459895=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.c:374 opa_vnic_get_sc() warn: potential spectre issue 'info->vport.pcp_to_sc_mc' [r]
Date: Thu, 25 Nov 2021 03:27:38 +0800
Message-ID: <202111250317.6hp6SBin-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0256757463553459895==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   5d9f4cf36721aba199975a9be7863a3ff5cd4b59
commit: d991bb1c8da842a2a0b9dc83b1005e655783f861 include/linux/compiler-gcc=
.h: sparse can do constant folding of __builtin_bswap*()
date:   7 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 7 months ago
config: x86_64-randconfig-m001-20211122 (https://download.01.org/0day-ci/ar=
chive/20211125/202111250317.6hp6SBin-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.c:374 opa_vnic_get_sc() warn=
: potential spectre issue 'info->vport.pcp_to_sc_mc' [r]
drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.c:376 opa_vnic_get_sc() warn=
: potential spectre issue 'info->vport.pcp_to_sc_uc' [r]
drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.c:384 opa_vnic_get_sc() warn=
: possible spectre second half.  'sc'
drivers/infiniband/sw/siw/iwarp.h:114 __ddp_get_version() warn: mask and sh=
ift to zero

vim +374 drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.c

7d6f728c677e9d Vishwanathapura, Niranjana 2017-04-12  361  =

7d6f728c677e9d Vishwanathapura, Niranjana 2017-04-12  362  /* opa_vnic_get_=
sc - return the service class */
7d6f728c677e9d Vishwanathapura, Niranjana 2017-04-12  363  static u8 opa_vn=
ic_get_sc(struct __opa_veswport_info *info,
7d6f728c677e9d Vishwanathapura, Niranjana 2017-04-12  364  			  struct sk_b=
uff *skb)
7d6f728c677e9d Vishwanathapura, Niranjana 2017-04-12  365  {
7d6f728c677e9d Vishwanathapura, Niranjana 2017-04-12  366  	struct ethhdr *=
mac_hdr =3D (struct ethhdr *)skb_mac_header(skb);
7d6f728c677e9d Vishwanathapura, Niranjana 2017-04-12  367  	u16 vlan_tci;
7d6f728c677e9d Vishwanathapura, Niranjana 2017-04-12  368  	u8 sc;
7d6f728c677e9d Vishwanathapura, Niranjana 2017-04-12  369  =

7d6f728c677e9d Vishwanathapura, Niranjana 2017-04-12  370  	if (!__vlan_get=
_tag(skb, &vlan_tci)) {
7d6f728c677e9d Vishwanathapura, Niranjana 2017-04-12  371  		u8 pcp =3D OPA=
_VNIC_VLAN_PCP(vlan_tci);
7d6f728c677e9d Vishwanathapura, Niranjana 2017-04-12  372  =

7d6f728c677e9d Vishwanathapura, Niranjana 2017-04-12  373  		if (is_multica=
st_ether_addr(mac_hdr->h_dest))
7d6f728c677e9d Vishwanathapura, Niranjana 2017-04-12 @374  			sc =3D info->=
vport.pcp_to_sc_mc[pcp];
7d6f728c677e9d Vishwanathapura, Niranjana 2017-04-12  375  		else
7d6f728c677e9d Vishwanathapura, Niranjana 2017-04-12 @376  			sc =3D info->=
vport.pcp_to_sc_uc[pcp];
7d6f728c677e9d Vishwanathapura, Niranjana 2017-04-12  377  	} else {
7d6f728c677e9d Vishwanathapura, Niranjana 2017-04-12  378  		if (is_multica=
st_ether_addr(mac_hdr->h_dest))
7d6f728c677e9d Vishwanathapura, Niranjana 2017-04-12  379  			sc =3D info->=
vport.non_vlan_sc_mc;
7d6f728c677e9d Vishwanathapura, Niranjana 2017-04-12  380  		else
7d6f728c677e9d Vishwanathapura, Niranjana 2017-04-12  381  			sc =3D info->=
vport.non_vlan_sc_uc;
7d6f728c677e9d Vishwanathapura, Niranjana 2017-04-12  382  	}
7d6f728c677e9d Vishwanathapura, Niranjana 2017-04-12  383  =

7d6f728c677e9d Vishwanathapura, Niranjana 2017-04-12 @384  	return sc;
7d6f728c677e9d Vishwanathapura, Niranjana 2017-04-12  385  }
7d6f728c677e9d Vishwanathapura, Niranjana 2017-04-12  386  =


:::::: The code at line 374 was first introduced by commit
:::::: 7d6f728c677e9d01b42d3cc9eb9ef40a2de92ea3 IB/opa-vnic: Virtual Networ=
k Interface Controller (VNIC) netdev

:::::: TO: Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.co=
m>
:::::: CC: Doug Ledford <dledford@redhat.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0256757463553459895==--


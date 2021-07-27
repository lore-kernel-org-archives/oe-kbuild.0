Content-Type: multipart/mixed; boundary="===============7252690978147173859=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c:2367:3: warning: Address of local auto-variable assigned to a function parameter. [autoVariables]
Date: Wed, 28 Jul 2021 03:48:07 +0800
Message-ID: <202107280302.557WaN59-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7252690978147173859==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Naveen Mamindlapalli <naveenm@marvell.com>
CC: Sunil Kovvuri Goutham <Sunil.Goutham@marvell.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   ff1176468d368232b684f75e82563369208bc371
commit: 967db3529ecac305d230aa4e60abddf6ab63543a octeontx2-af: add support =
for multicast/promisc packet replication feature
date:   7 weeks ago
:::::: branch date: 2 days ago
:::::: commit date: 7 weeks ago
compiler: s390-linux-gcc (GCC) 10.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c:2367:3: warning: Add=
ress of local auto-variable assigned to a function parameter. [autoVariable=
s]
     *mce_list =3D &pfvf->bcast_mce_list;
     ^
   drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c:2370:3: warning: Add=
ress of local auto-variable assigned to a function parameter. [autoVariable=
s]
     *mce_list =3D &pfvf->mcast_mce_list;
     ^
   drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c:2373:3: warning: Add=
ress of local auto-variable assigned to a function parameter. [autoVariable=
s]
     *mce_list =3D &pfvf->promisc_mce_list;
     ^
>> drivers/net/ethernet/marvell/octeontx2/af/rvu_npc.c:700:6: warning: Unin=
itialized struct member: action.op [uninitStructMember]
    if (action.op !=3D NIX_RX_ACTIONOP_RSS) {
        ^
   drivers/net/ethernet/marvell/octeontx2/af/rvu_npc.c:865:6: warning: Unin=
itialized struct member: action.op [uninitStructMember]
    if (action.op !=3D NIX_RX_ACTIONOP_RSS) {
        ^

vim +2367 drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c

4b05528ebf0c3f Sunil Goutham        2018-10-22  2349  =

967db3529ecac3 Naveen Mamindlapalli 2021-06-11  2350  void nix_get_mce_list=
(struct rvu *rvu, u16 pcifunc, int type,
967db3529ecac3 Naveen Mamindlapalli 2021-06-11  2351  		      struct nix_mc=
e_list **mce_list, int *mce_idx)
967db3529ecac3 Naveen Mamindlapalli 2021-06-11  2352  {
967db3529ecac3 Naveen Mamindlapalli 2021-06-11  2353  	struct rvu_hwinfo *h=
w =3D rvu->hw;
967db3529ecac3 Naveen Mamindlapalli 2021-06-11  2354  	struct rvu_pfvf *pfv=
f;
967db3529ecac3 Naveen Mamindlapalli 2021-06-11  2355  =

967db3529ecac3 Naveen Mamindlapalli 2021-06-11  2356  	if (!hw->cap.nix_rx_=
multicast ||
967db3529ecac3 Naveen Mamindlapalli 2021-06-11  2357  	    !is_pf_cgxmapped=
(rvu, rvu_get_pf(pcifunc & ~RVU_PFVF_FUNC_MASK))) {
967db3529ecac3 Naveen Mamindlapalli 2021-06-11  2358  		*mce_list =3D NULL;
967db3529ecac3 Naveen Mamindlapalli 2021-06-11  2359  		*mce_idx =3D 0;
967db3529ecac3 Naveen Mamindlapalli 2021-06-11  2360  		return;
967db3529ecac3 Naveen Mamindlapalli 2021-06-11  2361  	}
967db3529ecac3 Naveen Mamindlapalli 2021-06-11  2362  =

967db3529ecac3 Naveen Mamindlapalli 2021-06-11  2363  	/* Get this PF/VF fu=
nc's MCE index */
967db3529ecac3 Naveen Mamindlapalli 2021-06-11  2364  	pfvf =3D rvu_get_pfv=
f(rvu, pcifunc & ~RVU_PFVF_FUNC_MASK);
967db3529ecac3 Naveen Mamindlapalli 2021-06-11  2365  =

967db3529ecac3 Naveen Mamindlapalli 2021-06-11  2366  	if (type =3D=3D NIXL=
F_BCAST_ENTRY) {
967db3529ecac3 Naveen Mamindlapalli 2021-06-11 @2367  		*mce_list =3D &pfvf=
->bcast_mce_list;
967db3529ecac3 Naveen Mamindlapalli 2021-06-11  2368  		*mce_idx =3D pfvf->=
bcast_mce_idx;
967db3529ecac3 Naveen Mamindlapalli 2021-06-11  2369  	} else if (type =3D=
=3D NIXLF_ALLMULTI_ENTRY) {
967db3529ecac3 Naveen Mamindlapalli 2021-06-11  2370  		*mce_list =3D &pfvf=
->mcast_mce_list;
967db3529ecac3 Naveen Mamindlapalli 2021-06-11  2371  		*mce_idx =3D pfvf->=
mcast_mce_idx;
967db3529ecac3 Naveen Mamindlapalli 2021-06-11  2372  	} else if (type =3D=
=3D NIXLF_PROMISC_ENTRY) {
967db3529ecac3 Naveen Mamindlapalli 2021-06-11  2373  		*mce_list =3D &pfvf=
->promisc_mce_list;
967db3529ecac3 Naveen Mamindlapalli 2021-06-11  2374  		*mce_idx =3D pfvf->=
promisc_mce_idx;
967db3529ecac3 Naveen Mamindlapalli 2021-06-11  2375  	}  else {
967db3529ecac3 Naveen Mamindlapalli 2021-06-11  2376  		*mce_list =3D NULL;
967db3529ecac3 Naveen Mamindlapalli 2021-06-11  2377  		*mce_idx =3D 0;
967db3529ecac3 Naveen Mamindlapalli 2021-06-11  2378  	}
967db3529ecac3 Naveen Mamindlapalli 2021-06-11  2379  }
967db3529ecac3 Naveen Mamindlapalli 2021-06-11  2380  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7252690978147173859==--


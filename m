Content-Type: multipart/mixed; boundary="===============6456844352575633993=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/intel/ice/ice_tc_lib.c:853:29: warning: Uninitialized variable: fltr->src_vsi [uninitvar]
Date: Sun, 08 May 2022 15:46:36 +0800
Message-ID: <202205081513.arVeQ0sa-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6456844352575633993==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Michal Swiatkowski <michal.swiatkowski@intel.com>
CC: Tony Nguyen <anthony.l.nguyen@intel.com>
CC: Wojciech Drewek <wojciech.drewek@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   30c8e80f79329617012f07b09b70114592092ea4
commit: 7fde6d8b445f3af9caa5f3c2be384c2f797e21c5 ice: ndo_setup_tc implemen=
tation for PR
date:   7 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 7 months ago
compiler: riscv64-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 7fde6d8b445f3af9caa5f3c2be384c2f797e21c5
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)
>> drivers/tty/moxa.c:740:10: warning: Local variable 'magic' shadows outer=
 variable [shadowVariable]
     __le32 magic; /* 0x34303430 */
            ^
   drivers/tty/moxa.c:740:10: note: Shadowed declaration
     __le32 magic; /* 0x34303430 */
            ^
   drivers/tty/moxa.c:740:10: note: Shadow variable
     __le32 magic; /* 0x34303430 */
            ^
>> drivers/tty/moxa.c:741:6: warning: Local variable 'reserved1' shadows ou=
ter variable [shadowVariable]
     u8 reserved1[2];
        ^
   drivers/tty/moxa.c:741:6: note: Shadowed declaration
     u8 reserved1[2];
        ^
   drivers/tty/moxa.c:741:6: note: Shadow variable
     u8 reserved1[2];
        ^
>> drivers/tty/moxa.c:742:6: warning: Local variable 'type' shadows outer v=
ariable [shadowVariable]
     u8 type; /* UNIX =3D 3 */
        ^
   drivers/tty/moxa.c:742:6: note: Shadowed declaration
     u8 type; /* UNIX =3D 3 */
        ^
   drivers/tty/moxa.c:742:6: note: Shadow variable
     u8 type; /* UNIX =3D 3 */
        ^
>> drivers/tty/moxa.c:743:6: warning: Local variable 'model' shadows outer =
variable [shadowVariable]
     u8 model; /* C218T=3D1, C320T=3D2, CP204=3D3 */
        ^
   drivers/tty/moxa.c:743:6: note: Shadowed declaration
     u8 model; /* C218T=3D1, C320T=3D2, CP204=3D3 */
        ^
   drivers/tty/moxa.c:743:6: note: Shadow variable
     u8 model; /* C218T=3D1, C320T=3D2, CP204=3D3 */
        ^
>> drivers/tty/moxa.c:744:6: warning: Local variable 'reserved2' shadows ou=
ter variable [shadowVariable]
     u8 reserved2[8];
        ^
   drivers/tty/moxa.c:744:6: note: Shadowed declaration
     u8 reserved2[8];
        ^
   drivers/tty/moxa.c:744:6: note: Shadow variable
     u8 reserved2[8];
        ^
>> drivers/tty/moxa.c:745:10: warning: Local variable 'len' shadows outer v=
ariable [shadowVariable]
     __le16 len[5];
            ^
   drivers/tty/moxa.c:736:9: note: Shadowed declaration
    size_t len;
           ^
   drivers/tty/moxa.c:745:10: note: Shadow variable
     __le16 len[5];
            ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> lib/dim/net_dim.c:78:28: warning: Same value in both branches of ternary=
 operator. [duplicateValueTernary]
      NET_DIM_DEF_PROFILE_CQE : NET_DIM_DEF_PROFILE_EQE;
                              ^
   lib/dim/net_dim.c:98:28: warning: Same value in both branches of ternary=
 operator. [duplicateValueTernary]
      NET_DIM_DEF_PROFILE_CQE : NET_DIM_DEF_PROFILE_EQE;
                              ^
--
>> drivers/net/ethernet/intel/ice/ice_tc_lib.c:853:29: warning: Uninitializ=
ed variable: fltr->src_vsi [uninitvar]
     ice_add_switch_fltr(fltr->src_vsi, fltr);
                               ^
--
>> drivers/tty/moxa.c:767:2: warning: Using pointer to local variable 'len'=
 that is out of scope. [invalidLifetime]
    len =3D MOXA_FW_HDRLEN;
    ^
   drivers/tty/moxa.c:767:2: note: Array decayed to pointer here.
    len =3D MOXA_FW_HDRLEN;
    ^
   drivers/tty/moxa.c:745:10: note: Variable created here.
     __le16 len[5];
            ^
   drivers/tty/moxa.c:767:2: note: Using pointer to local variable 'len' th=
at is out of scope.
    len =3D MOXA_FW_HDRLEN;
    ^
   drivers/tty/moxa.c:771:18: warning: Using pointer to local variable 'len=
' that is out of scope. [invalidLifetime]
     if (lens[a] && len + lens[a] <=3D fw->size &&
                    ^
   drivers/tty/moxa.c:771:18: note: Array decayed to pointer here.
     if (lens[a] && len + lens[a] <=3D fw->size &&
                    ^
   drivers/tty/moxa.c:745:10: note: Variable created here.
     __le16 len[5];
            ^
   drivers/tty/moxa.c:771:18: note: Using pointer to local variable 'len' t=
hat is out of scope.
     if (lens[a] && len + lens[a] <=3D fw->size &&
                    ^
   drivers/tty/moxa.c:779:3: warning: Using pointer to local variable 'len'=
 that is out of scope. [invalidLifetime]
     len +=3D lens[a];
     ^
   drivers/tty/moxa.c:779:3: note: Array decayed to pointer here.
     len +=3D lens[a];
     ^
   drivers/tty/moxa.c:745:10: note: Variable created here.
     __le16 len[5];
            ^
   drivers/tty/moxa.c:779:3: note: Using pointer to local variable 'len' th=
at is out of scope.
     len +=3D lens[a];
     ^
   drivers/tty/moxa.c:782:6: warning: Using pointer to local variable 'len'=
 that is out of scope. [invalidLifetime]
    if (len !=3D fw->size) {
        ^
   drivers/tty/moxa.c:782:6: note: Array decayed to pointer here.
    if (len !=3D fw->size) {
        ^
   drivers/tty/moxa.c:745:10: note: Variable created here.
     __le16 len[5];
            ^
   drivers/tty/moxa.c:782:6: note: Using pointer to local variable 'len' th=
at is out of scope.
    if (len !=3D fw->size) {
        ^
>> drivers/tty/moxa.c:736:9: warning: Unused variable: len [unusedVariable]
    size_t len;
           ^

vim +853 drivers/net/ethernet/intel/ice/ice_tc_lib.c

7fde6d8b445f3a Michal Swiatkowski 2021-08-06  839  =

7fde6d8b445f3a Michal Swiatkowski 2021-08-06  840  /**
7fde6d8b445f3a Michal Swiatkowski 2021-08-06  841   * ice_replay_tc_fltrs -=
 replay TC filters
7fde6d8b445f3a Michal Swiatkowski 2021-08-06  842   * @pf: pointer to PF st=
ruct
7fde6d8b445f3a Michal Swiatkowski 2021-08-06  843   */
7fde6d8b445f3a Michal Swiatkowski 2021-08-06  844  void ice_replay_tc_fltrs=
(struct ice_pf *pf)
7fde6d8b445f3a Michal Swiatkowski 2021-08-06  845  {
7fde6d8b445f3a Michal Swiatkowski 2021-08-06  846  	struct ice_tc_flower_fl=
tr *fltr;
7fde6d8b445f3a Michal Swiatkowski 2021-08-06  847  	struct hlist_node *node;
7fde6d8b445f3a Michal Swiatkowski 2021-08-06  848  =

7fde6d8b445f3a Michal Swiatkowski 2021-08-06  849  	hlist_for_each_entry_sa=
fe(fltr, node,
7fde6d8b445f3a Michal Swiatkowski 2021-08-06  850  				  &pf->tc_flower_flt=
r_list,
7fde6d8b445f3a Michal Swiatkowski 2021-08-06  851  				  tc_flower_node) {
7fde6d8b445f3a Michal Swiatkowski 2021-08-06  852  		fltr->extack =3D NULL;
7fde6d8b445f3a Michal Swiatkowski 2021-08-06 @853  		ice_add_switch_fltr(fl=
tr->src_vsi, fltr);

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6456844352575633993==--


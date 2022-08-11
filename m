Content-Type: multipart/mixed; boundary="===============2112575391764843708=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/dma/ppc4xx/adma.c:1329: warning: expecting prototype for ppc440spe_adma_device_estimate(). Prototype was for ppc440spe_adma_estimate() instead
Date: Fri, 12 Aug 2022 04:50:29 +0800
Message-ID: <202208120424.rHaCi7UF-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2112575391764843708==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 drivers/dma/ppc4xx/adma.c:1329: warning: expecting prototype for ppc440spe=
_adma_device_estimate(). Prototype was for ppc440spe_adma_estimate() instea=
d"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Christophe Leroy <christophe.leroy@csgroup.eu>
CC: Michael Ellerman <mpe@ellerman.id.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   2ae08b36c06ea8df73a79f6b80ff7964e006e9e3
commit: 2255411d1d0f0661d1e5acd5f6edf4e6652a345a powerpc/44x: Fix build fai=
lure with GCC 12 (unrecognized opcode: `wrteei')
date:   2 weeks ago
:::::: branch date: 4 hours ago
:::::: commit date: 2 weeks ago
config: powerpc-randconfig-s053-20220811 (https://download.01.org/0day-ci/a=
rchive/20220812/202208120424.rHaCi7UF-lkp(a)intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D2255411d1d0f0661d1e5acd5f6edf4e6652a345a
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 2255411d1d0f0661d1e5acd5f6edf4e6652a345a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dp=
owerpc SHELL=3D/bin/bash drivers/dma/ppc4xx/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/dma/ppc4xx/adma.c:233: warning: Function parameter or member 'de=
sc' not described in 'ppc440spe_desc_init_interrupt'
   drivers/dma/ppc4xx/adma.c:233: warning: Function parameter or member 'ch=
an' not described in 'ppc440spe_desc_init_interrupt'
   drivers/dma/ppc4xx/adma.c:261: warning: Function parameter or member 'de=
sc' not described in 'ppc440spe_desc_init_null_xor'
   drivers/dma/ppc4xx/adma.c:273: warning: Function parameter or member 'de=
sc' not described in 'ppc440spe_desc_init_xor'
   drivers/dma/ppc4xx/adma.c:273: warning: Function parameter or member 'sr=
c_cnt' not described in 'ppc440spe_desc_init_xor'
   drivers/dma/ppc4xx/adma.c:273: warning: Function parameter or member 'fl=
ags' not described in 'ppc440spe_desc_init_xor'
   drivers/dma/ppc4xx/adma.c:293: warning: Function parameter or member 'de=
sc' not described in 'ppc440spe_desc_init_dma2pq'
   drivers/dma/ppc4xx/adma.c:293: warning: Function parameter or member 'ds=
t_cnt' not described in 'ppc440spe_desc_init_dma2pq'
   drivers/dma/ppc4xx/adma.c:293: warning: Function parameter or member 'sr=
c_cnt' not described in 'ppc440spe_desc_init_dma2pq'
   drivers/dma/ppc4xx/adma.c:293: warning: Function parameter or member 'fl=
ags' not described in 'ppc440spe_desc_init_dma2pq'
   drivers/dma/ppc4xx/adma.c:320: warning: Function parameter or member 'de=
sc' not described in 'ppc440spe_desc_init_dma01pq'
   drivers/dma/ppc4xx/adma.c:320: warning: Function parameter or member 'ds=
t_cnt' not described in 'ppc440spe_desc_init_dma01pq'
   drivers/dma/ppc4xx/adma.c:320: warning: Function parameter or member 'sr=
c_cnt' not described in 'ppc440spe_desc_init_dma01pq'
   drivers/dma/ppc4xx/adma.c:320: warning: Function parameter or member 'fl=
ags' not described in 'ppc440spe_desc_init_dma01pq'
   drivers/dma/ppc4xx/adma.c:320: warning: Function parameter or member 'op=
' not described in 'ppc440spe_desc_init_dma01pq'
   drivers/dma/ppc4xx/adma.c:433: warning: Function parameter or member 'de=
sc' not described in 'ppc440spe_desc_init_dma01pqzero_sum'
   drivers/dma/ppc4xx/adma.c:433: warning: Function parameter or member 'ds=
t_cnt' not described in 'ppc440spe_desc_init_dma01pqzero_sum'
   drivers/dma/ppc4xx/adma.c:433: warning: Function parameter or member 'sr=
c_cnt' not described in 'ppc440spe_desc_init_dma01pqzero_sum'
   drivers/dma/ppc4xx/adma.c:503: warning: Function parameter or member 'de=
sc' not described in 'ppc440spe_desc_init_memcpy'
   drivers/dma/ppc4xx/adma.c:503: warning: Function parameter or member 'fl=
ags' not described in 'ppc440spe_desc_init_memcpy'
   drivers/dma/ppc4xx/adma.c:526: warning: Function parameter or member 'de=
sc' not described in 'ppc440spe_desc_set_src_addr'
   drivers/dma/ppc4xx/adma.c:526: warning: Function parameter or member 'ch=
an' not described in 'ppc440spe_desc_set_src_addr'
   drivers/dma/ppc4xx/adma.c:526: warning: Function parameter or member 'sr=
c_idx' not described in 'ppc440spe_desc_set_src_addr'
   drivers/dma/ppc4xx/adma.c:526: warning: Function parameter or member 'ad=
drh' not described in 'ppc440spe_desc_set_src_addr'
   drivers/dma/ppc4xx/adma.c:526: warning: Function parameter or member 'ad=
drl' not described in 'ppc440spe_desc_set_src_addr'
   drivers/dma/ppc4xx/adma.c:560: warning: Function parameter or member 'de=
sc' not described in 'ppc440spe_desc_set_src_mult'
   drivers/dma/ppc4xx/adma.c:560: warning: Function parameter or member 'ch=
an' not described in 'ppc440spe_desc_set_src_mult'
   drivers/dma/ppc4xx/adma.c:560: warning: Function parameter or member 'mu=
lt_index' not described in 'ppc440spe_desc_set_src_mult'
   drivers/dma/ppc4xx/adma.c:560: warning: Function parameter or member 'sg=
_index' not described in 'ppc440spe_desc_set_src_mult'
   drivers/dma/ppc4xx/adma.c:560: warning: Function parameter or member 'mu=
lt_value' not described in 'ppc440spe_desc_set_src_mult'
   drivers/dma/ppc4xx/adma.c:605: warning: Function parameter or member 'de=
sc' not described in 'ppc440spe_desc_set_dest_addr'
   drivers/dma/ppc4xx/adma.c:605: warning: Function parameter or member 'ch=
an' not described in 'ppc440spe_desc_set_dest_addr'
   drivers/dma/ppc4xx/adma.c:605: warning: Function parameter or member 'ad=
drh' not described in 'ppc440spe_desc_set_dest_addr'
   drivers/dma/ppc4xx/adma.c:605: warning: Function parameter or member 'ad=
drl' not described in 'ppc440spe_desc_set_dest_addr'
   drivers/dma/ppc4xx/adma.c:605: warning: Function parameter or member 'ds=
t_idx' not described in 'ppc440spe_desc_set_dest_addr'
   drivers/dma/ppc4xx/adma.c:645: warning: Function parameter or member 'de=
sc' not described in 'ppc440spe_desc_set_byte_count'
   drivers/dma/ppc4xx/adma.c:645: warning: Function parameter or member 'ch=
an' not described in 'ppc440spe_desc_set_byte_count'
   drivers/dma/ppc4xx/adma.c:645: warning: Function parameter or member 'by=
te_count' not described in 'ppc440spe_desc_set_byte_count'
   drivers/dma/ppc4xx/adma.c:666: warning: Function parameter or member 'by=
te_count' not described in 'ppc440spe_desc_set_rxor_block_size'
   drivers/dma/ppc4xx/adma.c:679: warning: Function parameter or member 'de=
sc' not described in 'ppc440spe_desc_set_dcheck'
   drivers/dma/ppc4xx/adma.c:679: warning: Function parameter or member 'ch=
an' not described in 'ppc440spe_desc_set_dcheck'
   drivers/dma/ppc4xx/adma.c:679: warning: Function parameter or member 'qw=
ord' not described in 'ppc440spe_desc_set_dcheck'
   drivers/dma/ppc4xx/adma.c:701: warning: Function parameter or member 'pr=
ev_desc' not described in 'ppc440spe_xor_set_link'
   drivers/dma/ppc4xx/adma.c:701: warning: Function parameter or member 'ne=
xt_desc' not described in 'ppc440spe_xor_set_link'
   drivers/dma/ppc4xx/adma.c:724: warning: Function parameter or member 'ch=
an' not described in 'ppc440spe_desc_set_link'
   drivers/dma/ppc4xx/adma.c:724: warning: Function parameter or member 'pr=
ev_desc' not described in 'ppc440spe_desc_set_link'
   drivers/dma/ppc4xx/adma.c:724: warning: Function parameter or member 'ne=
xt_desc' not described in 'ppc440spe_desc_set_link'
   drivers/dma/ppc4xx/adma.c:771: warning: Function parameter or member 'de=
sc' not described in 'ppc440spe_desc_get_link'
   drivers/dma/ppc4xx/adma.c:771: warning: Function parameter or member 'ch=
an' not described in 'ppc440spe_desc_get_link'
   drivers/dma/ppc4xx/adma.c:783: warning: Function parameter or member 'de=
sc' not described in 'ppc440spe_desc_is_aligned'
   drivers/dma/ppc4xx/adma.c:783: warning: Function parameter or member 'nu=
m_slots' not described in 'ppc440spe_desc_is_aligned'
   drivers/dma/ppc4xx/adma.c:793: warning: Function parameter or member 'le=
n' not described in 'ppc440spe_chan_xor_slot_count'
   drivers/dma/ppc4xx/adma.c:793: warning: Function parameter or member 'sr=
c_cnt' not described in 'ppc440spe_chan_xor_slot_count'
   drivers/dma/ppc4xx/adma.c:793: warning: Function parameter or member 'sl=
ots_per_op' not described in 'ppc440spe_chan_xor_slot_count'
   drivers/dma/ppc4xx/adma.c:814: warning: Function parameter or member 'sr=
cs' not described in 'ppc440spe_dma2_pq_slot_count'
   drivers/dma/ppc4xx/adma.c:814: warning: Function parameter or member 'sr=
c_cnt' not described in 'ppc440spe_dma2_pq_slot_count'
   drivers/dma/ppc4xx/adma.c:814: warning: Function parameter or member 'le=
n' not described in 'ppc440spe_dma2_pq_slot_count'
   drivers/dma/ppc4xx/adma.c:898: warning: Function parameter or member 'ch=
an' not described in 'ppc440spe_adma_device_clear_eot_status'
   drivers/dma/ppc4xx/adma.c:1017: warning: Function parameter or member 'c=
han' not described in 'ppc440spe_chan_is_busy'
   drivers/dma/ppc4xx/adma.c:1050: warning: Function parameter or member 'c=
han' not described in 'ppc440spe_chan_set_first_xor_descriptor'
   drivers/dma/ppc4xx/adma.c:1050: warning: Function parameter or member 'n=
ext_desc' not described in 'ppc440spe_chan_set_first_xor_descriptor'
   drivers/dma/ppc4xx/adma.c:1076: warning: Function parameter or member 'c=
han' not described in 'ppc440spe_dma_put_desc'
   drivers/dma/ppc4xx/adma.c:1076: warning: Function parameter or member 'd=
esc' not described in 'ppc440spe_dma_put_desc'
   drivers/dma/ppc4xx/adma.c:1095: warning: Function parameter or member 'c=
han' not described in 'ppc440spe_chan_append'
   drivers/dma/ppc4xx/adma.c:1174: warning: Function parameter or member 'c=
han' not described in 'ppc440spe_chan_get_current_descriptor'
   drivers/dma/ppc4xx/adma.c:1198: warning: Function parameter or member 'c=
han' not described in 'ppc440spe_chan_run'
   drivers/dma/ppc4xx/adma.c:1252: warning: Function parameter or member 's=
rcs' not described in 'ppc440spe_can_rxor'
   drivers/dma/ppc4xx/adma.c:1252: warning: Function parameter or member 's=
rc_cnt' not described in 'ppc440spe_can_rxor'
   drivers/dma/ppc4xx/adma.c:1252: warning: Function parameter or member 'l=
en' not described in 'ppc440spe_can_rxor'
>> drivers/dma/ppc4xx/adma.c:1329: warning: expecting prototype for ppc440s=
pe_adma_device_estimate(). Prototype was for ppc440spe_adma_estimate() inst=
ead
   drivers/dma/ppc4xx/adma.c:1422: warning: Function parameter or member 'e=
ntry_idx' not described in 'ppc440spe_get_group_entry'
   drivers/dma/ppc4xx/adma.c:1446: warning: Function parameter or member 'c=
han' not described in 'ppc440spe_adma_free_slots'
   drivers/dma/ppc4xx/adma.c:1465: warning: Function parameter or member 'd=
esc' not described in 'ppc440spe_adma_run_tx_complete_actions'
   drivers/dma/ppc4xx/adma.c:1465: warning: Function parameter or member 'c=
han' not described in 'ppc440spe_adma_run_tx_complete_actions'
   drivers/dma/ppc4xx/adma.c:1465: warning: Function parameter or member 'c=
ookie' not described in 'ppc440spe_adma_run_tx_complete_actions'
   drivers/dma/ppc4xx/adma.c:1489: warning: Function parameter or member 'd=
esc' not described in 'ppc440spe_adma_clean_slot'
   drivers/dma/ppc4xx/adma.c:1489: warning: Function parameter or member 'c=
han' not described in 'ppc440spe_adma_clean_slot'
   drivers/dma/ppc4xx/adma.c:1534: warning: Function parameter or member 'c=
han' not described in '__ppc440spe_adma_slot_cleanup'
   drivers/dma/ppc4xx/adma.c:1662: warning: Function parameter or member 't=
' not described in 'ppc440spe_adma_tasklet'
   drivers/dma/ppc4xx/adma.c:1674: warning: Function parameter or member 'c=
han' not described in 'ppc440spe_adma_slot_cleanup'
   drivers/dma/ppc4xx/adma.c:1686: warning: Function parameter or member 'c=
han' not described in 'ppc440spe_adma_alloc_slots'
   drivers/dma/ppc4xx/adma.c:1686: warning: Function parameter or member 'n=
um_slots' not described in 'ppc440spe_adma_alloc_slots'
   drivers/dma/ppc4xx/adma.c:1686: warning: Function parameter or member 's=
lots_per_op' not described in 'ppc440spe_adma_alloc_slots'
   drivers/dma/ppc4xx/adma.c:1765: warning: Function parameter or member 'c=
han' not described in 'ppc440spe_adma_alloc_chan_resources'
   drivers/dma/ppc4xx/adma.c:1846: warning: Function parameter or member 'd=
esc' not described in 'ppc440spe_rxor_set_region'
   drivers/dma/ppc4xx/adma.c:1846: warning: Function parameter or member 'x=
or_arg_no' not described in 'ppc440spe_rxor_set_region'
   drivers/dma/ppc4xx/adma.c:1846: warning: Function parameter or member 'm=
ask' not described in 'ppc440spe_rxor_set_region'
>> drivers/dma/ppc4xx/adma.c:1846: warning: expecting prototype for ppc440s=
pe_rxor_set_region_data(). Prototype was for ppc440spe_rxor_set_region() in=
stead
   drivers/dma/ppc4xx/adma.c:1857: warning: Function parameter or member 'd=
esc' not described in 'ppc440spe_rxor_set_src'
   drivers/dma/ppc4xx/adma.c:1857: warning: Function parameter or member 'x=
or_arg_no' not described in 'ppc440spe_rxor_set_src'
   drivers/dma/ppc4xx/adma.c:1857: warning: Function parameter or member 'a=
ddr' not described in 'ppc440spe_rxor_set_src'
   drivers/dma/ppc4xx/adma.c:1869: warning: Function parameter or member 'd=
esc' not described in 'ppc440spe_rxor_set_mult'
   drivers/dma/ppc4xx/adma.c:1869: warning: Function parameter or member 'x=
or_arg_no' not described in 'ppc440spe_rxor_set_mult'
   drivers/dma/ppc4xx/adma.c:1869: warning: Function parameter or member 'i=
dx' not described in 'ppc440spe_rxor_set_mult'
   drivers/dma/ppc4xx/adma.c:1869: warning: Function parameter or member 'm=
ult' not described in 'ppc440spe_rxor_set_mult'
   drivers/dma/ppc4xx/adma.c:1880: warning: Function parameter or member 'c=
han' not described in 'ppc440spe_adma_check_threshold'
   drivers/dma/ppc4xx/adma.c:1896: warning: Function parameter or member 't=
x' not described in 'ppc440spe_adma_tx_submit'
   drivers/dma/ppc4xx/adma.c:1946: warning: Function parameter or member 'c=
han' not described in 'ppc440spe_adma_prep_dma_interrupt'
   drivers/dma/ppc4xx/adma.c:1946: warning: Function parameter or member 'f=
lags' not described in 'ppc440spe_adma_prep_dma_interrupt'
   drivers/dma/ppc4xx/adma.c:1978: warning: Function parameter or member 'c=
han' not described in 'ppc440spe_adma_prep_dma_memcpy'
   drivers/dma/ppc4xx/adma.c:1978: warning: Function parameter or member 'd=
ma_dest' not described in 'ppc440spe_adma_prep_dma_memcpy'
   drivers/dma/ppc4xx/adma.c:1978: warning: Function parameter or member 'd=
ma_src' not described in 'ppc440spe_adma_prep_dma_memcpy'
   drivers/dma/ppc4xx/adma.c:1978: warning: Function parameter or member 'l=
en' not described in 'ppc440spe_adma_prep_dma_memcpy'
   drivers/dma/ppc4xx/adma.c:1978: warning: Function parameter or member 'f=
lags' not described in 'ppc440spe_adma_prep_dma_memcpy'
   drivers/dma/ppc4xx/adma.c:2020: warning: Function parameter or member 'c=
han' not described in 'ppc440spe_adma_prep_dma_xor'
   drivers/dma/ppc4xx/adma.c:2020: warning: Function parameter or member 'd=
ma_dest' not described in 'ppc440spe_adma_prep_dma_xor'
   drivers/dma/ppc4xx/adma.c:2020: warning: Function parameter or member 'd=
ma_src' not described in 'ppc440spe_adma_prep_dma_xor'
   drivers/dma/ppc4xx/adma.c:2020: warning: Function parameter or member 's=
rc_cnt' not described in 'ppc440spe_adma_prep_dma_xor'
   drivers/dma/ppc4xx/adma.c:2020: warning: Function parameter or member 'l=
en' not described in 'ppc440spe_adma_prep_dma_xor'
   drivers/dma/ppc4xx/adma.c:2020: warning: Function parameter or member 'f=
lags' not described in 'ppc440spe_adma_prep_dma_xor'
   drivers/dma/ppc4xx/adma.c:2069: warning: Function parameter or member 'd=
esc' not described in 'ppc440spe_adma_init_dma2rxor_slot'
   drivers/dma/ppc4xx/adma.c:2069: warning: Function parameter or member 's=
rc' not described in 'ppc440spe_adma_init_dma2rxor_slot'
   drivers/dma/ppc4xx/adma.c:2069: warning: Function parameter or member 's=
rc_cnt' not described in 'ppc440spe_adma_init_dma2rxor_slot'
   drivers/dma/ppc4xx/adma.c:2087: warning: Function parameter or member 'p=
pc440spe_chan' not described in 'ppc440spe_dma01_prep_mult'
   drivers/dma/ppc4xx/adma.c:2087: warning: Function parameter or member 'd=
st' not described in 'ppc440spe_dma01_prep_mult'
   drivers/dma/ppc4xx/adma.c:2087: warning: Function parameter or member 'd=
st_cnt' not described in 'ppc440spe_dma01_prep_mult'
   drivers/dma/ppc4xx/adma.c:2087: warning: Function parameter or member 's=
rc' not described in 'ppc440spe_dma01_prep_mult'
   drivers/dma/ppc4xx/adma.c:2087: warning: Function parameter or member 's=
rc_cnt' not described in 'ppc440spe_dma01_prep_mult'
   drivers/dma/ppc4xx/adma.c:2087: warning: Function parameter or member 's=
cf' not described in 'ppc440spe_dma01_prep_mult'
   drivers/dma/ppc4xx/adma.c:2087: warning: Function parameter or member 'l=
en' not described in 'ppc440spe_dma01_prep_mult'
   drivers/dma/ppc4xx/adma.c:2087: warning: Function parameter or member 'f=
lags' not described in 'ppc440spe_dma01_prep_mult'
   drivers/dma/ppc4xx/adma.c:2173: warning: Function parameter or member 'p=
pc440spe_chan' not described in 'ppc440spe_dma01_prep_sum_product'
   drivers/dma/ppc4xx/adma.c:2173: warning: Function parameter or member 'd=
st' not described in 'ppc440spe_dma01_prep_sum_product'
   drivers/dma/ppc4xx/adma.c:2173: warning: Function parameter or member 's=
rc' not described in 'ppc440spe_dma01_prep_sum_product'
   drivers/dma/ppc4xx/adma.c:2173: warning: Function parameter or member 's=
rc_cnt' not described in 'ppc440spe_dma01_prep_sum_product'
   drivers/dma/ppc4xx/adma.c:2173: warning: Function parameter or member 's=
cf' not described in 'ppc440spe_dma01_prep_sum_product'
   drivers/dma/ppc4xx/adma.c:2173: warning: Function parameter or member 'l=
en' not described in 'ppc440spe_dma01_prep_sum_product'
   drivers/dma/ppc4xx/adma.c:2173: warning: Function parameter or member 'f=
lags' not described in 'ppc440spe_dma01_prep_sum_product'
   drivers/dma/ppc4xx/adma.c:2511: warning: Function parameter or member 'c=
han' not described in 'ppc440spe_adma_prep_dma_pq'
   drivers/dma/ppc4xx/adma.c:2511: warning: Function parameter or member 'd=
st' not described in 'ppc440spe_adma_prep_dma_pq'
   drivers/dma/ppc4xx/adma.c:2511: warning: Function parameter or member 's=
rc' not described in 'ppc440spe_adma_prep_dma_pq'
   drivers/dma/ppc4xx/adma.c:2511: warning: Function parameter or member 's=
rc_cnt' not described in 'ppc440spe_adma_prep_dma_pq'
   drivers/dma/ppc4xx/adma.c:2511: warning: Function parameter or member 's=
cf' not described in 'ppc440spe_adma_prep_dma_pq'
   drivers/dma/ppc4xx/adma.c:2511: warning: Function parameter or member 'l=
en' not described in 'ppc440spe_adma_prep_dma_pq'
   drivers/dma/ppc4xx/adma.c:2511: warning: Function parameter or member 'f=
lags' not described in 'ppc440spe_adma_prep_dma_pq'
   drivers/dma/ppc4xx/adma.c:2587: warning: Function parameter or member 'c=
han' not described in 'ppc440spe_adma_prep_dma_pqzero_sum'
   drivers/dma/ppc4xx/adma.c:2587: warning: Function parameter or member 'p=
q' not described in 'ppc440spe_adma_prep_dma_pqzero_sum'
   drivers/dma/ppc4xx/adma.c:2587: warning: Function parameter or member 's=
rc' not described in 'ppc440spe_adma_prep_dma_pqzero_sum'
   drivers/dma/ppc4xx/adma.c:2587: warning: Function parameter or member 's=
rc_cnt' not described in 'ppc440spe_adma_prep_dma_pqzero_sum'
   drivers/dma/ppc4xx/adma.c:2587: warning: Function parameter or member 's=
cf' not described in 'ppc440spe_adma_prep_dma_pqzero_sum'
   drivers/dma/ppc4xx/adma.c:2587: warning: Function parameter or member 'l=
en' not described in 'ppc440spe_adma_prep_dma_pqzero_sum'
   drivers/dma/ppc4xx/adma.c:2587: warning: Function parameter or member 'p=
qres' not described in 'ppc440spe_adma_prep_dma_pqzero_sum'
   drivers/dma/ppc4xx/adma.c:2587: warning: Function parameter or member 'f=
lags' not described in 'ppc440spe_adma_prep_dma_pqzero_sum'
   drivers/dma/ppc4xx/adma.c:2765: warning: Function parameter or member 'c=
han' not described in 'ppc440spe_adma_prep_dma_xor_zero_sum'
   drivers/dma/ppc4xx/adma.c:2765: warning: Function parameter or member 's=
rc' not described in 'ppc440spe_adma_prep_dma_xor_zero_sum'
   drivers/dma/ppc4xx/adma.c:2765: warning: Function parameter or member 's=
rc_cnt' not described in 'ppc440spe_adma_prep_dma_xor_zero_sum'
   drivers/dma/ppc4xx/adma.c:2765: warning: Function parameter or member 'l=
en' not described in 'ppc440spe_adma_prep_dma_xor_zero_sum'
   drivers/dma/ppc4xx/adma.c:2765: warning: Function parameter or member 'r=
esult' not described in 'ppc440spe_adma_prep_dma_xor_zero_sum'
   drivers/dma/ppc4xx/adma.c:2765: warning: Function parameter or member 'f=
lags' not described in 'ppc440spe_adma_prep_dma_xor_zero_sum'
   drivers/dma/ppc4xx/adma.c:2785: warning: Function parameter or member 's=
w_desc' not described in 'ppc440spe_adma_set_dest'
   drivers/dma/ppc4xx/adma.c:2785: warning: Function parameter or member 'a=
ddr' not described in 'ppc440spe_adma_set_dest'
   drivers/dma/ppc4xx/adma.c:2785: warning: Function parameter or member 'i=
ndex' not described in 'ppc440spe_adma_set_dest'
   drivers/dma/ppc4xx/adma.c:2832: warning: Function parameter or member 's=
w_desc' not described in 'ppc440spe_adma_pq_set_dest'
   drivers/dma/ppc4xx/adma.c:2832: warning: Function parameter or member 'a=
ddrs' not described in 'ppc440spe_adma_pq_set_dest'
   drivers/dma/ppc4xx/adma.c:2832: warning: Function parameter or member 'f=
lags' not described in 'ppc440spe_adma_pq_set_dest'
   drivers/dma/ppc4xx/adma.c:3022: warning: Function parameter or member 's=
w_desc' not described in 'ppc440spe_adma_pqzero_sum_set_dest'
   drivers/dma/ppc4xx/adma.c:3022: warning: Function parameter or member 'p=
addr' not described in 'ppc440spe_adma_pqzero_sum_set_dest'
   drivers/dma/ppc4xx/adma.c:3022: warning: Function parameter or member 'q=
addr' not described in 'ppc440spe_adma_pqzero_sum_set_dest'
>> drivers/dma/ppc4xx/adma.c:3022: warning: expecting prototype for ppc440s=
pe_adma_pq_zero_sum_set_dest(). Prototype was for ppc440spe_adma_pqzero_sum=
_set_dest() instead
   drivers/dma/ppc4xx/adma.c:3086: warning: Function parameter or member 'd=
esc' not described in 'ppc440spe_desc_set_xor_src_cnt'
   drivers/dma/ppc4xx/adma.c:3086: warning: Function parameter or member 's=
rc_cnt' not described in 'ppc440spe_desc_set_xor_src_cnt'
   drivers/dma/ppc4xx/adma.c:3098: warning: Function parameter or member 's=
w_desc' not described in 'ppc440spe_adma_pq_set_src'
   drivers/dma/ppc4xx/adma.c:3098: warning: Function parameter or member 'a=
ddr' not described in 'ppc440spe_adma_pq_set_src'
   drivers/dma/ppc4xx/adma.c:3098: warning: Function parameter or member 'i=
ndex' not described in 'ppc440spe_adma_pq_set_src'
   drivers/dma/ppc4xx/adma.c:3208: warning: Function parameter or member 's=
w_desc' not described in 'ppc440spe_adma_memcpy_xor_set_src'
   drivers/dma/ppc4xx/adma.c:3208: warning: Function parameter or member 'a=
ddr' not described in 'ppc440spe_adma_memcpy_xor_set_src'
   drivers/dma/ppc4xx/adma.c:3208: warning: Function parameter or member 'i=
ndex' not described in 'ppc440spe_adma_memcpy_xor_set_src'
   drivers/dma/ppc4xx/adma.c:3224: warning: Function parameter or member 'd=
esc' not described in 'ppc440spe_adma_dma2rxor_inc_addr'
   drivers/dma/ppc4xx/adma.c:3224: warning: Function parameter or member 'c=
ursor' not described in 'ppc440spe_adma_dma2rxor_inc_addr'
   drivers/dma/ppc4xx/adma.c:3224: warning: Function parameter or member 'i=
ndex' not described in 'ppc440spe_adma_dma2rxor_inc_addr'
   drivers/dma/ppc4xx/adma.c:3224: warning: Function parameter or member 's=
rc_cnt' not described in 'ppc440spe_adma_dma2rxor_inc_addr'
   drivers/dma/ppc4xx/adma.c:3242: warning: Function parameter or member 'h=
desc' not described in 'ppc440spe_adma_dma2rxor_prep_src'
   drivers/dma/ppc4xx/adma.c:3242: warning: Function parameter or member 'c=
ursor' not described in 'ppc440spe_adma_dma2rxor_prep_src'
   drivers/dma/ppc4xx/adma.c:3242: warning: Function parameter or member 'i=
ndex' not described in 'ppc440spe_adma_dma2rxor_prep_src'
   drivers/dma/ppc4xx/adma.c:3242: warning: Function parameter or member 's=
rc_cnt' not described in 'ppc440spe_adma_dma2rxor_prep_src'
   drivers/dma/ppc4xx/adma.c:3242: warning: Function parameter or member 'a=
ddr' not described in 'ppc440spe_adma_dma2rxor_prep_src'
   drivers/dma/ppc4xx/adma.c:3360: warning: Function parameter or member 'd=
esc' not described in 'ppc440spe_adma_dma2rxor_set_src'
   drivers/dma/ppc4xx/adma.c:3360: warning: Function parameter or member 'i=
ndex' not described in 'ppc440spe_adma_dma2rxor_set_src'
   drivers/dma/ppc4xx/adma.c:3360: warning: Function parameter or member 'a=
ddr' not described in 'ppc440spe_adma_dma2rxor_set_src'
   drivers/dma/ppc4xx/adma.c:3401: warning: Function parameter or member 'd=
esc' not described in 'ppc440spe_adma_dma2rxor_set_mult'
   drivers/dma/ppc4xx/adma.c:3401: warning: Function parameter or member 'i=
ndex' not described in 'ppc440spe_adma_dma2rxor_set_mult'
   drivers/dma/ppc4xx/adma.c:3401: warning: Function parameter or member 'm=
ult' not described in 'ppc440spe_adma_dma2rxor_set_mult'
   drivers/dma/ppc4xx/adma.c:3437: warning: Function parameter or member 'c=
ursor' not described in 'ppc440spe_init_rxor_cursor'
   drivers/dma/ppc4xx/adma.c:3449: warning: Function parameter or member 's=
w_desc' not described in 'ppc440spe_adma_pq_set_src_mult'
   drivers/dma/ppc4xx/adma.c:3449: warning: Function parameter or member 'm=
ult' not described in 'ppc440spe_adma_pq_set_src_mult'
   drivers/dma/ppc4xx/adma.c:3449: warning: Function parameter or member 'i=
ndex' not described in 'ppc440spe_adma_pq_set_src_mult'
   drivers/dma/ppc4xx/adma.c:3449: warning: Function parameter or member 'd=
st_pos' not described in 'ppc440spe_adma_pq_set_src_mult'
   drivers/dma/ppc4xx/adma.c:3533: warning: Function parameter or member 'c=
han' not described in 'ppc440spe_adma_free_chan_resources'
   drivers/dma/ppc4xx/adma.c:3593: warning: Function parameter or member 'i=
rq' not described in 'ppc440spe_adma_eot_handler'
   drivers/dma/ppc4xx/adma.c:3593: warning: Function parameter or member 'd=
ata' not described in 'ppc440spe_adma_eot_handler'
   drivers/dma/ppc4xx/adma.c:3610: warning: Function parameter or member 'i=
rq' not described in 'ppc440spe_adma_err_handler'
   drivers/dma/ppc4xx/adma.c:3610: warning: Function parameter or member 'd=
ata' not described in 'ppc440spe_adma_err_handler'
   drivers/dma/ppc4xx/adma.c:3626: warning: Function parameter or member 'u=
nused' not described in 'ppc440spe_test_callback'
   drivers/dma/ppc4xx/adma.c:3634: warning: Function parameter or member 'c=
han' not described in 'ppc440spe_adma_issue_pending'
   drivers/dma/ppc4xx/adma.c:3654: warning: Function parameter or member 'c=
han' not described in 'ppc440spe_chan_start_null_xor'
   drivers/dma/ppc4xx/adma.c:3700: warning: Function parameter or member 'c=
han' not described in 'ppc440spe_test_raid6'
   drivers/dma/ppc4xx/adma.c:4005: warning: Function parameter or member 'o=
fdev' not described in 'ppc440spe_adma_probe'
   drivers/dma/ppc4xx/adma.c:4234: warning: Function parameter or member 'o=
fdev' not described in 'ppc440spe_adma_remove'

sparse warnings: (new ones prefixed by >>)
>> drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
>> drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
>> drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
>> drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
>> drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
>> drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
>> drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
>> drivers/dma/ppc4xx/adma.c:543:35: sparse: sparse: incorrect type in assi=
gnment (different base types) @@     expected unsigned int [usertype] sg1l =
@@     got restricted __le32 [usertype] @@
   drivers/dma/ppc4xx/adma.c:543:35: sparse:     expected unsigned int [use=
rtype] sg1l
   drivers/dma/ppc4xx/adma.c:543:35: sparse:     got restricted __le32 [use=
rtype]
>> drivers/dma/ppc4xx/adma.c:544:35: sparse: sparse: invalid assignment: |=
=3D
>> drivers/dma/ppc4xx/adma.c:544:35: sparse:    left side has type unsigned=
 int
>> drivers/dma/ppc4xx/adma.c:544:35: sparse:    right side has type restric=
ted __le32
   drivers/dma/ppc4xx/adma.c:589:23: sparse: sparse: invalid assignment: |=
=3D
   drivers/dma/ppc4xx/adma.c:589:23: sparse:    left side has type unsigned=
 int
   drivers/dma/ppc4xx/adma.c:589:23: sparse:    right side has type restric=
ted __le32
>> drivers/dma/ppc4xx/adma.c:627:23: sparse: sparse: incorrect type in assi=
gnment (different base types) @@     expected unsigned int [usertype] @@   =
  got restricted __le32 [usertype] @@
   drivers/dma/ppc4xx/adma.c:627:23: sparse:     expected unsigned int [use=
rtype]
   drivers/dma/ppc4xx/adma.c:627:23: sparse:     got restricted __le32 [use=
rtype]
   drivers/dma/ppc4xx/adma.c:628:23: sparse: sparse: invalid assignment: |=
=3D
   drivers/dma/ppc4xx/adma.c:628:23: sparse:    left side has type unsigned=
 int
   drivers/dma/ppc4xx/adma.c:628:23: sparse:    right side has type restric=
ted __le32
>> drivers/dma/ppc4xx/adma.c:653:34: sparse: sparse: incorrect type in assi=
gnment (different base types) @@     expected unsigned int [usertype] cnt @=
@     got restricted __le32 [usertype] @@
   drivers/dma/ppc4xx/adma.c:653:34: sparse:     expected unsigned int [use=
rtype] cnt
   drivers/dma/ppc4xx/adma.c:653:34: sparse:     got restricted __le32 [use=
rtype]
>> drivers/dma/ppc4xx/adma.c:686:38: sparse: sparse: incorrect type in argu=
ment 2 (different address spaces) @@     expected void volatile [noderef] _=
_iomem *addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:686:38: sparse:     expected void volatile [no=
deref] __iomem *addr
   drivers/dma/ppc4xx/adma.c:686:38: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:687:38: sparse: sparse: incorrect type in argu=
ment 2 (different address spaces) @@     expected void volatile [noderef] _=
_iomem *addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:687:38: sparse:     expected void volatile [no=
deref] __iomem *addr
   drivers/dma/ppc4xx/adma.c:687:38: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:688:38: sparse: sparse: incorrect type in argu=
ment 2 (different address spaces) @@     expected void volatile [noderef] _=
_iomem *addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:688:38: sparse:     expected void volatile [no=
deref] __iomem *addr
   drivers/dma/ppc4xx/adma.c:688:38: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:689:39: sparse: sparse: incorrect type in argu=
ment 2 (different address spaces) @@     expected void volatile [noderef] _=
_iomem *addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:689:39: sparse:     expected void volatile [no=
deref] __iomem *addr
   drivers/dma/ppc4xx/adma.c:689:39: sparse:     got unsigned int *
>> drivers/dma/ppc4xx/adma.c:734:17: sparse: sparse: Using plain integer as=
 NULL pointer
>> drivers/dma/ppc4xx/adma.c:1185:25: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct dma_regs *dma_reg=
 @@     got struct dma_regs [noderef] __iomem *dma_reg @@
   drivers/dma/ppc4xx/adma.c:1185:25: sparse:     expected struct dma_regs =
*dma_reg
   drivers/dma/ppc4xx/adma.c:1185:25: sparse:     got struct dma_regs [node=
ref] __iomem *dma_reg
>> drivers/dma/ppc4xx/adma.c:1186:34: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const volatile [nod=
eref] __iomem *addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1186:34: sparse:     expected void const volat=
ile [noderef] __iomem *addr
   drivers/dma/ppc4xx/adma.c:1186:34: sparse:     got unsigned int *
>> drivers/dma/ppc4xx/adma.c:1188:25: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct xor_regs *xor_reg=
 @@     got struct xor_regs [noderef] __iomem *xor_reg @@
   drivers/dma/ppc4xx/adma.c:1188:25: sparse:     expected struct xor_regs =
*xor_reg
   drivers/dma/ppc4xx/adma.c:1188:25: sparse:     got struct xor_regs [node=
ref] __iomem *xor_reg
>> drivers/dma/ppc4xx/adma.c:1189:36: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const [noderef] __i=
omem *addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1189:36: sparse:     expected void const [node=
ref] __iomem *addr
   drivers/dma/ppc4xx/adma.c:1189:36: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:1136:25: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct xor_regs *xor_reg=
 @@     got struct xor_regs [noderef] __iomem *xor_reg @@
   drivers/dma/ppc4xx/adma.c:1136:25: sparse:     expected struct xor_regs =
*xor_reg
   drivers/dma/ppc4xx/adma.c:1136:25: sparse:     got struct xor_regs [node=
ref] __iomem *xor_reg
   drivers/dma/ppc4xx/adma.c:1145:35: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const [noderef] __i=
omem *addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1145:35: sparse:     expected void const [node=
ref] __iomem *addr
   drivers/dma/ppc4xx/adma.c:1145:35: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:1155:49: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const [noderef] __i=
omem *addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1155:49: sparse:     expected void const [node=
ref] __iomem *addr
   drivers/dma/ppc4xx/adma.c:1155:49: sparse:     got unsigned int *
>> drivers/dma/ppc4xx/adma.c:1157:38: sparse: sparse: incorrect type in arg=
ument 2 (different address spaces) @@     expected void [noderef] __iomem *=
addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1157:38: sparse:     expected void [noderef] _=
_iomem *addr
   drivers/dma/ppc4xx/adma.c:1157:38: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:909:25: sparse: sparse: incorrect type in assi=
gnment (different address spaces) @@     expected struct dma_regs *dma_reg =
@@     got struct dma_regs [noderef] __iomem *dma_reg @@
   drivers/dma/ppc4xx/adma.c:909:25: sparse:     expected struct dma_regs *=
dma_reg
   drivers/dma/ppc4xx/adma.c:909:25: sparse:     got struct dma_regs [noder=
ef] __iomem *dma_reg
   drivers/dma/ppc4xx/adma.c:910:40: sparse: sparse: incorrect type in argu=
ment 1 (different address spaces) @@     expected void const volatile [node=
ref] __iomem *addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:910:40: sparse:     expected void const volati=
le [noderef] __iomem *addr
   drivers/dma/ppc4xx/adma.c:910:40: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:927:37: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:972:32: sparse: sparse: incorrect type in argu=
ment 1 (different address spaces) @@     expected void const volatile [node=
ref] __iomem *addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:972:32: sparse:     expected void const volati=
le [noderef] __iomem *addr
   drivers/dma/ppc4xx/adma.c:972:32: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:977:40: sparse: sparse: incorrect type in argu=
ment 2 (different address spaces) @@     expected void volatile [noderef] _=
_iomem *addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:977:40: sparse:     expected void volatile [no=
deref] __iomem *addr
   drivers/dma/ppc4xx/adma.c:977:40: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:982:25: sparse: sparse: incorrect type in assi=
gnment (different address spaces) @@     expected struct xor_regs *xor_reg =
@@     got struct xor_regs [noderef] __iomem *xor_reg @@
   drivers/dma/ppc4xx/adma.c:982:25: sparse:     expected struct xor_regs *=
xor_reg
   drivers/dma/ppc4xx/adma.c:982:25: sparse:     got struct xor_regs [noder=
ef] __iomem *xor_reg
   drivers/dma/ppc4xx/adma.c:983:34: sparse: sparse: incorrect type in argu=
ment 1 (different address spaces) @@     expected void const [noderef] __io=
mem *addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:983:34: sparse:     expected void const [noder=
ef] __iomem *addr
   drivers/dma/ppc4xx/adma.c:983:34: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:984:34: sparse: sparse: incorrect type in argu=
ment 2 (different address spaces) @@     expected void [noderef] __iomem *a=
ddr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:984:34: sparse:     expected void [noderef] __=
iomem *addr
   drivers/dma/ppc4xx/adma.c:984:34: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:991:55: sparse: sparse: incorrect type in argu=
ment 1 (different address spaces) @@     expected void const [noderef] __io=
mem *addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:991:55: sparse:     expected void const [noder=
ef] __iomem *addr
   drivers/dma/ppc4xx/adma.c:991:55: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:993:51: sparse: sparse: incorrect type in argu=
ment 2 (different address spaces) @@     expected void [noderef] __iomem *a=
ddr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:993:51: sparse:     expected void [noderef] __=
iomem *addr
   drivers/dma/ppc4xx/adma.c:993:51: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:995:51: sparse: sparse: incorrect type in argu=
ment 1 (different address spaces) @@     expected void const [noderef] __io=
mem *addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:995:51: sparse:     expected void const [noder=
ef] __iomem *addr
   drivers/dma/ppc4xx/adma.c:995:51: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:997:46: sparse: sparse: incorrect type in argu=
ment 2 (different address spaces) @@     expected void [noderef] __iomem *a=
ddr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:997:46: sparse:     expected void [noderef] __=
iomem *addr
   drivers/dma/ppc4xx/adma.c:997:46: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:1006:35: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const [noderef] __i=
omem *addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1006:35: sparse:     expected void const [node=
ref] __iomem *addr
   drivers/dma/ppc4xx/adma.c:1006:35: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:1025:25: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct dma_regs *dma_reg=
 @@     got struct dma_regs [noderef] __iomem *dma_reg @@
   drivers/dma/ppc4xx/adma.c:1025:25: sparse:     expected struct dma_regs =
*dma_reg
   drivers/dma/ppc4xx/adma.c:1025:25: sparse:     got struct dma_regs [node=
ref] __iomem *dma_reg
>> drivers/dma/ppc4xx/adma.c:1029:31: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const volatile [nod=
eref] __iomem *addr @@     got unsigned short * @@
   drivers/dma/ppc4xx/adma.c:1029:31: sparse:     expected void const volat=
ile [noderef] __iomem *addr
   drivers/dma/ppc4xx/adma.c:1029:31: sparse:     got unsigned short *
   drivers/dma/ppc4xx/adma.c:1029:60: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const volatile [nod=
eref] __iomem *addr @@     got unsigned short * @@
   drivers/dma/ppc4xx/adma.c:1029:60: sparse:     expected void const volat=
ile [noderef] __iomem *addr
   drivers/dma/ppc4xx/adma.c:1029:60: sparse:     got unsigned short *
   drivers/dma/ppc4xx/adma.c:1030:31: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const volatile [nod=
eref] __iomem *addr @@     got unsigned short * @@
   drivers/dma/ppc4xx/adma.c:1030:31: sparse:     expected void const volat=
ile [noderef] __iomem *addr
   drivers/dma/ppc4xx/adma.c:1030:31: sparse:     got unsigned short *
   drivers/dma/ppc4xx/adma.c:1030:60: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const volatile [nod=
eref] __iomem *addr @@     got unsigned short * @@
   drivers/dma/ppc4xx/adma.c:1030:60: sparse:     expected void const volat=
ile [noderef] __iomem *addr
   drivers/dma/ppc4xx/adma.c:1030:60: sparse:     got unsigned short *
   drivers/dma/ppc4xx/adma.c:1036:25: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct xor_regs *xor_reg=
 @@     got struct xor_regs [noderef] __iomem *xor_reg @@
   drivers/dma/ppc4xx/adma.c:1036:25: sparse:     expected struct xor_regs =
*xor_reg
   drivers/dma/ppc4xx/adma.c:1036:25: sparse:     got struct xor_regs [node=
ref] __iomem *xor_reg
   drivers/dma/ppc4xx/adma.c:1037:37: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const [noderef] __i=
omem *addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1037:37: sparse:     expected void const [node=
ref] __iomem *addr
   drivers/dma/ppc4xx/adma.c:1037:37: sparse:     got unsigned int *
>> drivers/dma/ppc4xx/adma.c:1051:48: sparse: sparse: incorrect type in ini=
tializer (different address spaces) @@     expected struct xor_regs *xor_re=
g @@     got struct xor_regs [noderef] __iomem *xor_reg @@
   drivers/dma/ppc4xx/adma.c:1051:48: sparse:     expected struct xor_regs =
*xor_reg
   drivers/dma/ppc4xx/adma.c:1051:48: sparse:     got struct xor_regs [node=
ref] __iomem *xor_reg
   drivers/dma/ppc4xx/adma.c:1053:25: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const [noderef] __i=
omem *addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1053:25: sparse:     expected void const [node=
ref] __iomem *addr
   drivers/dma/ppc4xx/adma.c:1053:25: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:1060:41: sparse: sparse: incorrect type in arg=
ument 2 (different address spaces) @@     expected void [noderef] __iomem *=
addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1060:41: sparse:     expected void [noderef] _=
_iomem *addr
   drivers/dma/ppc4xx/adma.c:1060:41: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:1062:39: sparse: sparse: incorrect type in arg=
ument 2 (different address spaces) @@     expected void [noderef] __iomem *=
addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1062:39: sparse:     expected void [noderef] _=
_iomem *addr
   drivers/dma/ppc4xx/adma.c:1062:39: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:1063:25: sparse: sparse: incorrect type in arg=
ument 2 (different address spaces) @@     expected void [noderef] __iomem *=
addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1063:25: sparse:     expected void [noderef] _=
_iomem *addr
   drivers/dma/ppc4xx/adma.c:1063:25: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:1064:33: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const [noderef] __i=
omem *addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1064:33: sparse:     expected void const [node=
ref] __iomem *addr
   drivers/dma/ppc4xx/adma.c:1064:33: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:1065:22: sparse: sparse: incorrect type in arg=
ument 2 (different address spaces) @@     expected void [noderef] __iomem *=
addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1065:22: sparse:     expected void [noderef] _=
_iomem *addr
   drivers/dma/ppc4xx/adma.c:1065:22: sparse:     got unsigned int *
>> drivers/dma/ppc4xx/adma.c:1078:48: sparse: sparse: incorrect type in ini=
tializer (different address spaces) @@     expected struct dma_regs *dma_re=
g @@     got struct dma_regs [noderef] __iomem *dma_reg @@
   drivers/dma/ppc4xx/adma.c:1078:48: sparse:     expected struct dma_regs =
*dma_reg
   drivers/dma/ppc4xx/adma.c:1078:48: sparse:     got struct dma_regs [node=
ref] __iomem *dma_reg
   drivers/dma/ppc4xx/adma.c:1088:26: sparse: sparse: incorrect type in arg=
ument 2 (different address spaces) @@     expected void volatile [noderef] =
__iomem *addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1088:26: sparse:     expected void volatile [n=
oderef] __iomem *addr
   drivers/dma/ppc4xx/adma.c:1088:26: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:1208:25: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct xor_regs *xor_reg=
 @@     got struct xor_regs [noderef] __iomem *xor_reg @@
   drivers/dma/ppc4xx/adma.c:1208:25: sparse:     expected struct xor_regs =
*xor_reg
   drivers/dma/ppc4xx/adma.c:1208:25: sparse:     got struct xor_regs [node=
ref] __iomem *xor_reg
   drivers/dma/ppc4xx/adma.c:1212:30: sparse: sparse: incorrect type in arg=
ument 2 (different address spaces) @@     expected void [noderef] __iomem *=
addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1212:30: sparse:     expected void [noderef] _=
_iomem *addr
   drivers/dma/ppc4xx/adma.c:1212:30: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:2775:62: sparse: sparse: Using plain integer a=
s NULL pointer
>> drivers/dma/ppc4xx/adma.c:4091:14: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected void *regs @@     got vo=
id [noderef] __iomem * @@
   drivers/dma/ppc4xx/adma.c:4091:14: sparse:     expected void *regs
   drivers/dma/ppc4xx/adma.c:4091:14: sparse:     got void [noderef] __iome=
m *
>> drivers/dma/ppc4xx/adma.c:4099:31: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct xor_regs [noderef=
] __iomem *xor_reg @@     got void *regs @@
   drivers/dma/ppc4xx/adma.c:4099:31: sparse:     expected struct xor_regs =
[noderef] __iomem *xor_reg
   drivers/dma/ppc4xx/adma.c:4099:31: sparse:     got void *regs
>> drivers/dma/ppc4xx/adma.c:4106:31: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct dma_regs [noderef=
] __iomem *dma_reg @@     got void *regs @@
   drivers/dma/ppc4xx/adma.c:4106:31: sparse:     expected struct dma_regs =
[noderef] __iomem *dma_reg
   drivers/dma/ppc4xx/adma.c:4106:31: sparse:     got void *regs

vim +1329 drivers/dma/ppc4xx/adma.c

12458ea06efd7b Anatolij Gustschin 2009-12-11  1090  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  1091  /**
12458ea06efd7b Anatolij Gustschin 2009-12-11  1092   * ppc440spe_chan_appen=
d - update the h/w chain in the channel
12458ea06efd7b Anatolij Gustschin 2009-12-11  1093   */
12458ea06efd7b Anatolij Gustschin 2009-12-11  1094  static void ppc440spe_c=
han_append(struct ppc440spe_adma_chan *chan)
12458ea06efd7b Anatolij Gustschin 2009-12-11  1095  {
12458ea06efd7b Anatolij Gustschin 2009-12-11  1096  	struct xor_regs *xor_r=
eg;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1097  	struct ppc440spe_adma_=
desc_slot *iter;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1098  	struct xor_cb *xcb;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1099  	u32 cur_desc;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1100  	unsigned long flags;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1101  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  1102  	local_irq_save(flags);
12458ea06efd7b Anatolij Gustschin 2009-12-11  1103  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  1104  	switch (chan->device->=
id) {
12458ea06efd7b Anatolij Gustschin 2009-12-11  1105  	case PPC440SPE_DMA0_ID:
12458ea06efd7b Anatolij Gustschin 2009-12-11  1106  	case PPC440SPE_DMA1_ID:
12458ea06efd7b Anatolij Gustschin 2009-12-11  1107  		cur_desc =3D ppc440sp=
e_chan_get_current_descriptor(chan);
12458ea06efd7b Anatolij Gustschin 2009-12-11  1108  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  1109  		if (likely(cur_desc))=
 {
12458ea06efd7b Anatolij Gustschin 2009-12-11  1110  			iter =3D chan_last_s=
ub[chan->device->id];
12458ea06efd7b Anatolij Gustschin 2009-12-11  1111  			BUG_ON(!iter);
12458ea06efd7b Anatolij Gustschin 2009-12-11  1112  		} else {
12458ea06efd7b Anatolij Gustschin 2009-12-11  1113  			/* first peer */
12458ea06efd7b Anatolij Gustschin 2009-12-11  1114  			iter =3D chan_first_=
cdb[chan->device->id];
12458ea06efd7b Anatolij Gustschin 2009-12-11  1115  			BUG_ON(!iter);
12458ea06efd7b Anatolij Gustschin 2009-12-11  1116  			ppc440spe_dma_put_de=
sc(chan, iter);
12458ea06efd7b Anatolij Gustschin 2009-12-11  1117  			chan->hw_chain_inite=
d =3D 1;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1118  		}
12458ea06efd7b Anatolij Gustschin 2009-12-11  1119  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  1120  		/* is there something=
 new to append */
12458ea06efd7b Anatolij Gustschin 2009-12-11  1121  		if (!iter->hw_next)
12458ea06efd7b Anatolij Gustschin 2009-12-11  1122  			break;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1123  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  1124  		/* flush descriptors =
from the s/w queue to fifo */
12458ea06efd7b Anatolij Gustschin 2009-12-11  1125  		list_for_each_entry_c=
ontinue(iter, &chan->chain, chain_node) {
12458ea06efd7b Anatolij Gustschin 2009-12-11  1126  			ppc440spe_dma_put_de=
sc(chan, iter);
12458ea06efd7b Anatolij Gustschin 2009-12-11  1127  			if (!iter->hw_next)
12458ea06efd7b Anatolij Gustschin 2009-12-11  1128  				break;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1129  		}
12458ea06efd7b Anatolij Gustschin 2009-12-11  1130  		break;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1131  	case PPC440SPE_XOR_ID:
12458ea06efd7b Anatolij Gustschin 2009-12-11  1132  		/* update h/w links a=
nd refetch */
12458ea06efd7b Anatolij Gustschin 2009-12-11  1133  		if (!xor_last_submit-=
>hw_next)
12458ea06efd7b Anatolij Gustschin 2009-12-11  1134  			break;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1135  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  1136  		xor_reg =3D chan->dev=
ice->xor_reg;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1137  		/* the last linked CD=
B has to generate an interrupt
12458ea06efd7b Anatolij Gustschin 2009-12-11  1138  		 * that we'd be able =
to append the next lists to h/w
12458ea06efd7b Anatolij Gustschin 2009-12-11  1139  		 * regardless of the =
XOR engine state at the moment of
12458ea06efd7b Anatolij Gustschin 2009-12-11  1140  		 * appending of these=
 next lists
12458ea06efd7b Anatolij Gustschin 2009-12-11  1141  		 */
12458ea06efd7b Anatolij Gustschin 2009-12-11  1142  		xcb =3D xor_last_link=
ed->hw_desc;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1143  		xcb->cbc |=3D XOR_CBC=
R_CBCE_BIT;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1144  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  1145  		if (!(ioread32be(&xor=
_reg->sr) & XOR_SR_XCP_BIT)) {
12458ea06efd7b Anatolij Gustschin 2009-12-11  1146  			/* XORcore is idle. =
Refetch now */
12458ea06efd7b Anatolij Gustschin 2009-12-11  1147  			do_xor_refetch =3D 0;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1148  			ppc440spe_xor_set_li=
nk(xor_last_submit,
12458ea06efd7b Anatolij Gustschin 2009-12-11  1149  				xor_last_submit->hw=
_next);
12458ea06efd7b Anatolij Gustschin 2009-12-11  1150  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  1151  			ADMA_LL_DBG(print_cb=
_list(chan,
12458ea06efd7b Anatolij Gustschin 2009-12-11  1152  				xor_last_submit->hw=
_next));
12458ea06efd7b Anatolij Gustschin 2009-12-11  1153  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  1154  			xor_last_submit =3D =
xor_last_linked;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1155  			iowrite32be(ioread32=
be(&xor_reg->crsr) |
12458ea06efd7b Anatolij Gustschin 2009-12-11  1156  				    XOR_CRSR_RCBE_B=
IT | XOR_CRSR_64BA_BIT,
12458ea06efd7b Anatolij Gustschin 2009-12-11 @1157  				    &xor_reg->crsr);
12458ea06efd7b Anatolij Gustschin 2009-12-11  1158  		} else {
12458ea06efd7b Anatolij Gustschin 2009-12-11  1159  			/* XORcore is runnin=
g. Refetch later in the handler */
12458ea06efd7b Anatolij Gustschin 2009-12-11  1160  			do_xor_refetch =3D 1;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1161  		}
12458ea06efd7b Anatolij Gustschin 2009-12-11  1162  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  1163  		break;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1164  	}
12458ea06efd7b Anatolij Gustschin 2009-12-11  1165  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  1166  	local_irq_restore(flag=
s);
12458ea06efd7b Anatolij Gustschin 2009-12-11  1167  }
12458ea06efd7b Anatolij Gustschin 2009-12-11  1168  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  1169  /**
12458ea06efd7b Anatolij Gustschin 2009-12-11  1170   * ppc440spe_chan_get_c=
urrent_descriptor - get the currently executed descriptor
12458ea06efd7b Anatolij Gustschin 2009-12-11  1171   */
12458ea06efd7b Anatolij Gustschin 2009-12-11  1172  static u32
12458ea06efd7b Anatolij Gustschin 2009-12-11  1173  ppc440spe_chan_get_curr=
ent_descriptor(struct ppc440spe_adma_chan *chan)
12458ea06efd7b Anatolij Gustschin 2009-12-11  1174  {
12458ea06efd7b Anatolij Gustschin 2009-12-11  1175  	struct dma_regs *dma_r=
eg;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1176  	struct xor_regs *xor_r=
eg;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1177  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  1178  	if (unlikely(!chan->hw=
_chain_inited))
12458ea06efd7b Anatolij Gustschin 2009-12-11  1179  		/* h/w descriptor cha=
in is not initialized yet */
12458ea06efd7b Anatolij Gustschin 2009-12-11  1180  		return 0;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1181  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  1182  	switch (chan->device->=
id) {
12458ea06efd7b Anatolij Gustschin 2009-12-11  1183  	case PPC440SPE_DMA0_ID:
12458ea06efd7b Anatolij Gustschin 2009-12-11  1184  	case PPC440SPE_DMA1_ID:
12458ea06efd7b Anatolij Gustschin 2009-12-11 @1185  		dma_reg =3D chan->dev=
ice->dma_reg;
12458ea06efd7b Anatolij Gustschin 2009-12-11 @1186  		return ioread32(&dma_=
reg->acpl) & (~DMA_CDB_MSK);
12458ea06efd7b Anatolij Gustschin 2009-12-11  1187  	case PPC440SPE_XOR_ID:
12458ea06efd7b Anatolij Gustschin 2009-12-11 @1188  		xor_reg =3D chan->dev=
ice->xor_reg;
12458ea06efd7b Anatolij Gustschin 2009-12-11 @1189  		return ioread32be(&xo=
r_reg->ccbalr);
12458ea06efd7b Anatolij Gustschin 2009-12-11  1190  	}
12458ea06efd7b Anatolij Gustschin 2009-12-11  1191  	return 0;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1192  }
12458ea06efd7b Anatolij Gustschin 2009-12-11  1193  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  1194  /**
12458ea06efd7b Anatolij Gustschin 2009-12-11  1195   * ppc440spe_chan_run -=
 enable the channel
12458ea06efd7b Anatolij Gustschin 2009-12-11  1196   */
12458ea06efd7b Anatolij Gustschin 2009-12-11  1197  static void ppc440spe_c=
han_run(struct ppc440spe_adma_chan *chan)
12458ea06efd7b Anatolij Gustschin 2009-12-11  1198  {
12458ea06efd7b Anatolij Gustschin 2009-12-11  1199  	struct xor_regs *xor_r=
eg;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1200  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  1201  	switch (chan->device->=
id) {
12458ea06efd7b Anatolij Gustschin 2009-12-11  1202  	case PPC440SPE_DMA0_ID:
12458ea06efd7b Anatolij Gustschin 2009-12-11  1203  	case PPC440SPE_DMA1_ID:
12458ea06efd7b Anatolij Gustschin 2009-12-11  1204  		/* DMAs are always en=
abled, do nothing */
12458ea06efd7b Anatolij Gustschin 2009-12-11  1205  		break;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1206  	case PPC440SPE_XOR_ID:
12458ea06efd7b Anatolij Gustschin 2009-12-11  1207  		/* drain write buffer=
 */
12458ea06efd7b Anatolij Gustschin 2009-12-11  1208  		xor_reg =3D chan->dev=
ice->xor_reg;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1209  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  1210  		/* fetch descriptor p=
ointed to in <link> */
12458ea06efd7b Anatolij Gustschin 2009-12-11  1211  		iowrite32be(XOR_CRSR_=
64BA_BIT | XOR_CRSR_XAE_BIT,
12458ea06efd7b Anatolij Gustschin 2009-12-11  1212  			    &xor_reg->crsr);
12458ea06efd7b Anatolij Gustschin 2009-12-11  1213  		break;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1214  	}
12458ea06efd7b Anatolij Gustschin 2009-12-11  1215  }
12458ea06efd7b Anatolij Gustschin 2009-12-11  1216  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  1217  /**********************=
********************************************************
12458ea06efd7b Anatolij Gustschin 2009-12-11  1218   * ADMA device level
12458ea06efd7b Anatolij Gustschin 2009-12-11  1219   **********************=
********************************************************/
12458ea06efd7b Anatolij Gustschin 2009-12-11  1220  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  1221  static void ppc440spe_c=
han_start_null_xor(struct ppc440spe_adma_chan *chan);
12458ea06efd7b Anatolij Gustschin 2009-12-11  1222  static int ppc440spe_ad=
ma_alloc_chan_resources(struct dma_chan *chan);
12458ea06efd7b Anatolij Gustschin 2009-12-11  1223  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  1224  static dma_cookie_t
12458ea06efd7b Anatolij Gustschin 2009-12-11  1225  ppc440spe_adma_tx_submi=
t(struct dma_async_tx_descriptor *tx);
12458ea06efd7b Anatolij Gustschin 2009-12-11  1226  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  1227  static void ppc440spe_a=
dma_set_dest(struct ppc440spe_adma_desc_slot *tx,
12458ea06efd7b Anatolij Gustschin 2009-12-11  1228  				    dma_addr_t addr=
, int index);
12458ea06efd7b Anatolij Gustschin 2009-12-11  1229  static void
12458ea06efd7b Anatolij Gustschin 2009-12-11  1230  ppc440spe_adma_memcpy_x=
or_set_src(struct ppc440spe_adma_desc_slot *tx,
12458ea06efd7b Anatolij Gustschin 2009-12-11  1231  				  dma_addr_t addr, =
int index);
12458ea06efd7b Anatolij Gustschin 2009-12-11  1232  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  1233  static void
12458ea06efd7b Anatolij Gustschin 2009-12-11  1234  ppc440spe_adma_pq_set_d=
est(struct ppc440spe_adma_desc_slot *tx,
12458ea06efd7b Anatolij Gustschin 2009-12-11  1235  			   dma_addr_t *paddr=
, unsigned long flags);
12458ea06efd7b Anatolij Gustschin 2009-12-11  1236  static void
12458ea06efd7b Anatolij Gustschin 2009-12-11  1237  ppc440spe_adma_pq_set_s=
rc(struct ppc440spe_adma_desc_slot *tx,
12458ea06efd7b Anatolij Gustschin 2009-12-11  1238  			  dma_addr_t addr, i=
nt index);
12458ea06efd7b Anatolij Gustschin 2009-12-11  1239  static void
12458ea06efd7b Anatolij Gustschin 2009-12-11  1240  ppc440spe_adma_pq_set_s=
rc_mult(struct ppc440spe_adma_desc_slot *tx,
12458ea06efd7b Anatolij Gustschin 2009-12-11  1241  			       unsigned char=
 mult, int index, int dst_pos);
12458ea06efd7b Anatolij Gustschin 2009-12-11  1242  static void
12458ea06efd7b Anatolij Gustschin 2009-12-11  1243  ppc440spe_adma_pqzero_s=
um_set_dest(struct ppc440spe_adma_desc_slot *tx,
12458ea06efd7b Anatolij Gustschin 2009-12-11  1244  				   dma_addr_t paddr=
, dma_addr_t qaddr);
12458ea06efd7b Anatolij Gustschin 2009-12-11  1245  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  1246  static struct page *ppc=
440spe_rxor_srcs[32];
12458ea06efd7b Anatolij Gustschin 2009-12-11  1247  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  1248  /**
12458ea06efd7b Anatolij Gustschin 2009-12-11  1249   * ppc440spe_can_rxor -=
 check if the operands may be processed with RXOR
12458ea06efd7b Anatolij Gustschin 2009-12-11  1250   */
12458ea06efd7b Anatolij Gustschin 2009-12-11  1251  static int ppc440spe_ca=
n_rxor(struct page **srcs, int src_cnt, size_t len)
12458ea06efd7b Anatolij Gustschin 2009-12-11  1252  {
12458ea06efd7b Anatolij Gustschin 2009-12-11  1253  	int i, order =3D 0, st=
ate =3D 0;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1254  	int idx =3D 0;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1255  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  1256  	if (unlikely(!(src_cnt=
 > 1)))
12458ea06efd7b Anatolij Gustschin 2009-12-11  1257  		return 0;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1258  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  1259  	BUG_ON(src_cnt > ARRAY=
_SIZE(ppc440spe_rxor_srcs));
12458ea06efd7b Anatolij Gustschin 2009-12-11  1260  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  1261  	/* Skip holes in the s=
ource list before checking */
12458ea06efd7b Anatolij Gustschin 2009-12-11  1262  	for (i =3D 0; i < src_=
cnt; i++) {
12458ea06efd7b Anatolij Gustschin 2009-12-11  1263  		if (!srcs[i])
12458ea06efd7b Anatolij Gustschin 2009-12-11  1264  			continue;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1265  		ppc440spe_rxor_srcs[i=
dx++] =3D srcs[i];
12458ea06efd7b Anatolij Gustschin 2009-12-11  1266  	}
12458ea06efd7b Anatolij Gustschin 2009-12-11  1267  	src_cnt =3D idx;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1268  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  1269  	for (i =3D 1; i < src_=
cnt; i++) {
12458ea06efd7b Anatolij Gustschin 2009-12-11  1270  		char *cur_addr =3D pa=
ge_address(ppc440spe_rxor_srcs[i]);
12458ea06efd7b Anatolij Gustschin 2009-12-11  1271  		char *old_addr =3D pa=
ge_address(ppc440spe_rxor_srcs[i - 1]);
12458ea06efd7b Anatolij Gustschin 2009-12-11  1272  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  1273  		switch (state) {
12458ea06efd7b Anatolij Gustschin 2009-12-11  1274  		case 0:
12458ea06efd7b Anatolij Gustschin 2009-12-11  1275  			if (cur_addr =3D=3D =
old_addr + len) {
12458ea06efd7b Anatolij Gustschin 2009-12-11  1276  				/* direct RXOR */
12458ea06efd7b Anatolij Gustschin 2009-12-11  1277  				order =3D 1;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1278  				state =3D 1;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1279  			} else if (old_addr =
=3D=3D cur_addr + len) {
12458ea06efd7b Anatolij Gustschin 2009-12-11  1280  				/* reverse RXOR */
12458ea06efd7b Anatolij Gustschin 2009-12-11  1281  				order =3D -1;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1282  				state =3D 1;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1283  			} else
12458ea06efd7b Anatolij Gustschin 2009-12-11  1284  				goto out;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1285  			break;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1286  		case 1:
12458ea06efd7b Anatolij Gustschin 2009-12-11  1287  			if ((i =3D=3D src_cn=
t - 2) ||
12458ea06efd7b Anatolij Gustschin 2009-12-11  1288  			    (order =3D=3D -1=
 && cur_addr !=3D old_addr - len)) {
12458ea06efd7b Anatolij Gustschin 2009-12-11  1289  				order =3D 0;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1290  				state =3D 0;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1291  			} else if ((cur_addr=
 =3D=3D old_addr + len * order) ||
12458ea06efd7b Anatolij Gustschin 2009-12-11  1292  				   (cur_addr =3D=3D=
 old_addr + 2 * len) ||
12458ea06efd7b Anatolij Gustschin 2009-12-11  1293  				   (cur_addr =3D=3D=
 old_addr + 3 * len)) {
12458ea06efd7b Anatolij Gustschin 2009-12-11  1294  				state =3D 2;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1295  			} else {
12458ea06efd7b Anatolij Gustschin 2009-12-11  1296  				order =3D 0;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1297  				state =3D 0;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1298  			}
12458ea06efd7b Anatolij Gustschin 2009-12-11  1299  			break;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1300  		case 2:
12458ea06efd7b Anatolij Gustschin 2009-12-11  1301  			order =3D 0;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1302  			state =3D 0;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1303  			break;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1304  		}
12458ea06efd7b Anatolij Gustschin 2009-12-11  1305  	}
12458ea06efd7b Anatolij Gustschin 2009-12-11  1306  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  1307  out:
12458ea06efd7b Anatolij Gustschin 2009-12-11  1308  	if (state =3D=3D 1 || =
state =3D=3D 2)
12458ea06efd7b Anatolij Gustschin 2009-12-11  1309  		return 1;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1310  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  1311  	return 0;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1312  }
12458ea06efd7b Anatolij Gustschin 2009-12-11  1313  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  1314  /**
12458ea06efd7b Anatolij Gustschin 2009-12-11  1315   * ppc440spe_adma_devic=
e_estimate - estimate the efficiency of processing
12458ea06efd7b Anatolij Gustschin 2009-12-11  1316   *	the operation given =
on this channel. It's assumed that 'chan' is
12458ea06efd7b Anatolij Gustschin 2009-12-11  1317   *	capable to process '=
cap' type of operation.
12458ea06efd7b Anatolij Gustschin 2009-12-11  1318   * @chan: channel to use
12458ea06efd7b Anatolij Gustschin 2009-12-11  1319   * @cap: type of transa=
ction
12458ea06efd7b Anatolij Gustschin 2009-12-11  1320   * @dst_lst: array of d=
estination pointers
12458ea06efd7b Anatolij Gustschin 2009-12-11  1321   * @dst_cnt: number of =
destination operands
12458ea06efd7b Anatolij Gustschin 2009-12-11  1322   * @src_lst: array of s=
ource pointers
12458ea06efd7b Anatolij Gustschin 2009-12-11  1323   * @src_cnt: number of =
source operands
12458ea06efd7b Anatolij Gustschin 2009-12-11  1324   * @src_sz: size of eac=
h source operand
12458ea06efd7b Anatolij Gustschin 2009-12-11  1325   */
12458ea06efd7b Anatolij Gustschin 2009-12-11  1326  static int ppc440spe_ad=
ma_estimate(struct dma_chan *chan,
12458ea06efd7b Anatolij Gustschin 2009-12-11  1327  	enum dma_transaction_t=
ype cap, struct page **dst_lst, int dst_cnt,
12458ea06efd7b Anatolij Gustschin 2009-12-11  1328  	struct page **src_lst,=
 int src_cnt, size_t src_sz)
12458ea06efd7b Anatolij Gustschin 2009-12-11 @1329  {
12458ea06efd7b Anatolij Gustschin 2009-12-11  1330  	int ef =3D 1;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1331  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  1332  	if (cap =3D=3D DMA_PQ =
|| cap =3D=3D DMA_PQ_VAL) {
12458ea06efd7b Anatolij Gustschin 2009-12-11  1333  		/* If RAID-6 capabili=
ties were not activated don't try
12458ea06efd7b Anatolij Gustschin 2009-12-11  1334  		 * to use them
12458ea06efd7b Anatolij Gustschin 2009-12-11  1335  		 */
12458ea06efd7b Anatolij Gustschin 2009-12-11  1336  		if (unlikely(!ppc440s=
pe_r6_enabled))
12458ea06efd7b Anatolij Gustschin 2009-12-11  1337  			return -1;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1338  	}
12458ea06efd7b Anatolij Gustschin 2009-12-11  1339  	/*  In the current imp=
lementation of ppc440spe ADMA driver it
12458ea06efd7b Anatolij Gustschin 2009-12-11  1340  	 * makes sense to pick=
 out only pq case, because it may be
12458ea06efd7b Anatolij Gustschin 2009-12-11  1341  	 * processed:
12458ea06efd7b Anatolij Gustschin 2009-12-11  1342  	 * (1) either using Bi=
skup method on DMA2;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1343  	 * (2) or on DMA0/1.
12458ea06efd7b Anatolij Gustschin 2009-12-11  1344  	 *  Thus we give a fav=
our to (1) if the sources are suitable;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1345  	 * else let it be proc=
essed on one of the DMA0/1 engines.
12458ea06efd7b Anatolij Gustschin 2009-12-11  1346  	 *  In the sum_product=
 case where destination is also the
12458ea06efd7b Anatolij Gustschin 2009-12-11  1347  	 * source process it o=
n DMA0/1 only.
12458ea06efd7b Anatolij Gustschin 2009-12-11  1348  	 */
12458ea06efd7b Anatolij Gustschin 2009-12-11  1349  	if (cap =3D=3D DMA_PQ =
&& chan->chan_id =3D=3D PPC440SPE_XOR_ID) {
12458ea06efd7b Anatolij Gustschin 2009-12-11  1350  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  1351  		if (dst_cnt =3D=3D 1 =
&& src_cnt =3D=3D 2 && dst_lst[0] =3D=3D src_lst[1])
12458ea06efd7b Anatolij Gustschin 2009-12-11  1352  			ef =3D 0; /* sum_pro=
duct case, process on DMA0/1 */
12458ea06efd7b Anatolij Gustschin 2009-12-11  1353  		else if (ppc440spe_ca=
n_rxor(src_lst, src_cnt, src_sz))
12458ea06efd7b Anatolij Gustschin 2009-12-11  1354  			ef =3D 3; /* overrid=
e (DMA0/1 + idle) */
12458ea06efd7b Anatolij Gustschin 2009-12-11  1355  		else
12458ea06efd7b Anatolij Gustschin 2009-12-11  1356  			ef =3D 0; /* can't p=
rocess on DMA2 if !rxor */
12458ea06efd7b Anatolij Gustschin 2009-12-11  1357  	}
12458ea06efd7b Anatolij Gustschin 2009-12-11  1358  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  1359  	/* channel idleness in=
creases the priority */
12458ea06efd7b Anatolij Gustschin 2009-12-11  1360  	if (likely(ef) &&
12458ea06efd7b Anatolij Gustschin 2009-12-11  1361  	    !ppc440spe_chan_is=
_busy(to_ppc440spe_adma_chan(chan)))
12458ea06efd7b Anatolij Gustschin 2009-12-11  1362  		ef++;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1363  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  1364  	return ef;
12458ea06efd7b Anatolij Gustschin 2009-12-11  1365  }
12458ea06efd7b Anatolij Gustschin 2009-12-11  1366  =


:::::: The code at line 1329 was first introduced by commit
:::::: 12458ea06efd7b44281e68fe59c950ec7d59c649 ppc440spe-adma: adds update=
d ppc440spe adma driver

:::::: TO: Anatolij Gustschin <agust@denx.de>
:::::: CC: Dan Williams <dan.j.williams@intel.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2112575391764843708==--


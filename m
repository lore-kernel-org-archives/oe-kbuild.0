Content-Type: multipart/mixed; boundary="===============7189444877492395472=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 12817/13276] drivers/dma/ppc4xx/adma.c:1329: warning: expecting prototype for ppc440spe_adma_device_estimate(). Prototype was for ppc440spe_adma_estimate() instead
Date: Thu, 28 Jul 2022 02:19:45 +0800
Message-ID: <202207280211.z8drxfwi-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7189444877492395472==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 drivers/dma/ppc4xx/adma.c:1329: warning: expecting prototype for ppc440spe=
_adma_device_estimate(). Prototype was for ppc440spe_adma_estimate() instea=
d"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Christophe Leroy <christophe.leroy@csgroup.eu>
CC: Michael Ellerman <mpe@ellerman.id.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   9250d2f72dc46a808b6aa23bf50dd670f1f52ddc
commit: 0d913358a816b35fa5b75385e80f63b9abcf1b27 [12817/13276] powerpc/44x:=
 Fix build failure with GCC 12 (unrecognized opcode: `wrteei')
:::::: branch date: 6 hours ago
:::::: commit date: 29 hours ago
config: powerpc-randconfig-c024-20220727 (https://download.01.org/0day-ci/a=
rchive/20220728/202207280211.z8drxfwi-lkp(a)intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D0d913358a816b35fa5b75385e80f63b9abcf1b27
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 0d913358a816b35fa5b75385e80f63b9abcf1b27
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 W=3D1 O=3Dbuild_dir ARCH=3Dpowerpc SHELL=3D/bin/bash drivers/dma/ppc4xx/

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


vim +1329 drivers/dma/ppc4xx/adma.c

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
--===============7189444877492395472==--


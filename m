Content-Type: multipart/mixed; boundary="===============1340584591932415220=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/crypto/cavium/cpt/cptpf_mbox.c:31 cpt_clear_mbox_intr() warn: should '1 << vf' be a 64 bit type?
Date: Fri, 10 Dec 2021 19:35:25 +0800
Message-ID: <202112101952.jPjiXQMK-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1340584591932415220==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Guenter Roeck <linux@roeck-us.net>
CC: Palmer Dabbelt <palmerdabbelt@google.com>

Hi Guenter,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c741e49150dbb0c0aebe234389f4aa8b47958fa8
commit: a18b14d8886614b3c7d290c4cfc33389822b0535 riscv: Disable STACKPROTEC=
TOR_PER_TASK if GCC_PLUGIN_RANDSTRUCT is enabled
date:   4 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 4 months ago
config: riscv-randconfig-m031-20211210 (https://download.01.org/0day-ci/arc=
hive/20211210/202112101952.jPjiXQMK-lkp(a)intel.com/config)
compiler: riscv64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/crypto/cavium/cpt/cptpf_mbox.c:31 cpt_clear_mbox_intr() warn: shoul=
d '1 << vf' be a 64 bit type?
sound/soc/stm/stm32_sai_sub.c:503 stm32_sai_isr() error: uninitialized symb=
ol 'sr'.
sound/soc/stm/stm32_sai_sub.c:503 stm32_sai_isr() error: uninitialized symb=
ol 'imr'.
sound/soc/stm/stm32_sai_sub.c:790 stm32_sai_startup() error: uninitialized =
symbol 'cr2'.
sound/soc/stm/stm32_sai_sub.c:869 stm32_sai_set_slots() error: uninitialize=
d symbol 'slotr'.
sound/soc/rockchip/rockchip_i2s.c:690 rockchip_i2s_probe() warn: 'i2s->hclk=
' not released on lines: 618,623,630.
arch/riscv/kernel/signal.c:42 restore_fp_state() warn: maybe return -EFAULT=
 instead of the bytes remaining?
arch/riscv/kernel/signal.c:70 save_fp_state() warn: maybe return -EFAULT in=
stead of the bytes remaining?
drivers/video/fbdev/riva/riva_hw.c:1823 SetStartAddress3() warn: inconsiste=
nt indenting
arch/riscv/include/asm/atomic.h:204 arch_atomic_fetch_add_unless() warn: in=
consistent indenting
sound/soc/qcom/qdsp6/q6afe.c:1001 q6afe_set_param() warn: is 'p' large enou=
gh for 'struct apr_pkt'? 0
drivers/crypto/marvell/octeontx/otx_cptpf_ucode.c:1295 create_engine_group(=
) error: we previously assumed 'mirrored_eng_grp' could be null (see line 1=
251)
drivers/crypto/marvell/octeontx/otx_cptpf_ucode.c:1348 ucode_load_store() w=
arn: variable dereferenced before check 'val' (see line 1341)
drivers/net/usb/hso.c:1399 hso_serial_set_termios() error: we previously as=
sumed 'old' could be null (see line 1389)
drivers/net/wireless/ath/wcn36xx/main.c:574 wcn36xx_set_key() error: we pre=
viously assumed 'sta' could be null (see line 516)
drivers/net/wireless/ath/wcn36xx/smd.c:515 wcn36xx_smd_load_nv() error: we =
previously assumed 'wcn->nv' could be null (see line 506)
drivers/net/wireless/ath/wcn36xx/smd.c:1898 wcn36xx_smd_send_beacon() warn:=
 potential spectre issue 'msg_body.beacon' [w]
drivers/net/wireless/ath/wcn36xx/smd.c:2910 wcn36xx_smd_gtk_offload_get_inf=
o_rsp() warn: inconsistent indenting
arch/riscv/kernel/perf_event.c:160 riscv_map_cache_event() warn: inconsiste=
nt indenting
lib/test_kasan.c:174 kmalloc_pagealloc_oob_right() error: buffer overflow '=
ptr' 8202 <=3D 8202
drivers/net/wireless/ath/ath10k/ahb.c:92 ath10k_ahb_clock_init() warn: pass=
ing zero to 'PTR_ERR'
arch/riscv/include/asm/atomic.h:204 arch_atomic_fetch_add_unless() warn: in=
consistent indenting
arch/riscv/include/asm/atomic.h:225 arch_atomic64_fetch_add_unless() warn: =
inconsistent indenting
arch/riscv/include/asm/atomic.h:225 arch_atomic64_fetch_add_unless() warn: =
inconsistent indenting
arch/riscv/include/asm/atomic.h:225 arch_atomic64_fetch_add_unless() warn: =
inconsistent indenting
arch/riscv/include/asm/atomic.h:204 arch_atomic_fetch_add_unless() warn: in=
consistent indenting
arch/riscv/include/asm/atomic.h:204 arch_atomic_fetch_add_unless() warn: in=
consistent indenting
arch/riscv/include/asm/atomic.h:225 arch_atomic64_fetch_add_unless() warn: =
inconsistent indenting
arch/riscv/include/asm/atomic.h:204 arch_atomic_fetch_add_unless() warn: in=
consistent indenting
arch/riscv/include/asm/atomic.h:317 arch_atomic_sub_if_positive() warn: inc=
onsistent indenting

Old smatch warnings:
sound/soc/stm/stm32_sai_sub.c:1503 stm32_sai_sub_parse_of() warn: 'sai->pda=
ta->pclk' not released on lines: 1498.
arch/riscv/kernel/signal.c:95 restore_sigcontext() warn: maybe return -EFAU=
LT instead of the bytes remaining?
arch/riscv/kernel/signal.c:148 setup_sigcontext() warn: maybe return -EFAUL=
T instead of the bytes remaining?
drivers/video/fbdev/riva/riva_hw.c:979 nv10CalcArbitration() warn: inconsis=
tent indenting
drivers/video/fbdev/riva/riva_hw.c:1825 SetStartAddress3() warn: inconsiste=
nt indenting
sound/soc/qcom/qdsp6/q6afe.c:1055 q6afe_port_set_param_v2() warn: is 'p' la=
rge enough for 'struct apr_pkt'? 0
drivers/crypto/marvell/octeontx/otx_cptpf_ucode.c:1363 ucode_load_store() w=
arn: variable dereferenced before check 'val' (see line 1341)
drivers/crypto/marvell/octeontx/otx_cptpf_ucode.c:1375 ucode_load_store() w=
arn: variable dereferenced before check 'val' (see line 1341)
lib/test_kasan.c:130 kmalloc_oob_right() error: buffer overflow 'ptr' 123 <=
=3D 123
lib/test_kasan.c:154 kmalloc_node_oob_right() error: buffer overflow 'ptr' =
4096 <=3D 4096
lib/test_kasan.c:281 krealloc_more_oob_helper() warn: potentially one past =
the end of array 'ptr2[size2]'
lib/test_kasan.c:281 krealloc_more_oob_helper() warn: potentially one past =
the end of array 'ptr2[size2]'
lib/test_kasan.c:310 krealloc_less_oob_helper() warn: potentially one past =
the end of array 'ptr2[size2]'
lib/test_kasan.c:310 krealloc_less_oob_helper() warn: potentially one past =
the end of array 'ptr2[size2]'
lib/test_kasan.c:324 krealloc_less_oob_helper() warn: potentially one past =
the end of array 'ptr2[middle]'
lib/test_kasan.c:324 krealloc_less_oob_helper() warn: potentially one past =
the end of array 'ptr2[middle]'
lib/test_kasan.c:373 krealloc_uaf() warn: passing freed memory 'ptr1'
lib/test_kasan.c:411 kmalloc_uaf_16() error: dereferencing freed memory 'pt=
r2'
lib/test_kasan.c:513 kmalloc_uaf_memset() warn: passing freed memory 'ptr'
lib/test_kasan.c:665 kasan_global_oob() error: buffer overflow 'array' 10 <=
=3D 13
lib/test_kasan.c:684 ksize_unpoisons_memory() error: buffer overflow 'ptr' =
123 <=3D 123
lib/test_kasan.c:705 ksize_uaf() warn: passing freed memory 'ptr'
lib/test_kasan.c:769 kmem_cache_double_free() error: double free of 'p'
lib/test_kasan.c:844 kasan_memcmp() error: memcmp() 'ptr' too small (24 vs =
25)
drivers/net/wireless/ath/ath10k/ahb.c:99 ath10k_ahb_clock_init() warn: pass=
ing zero to 'PTR_ERR'
drivers/net/wireless/ath/ath10k/ahb.c:106 ath10k_ahb_clock_init() warn: pas=
sing zero to 'PTR_ERR'

vim +31 drivers/crypto/cavium/cpt/cptpf_mbox.c

9e2c7d99941d000 George Cherian 2017-02-07  27  =

9e2c7d99941d000 George Cherian 2017-02-07  28  static void cpt_clear_mbox_i=
ntr(struct cpt_device *cpt, u32 vf)
9e2c7d99941d000 George Cherian 2017-02-07  29  {
9e2c7d99941d000 George Cherian 2017-02-07  30  	/* W1C for the VF */
9e2c7d99941d000 George Cherian 2017-02-07 @31  	cpt_write_csr64(cpt->reg_ba=
se, CPTX_PF_MBOX_INTX(0, 0), (1 << vf));
9e2c7d99941d000 George Cherian 2017-02-07  32  }
9e2c7d99941d000 George Cherian 2017-02-07  33  =


:::::: The code@line 31 was first introduced by commit
:::::: 9e2c7d99941d000a36f68a3594cec27a1bbea274 crypto: cavium - Add Suppor=
t for Octeon-tx CPT Engine

:::::: TO: George Cherian <george.cherian@cavium.com>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1340584591932415220==--


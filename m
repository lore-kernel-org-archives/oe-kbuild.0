Content-Type: multipart/mixed; boundary="===============7936176597902869073=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/arm/mach-ep93xx/clock.c:154:2: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
Date: Thu, 25 Nov 2021 06:42:03 +0800
Message-ID: <202111250609.T19mqnCJ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7936176597902869073==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Nikita Shubin <nikita.shubin@maquefel.me>
CC: Arnd Bergmann <arnd@arndb.de>
CC: Alexander Sverdlin <alexander.sverdlin@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   5f53fa508db098c9d372423a6dac31c8a5679cdf
commit: 9645ccc7bd7a16cd73c3be9dee70cd702b03be37 ep93xx: clock: convert in-=
place to COMMON_CLK
date:   5 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 5 weeks ago
config: arm-randconfig-c002-20211123 (https://download.01.org/0day-ci/archi=
ve/20211125/202111250609.T19mqnCJ-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 49e383=
8145dff1ec91c2e67a2cb562775c8d2a08)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D9645ccc7bd7a16cd73c3be9dee70cd702b03be37
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 9645ccc7bd7a16cd73c3be9dee70cd702b03be37
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   7 warnings generated.
>> arch/arm/mach-ep93xx/clock.c:154:2: warning: Use of memory after it is f=
reed [clang-analyzer-unix.Malloc]
           return &psc->hw;
           ^
   arch/arm/mach-ep93xx/clock.c:553:6: note: Assuming the condition is true
           if (!(value & EP93XX_SYSCON_CLKSET1_NBYP1))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/mach-ep93xx/clock.c:553:2: note: Taking true branch
           if (!(value & EP93XX_SYSCON_CLKSET1_NBYP1))
           ^
   arch/arm/mach-ep93xx/clock.c:579:6: note: Assuming the condition is true
           if (!(value & EP93XX_SYSCON_CLKSET2_NBYP2))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/mach-ep93xx/clock.c:579:2: note: Taking true branch
           if (!(value & EP93XX_SYSCON_CLKSET2_NBYP2))
           ^
   arch/arm/mach-ep93xx/clock.c:627:6: note: Assuming the condition is false
           if (ep93xx_chip_revision() < EP93XX_CHIP_REV_E2)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/mach-ep93xx/clock.c:627:2: note: Taking false branch
           if (ep93xx_chip_revision() < EP93XX_CHIP_REV_E2)
           ^
   arch/arm/mach-ep93xx/clock.c:636:2: note: Loop condition is false.  Exit=
ing loop
           pr_info("PLL1 running at %ld MHz, PLL2@%ld MHz\n",
           ^
   include/linux/printk.h:519:2: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   arch/arm/mach-ep93xx/clock.c:638:2: note: Loop condition is false.  Exit=
ing loop
           pr_info("FCLK %ld MHz, HCLK %ld MHz, PCLK %ld MHz\n",
           ^
   include/linux/printk.h:519:2: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   arch/arm/mach-ep93xx/clock.c:642:2: note: Calling 'ep93xx_uart_clock_ini=
t'
           ep93xx_uart_clock_init();
           ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/mach-ep93xx/clock.c:479:6: note: Assuming the condition is false
           if (value & EP93XX_SYSCON_PWRCNT_UARTBAUD)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/mach-ep93xx/clock.c:479:2: note: Taking false branch
           if (value & EP93XX_SYSCON_PWRCNT_UARTBAUD)
           ^
   arch/arm/mach-ep93xx/clock.c:487:2: note: Loop condition is true.  Enter=
ing loop body
           for (i =3D 0; i < ARRAY_SIZE(ep93xx_uarts); i++) {
           ^
   arch/arm/mach-ep93xx/clock.c:488:8: note: Calling 'ep93xx_clk_register_g=
ate'
                   hw =3D ep93xx_clk_register_gate(ep93xx_uarts[i].dev_id,
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/mach-ep93xx/clock.c:136:6: note: Assuming 'psc' is non-null
           if (!psc)
               ^~~~
   arch/arm/mach-ep93xx/clock.c:136:2: note: Taking false branch
           if (!psc)
           ^
   arch/arm/mach-ep93xx/clock.c:142:23: note: 'parent_name' is non-null
           init.parent_names =3D (parent_name ? &parent_name : NULL);
                                ^~~~~~~~~~~
   arch/arm/mach-ep93xx/clock.c:142:23: note: '?' condition is true
   arch/arm/mach-ep93xx/clock.c:143:22: note: 'parent_name' is non-null
           init.num_parents =3D (parent_name ? 1 : 0);
                               ^~~~~~~~~~~
   arch/arm/mach-ep93xx/clock.c:143:22: note: '?' condition is true
   arch/arm/mach-ep93xx/clock.c:151:2: note: Taking true branch
           if (IS_ERR(clk))
           ^
   arch/arm/mach-ep93xx/clock.c:152:3: note: Memory is released
                   kfree(psc);
                   ^~~~~~~~~~
   arch/arm/mach-ep93xx/clock.c:154:2: note: Use of memory after it is freed
           return &psc->hw;
           ^      ~~~~~~~~
   arch/arm/mach-ep93xx/clock.c:349:2: warning: Use of memory after it is f=
reed [clang-analyzer-unix.Malloc]
           return &psc->hw;
           ^
   arch/arm/mach-ep93xx/clock.c:553:6: note: Assuming the condition is true
           if (!(value & EP93XX_SYSCON_CLKSET1_NBYP1))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/mach-ep93xx/clock.c:553:2: note: Taking true branch
           if (!(value & EP93XX_SYSCON_CLKSET1_NBYP1))
           ^
   arch/arm/mach-ep93xx/clock.c:579:6: note: Assuming the condition is true
           if (!(value & EP93XX_SYSCON_CLKSET2_NBYP2))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   arch/arm/mach-ep93xx/clock.c:686:7: note: Calling 'clk_hw_register_ddiv'
           hw =3D clk_hw_register_ddiv("ep93xx-fb",
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/mach-ep93xx/clock.c:331:6: note: Assuming 'psc' is non-null
           if (!psc)
               ^~~~
   arch/arm/mach-ep93xx/clock.c:331:2: note: Taking false branch
           if (!psc)
           ^
   arch/arm/mach-ep93xx/clock.c:346:2: note: Taking true branch
           if (IS_ERR(clk))
           ^
   arch/arm/mach-ep93xx/clock.c:347:3: note: Memory is released
                   kfree(psc);
                   ^~~~~~~~~~
   arch/arm/mach-ep93xx/clock.c:349:2: note: Use of memory after it is freed
           return &psc->hw;
           ^      ~~~~~~~~
   arch/arm/mach-ep93xx/clock.c:456:2: warning: Use of memory after it is f=
reed [clang-analyzer-unix.Malloc]
           return &psc->hw;
           ^
   arch/arm/mach-ep93xx/clock.c:553:6: note: Assuming the condition is true
           if (!(value & EP93XX_SYSCON_CLKSET1_NBYP1))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/mach-ep93xx/clock.c:553:2: note: Taking true branch
           if (!(value & EP93XX_SYSCON_CLKSET1_NBYP1))
           ^
   arch/arm/mach-ep93xx/clock.c:579:6: note: Assuming the condition is true
           if (!(value & EP93XX_SYSCON_CLKSET2_NBYP2))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/mach-ep93xx/clock.c:579:2: note: Taking true branch
           if (!(value & EP93XX_SYSCON_CLKSET2_NBYP2))
           ^
   arch/arm/mach-ep93xx/clock.c:627:6: note: Assuming the condition is false
           if (ep93xx_chip_revision() < EP93XX_CHIP_REV_E2)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/mach-ep93xx/clock.c:627:2: note: Taking false branch
           if (ep93xx_chip_revision() < EP93XX_CHIP_REV_E2)
           ^
   arch/arm/mach-ep93xx/clock.c:636:2: note: Loop condition is false.  Exit=
ing loop
           pr_info("PLL1 running at %ld MHz, PLL2@%ld MHz\n",
           ^
   include/linux/printk.h:519:2: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   arch/arm/mach-ep93xx/clock.c:638:2: note: Loop condition is false.  Exit=
ing loop
           pr_info("FCLK %ld MHz, HCLK %ld MHz, PCLK %ld MHz\n",
           ^
   include/linux/printk.h:519:2: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   arch/arm/mach-ep93xx/clock.c:645:7: note: Calling 'clk_hw_register_div'
           hw =3D clk_hw_register_div("ep93xx-adc",
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/mach-ep93xx/clock.c:434:6: note: Assuming 'psc' is non-null
           if (!psc)
               ^~~~
   arch/arm/mach-ep93xx/clock.c:434:2: note: Taking false branch
           if (!psc)
           ^
   arch/arm/mach-ep93xx/clock.c:440:23: note: 'parent_name' is non-null
           init.parent_names =3D (parent_name ? &parent_name : NULL);
                                ^~~~~~~~~~~
   arch/arm/mach-ep93xx/clock.c:440:23: note: '?' condition is true
   arch/arm/mach-ep93xx/clock.c:453:2: note: Taking true branch
           if (IS_ERR(clk))
           ^
   arch/arm/mach-ep93xx/clock.c:454:3: note: Memory is released
                   kfree(psc);
                   ^~~~~~~~~~
   arch/arm/mach-ep93xx/clock.c:456:2: note: Use of memory after it is freed
           return &psc->hw;
           ^      ~~~~~~~~
>> arch/arm/mach-ep93xx/clock.c:484:2: warning: Value stored to 'hw' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           hw =3D clk_hw_register_fixed_factor(NULL, "uart", "xtali", 0, 1,=
 clk_uart_div);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~
   arch/arm/mach-ep93xx/clock.c:484:2: note: Value stored to 'hw' is never =
read
           hw =3D clk_hw_register_fixed_factor(NULL, "uart", "xtali", 0, 1,=
 clk_uart_div);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~
   arch/arm/mach-ep93xx/clock.c:612:2: warning: Value stored to 'hw' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           hw =3D clk_hw_register_fixed_factor(NULL, "usb_clk", "pll2", 0, =
1, clk_usb_div);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~
   arch/arm/mach-ep93xx/clock.c:612:2: note: Value stored to 'hw' is never =
read
           hw =3D clk_hw_register_fixed_factor(NULL, "usb_clk", "pll2", 0, =
1, clk_usb_div);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   security/integrity/ima/ima_api.c:108:24: warning: Access to field 'templ=
ate_desc' results in a dereference of a null pointer (loaded from variable =
'entry') [clang-analyzer-core.NullDereference]
           char *template_name =3D entry->template_desc->name;
                                 ^
   security/integrity/ima/ima_api.c:325:6: note: Assuming the condition is =
false
           if (iint->measured_pcrs & (0x1 << pcr) && !modsig)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/integrity/ima/ima_api.c:325:41: note: Left side of '&&' is false
           if (iint->measured_pcrs & (0x1 << pcr) && !modsig)
                                                  ^
   security/integrity/ima/ima_api.c:328:11: note: Calling 'ima_alloc_init_t=
emplate'
           result =3D ima_alloc_init_template(&event_data, &entry, template=
_desc);
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   security/integrity/ima/ima_api.c:45:6: note: Assuming 'desc' is non-null
           if (desc)
               ^~~~
   security/integrity/ima/ima_api.c:45:2: note: Taking true branch
           if (desc)
           ^
   security/integrity/ima/ima_api.c:52:6: note: Assuming the condition is f=
alse
           if (!*entry)
               ^~~~~~~
   security/integrity/ima/ima_api.c:52:2: note: Taking false branch
           if (!*entry)
           ^
   security/integrity/ima/ima_api.c:55:29: note: Assuming 'ima_tpm_chip' is=
 equal to null
           digests =3D kcalloc(NR_BANKS(ima_tpm_chip) + ima_extra_slots,
                                      ^
   security/integrity/ima/ima.h:44:26: note: expanded from macro 'NR_BANKS'
   #define NR_BANKS(chip) ((chip !=3D NULL) ? chip->nr_allocated_banks : 0)
                            ^~~~~~~~~~~~
   security/integrity/ima/ima_api.c:55:20: note: '?' condition is false
           digests =3D kcalloc(NR_BANKS(ima_tpm_chip) + ima_extra_slots,
                             ^
   security/integrity/ima/ima.h:44:25: note: expanded from macro 'NR_BANKS'
   #define NR_BANKS(chip) ((chip !=3D NULL) ? chip->nr_allocated_banks : 0)
                           ^
   security/integrity/ima/ima_api.c:57:6: note: Assuming 'digests' is non-n=
ull
           if (!digests) {
               ^~~~~~~~
   security/integrity/ima/ima_api.c:57:2: note: Taking false branch
           if (!digests) {
           ^
   security/integrity/ima/ima_api.c:65:14: note: Assuming 'i' is < field 'n=
um_fields'
           for (i =3D 0; i < template_desc->num_fields; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/integrity/ima/ima_api.c:65:2: note: Loop condition is true.  En=
tering loop body
           for (i =3D 0; i < template_desc->num_fields; i++) {
           ^
   security/integrity/ima/ima_api.c:72:7: note: Assuming 'result' is not eq=
ual to 0
                   if (result !=3D 0)
                       ^~~~~~~~~~~
   security/integrity/ima/ima_api.c:72:3: note: Taking true branch
                   if (result !=3D 0)
                   ^
   security/integrity/ima/ima_api.c:73:4: note: Control jumps to line 81
                           goto out;
                           ^
   security/integrity/ima/ima_api.c:82:2: note: Null pointer value stored t=
o 'entry'
           *entry =3D NULL;
           ^~~~~~~~~~~~~
   security/integrity/ima/ima_api.c:328:11: note: Returning from 'ima_alloc=
_init_template'
           result =3D ima_alloc_init_template(&event_data, &entry, template=
_desc);
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   security/integrity/ima/ima_api.c:329:6: note: Assuming 'result' is >=3D 0
           if (result < 0) {
               ^~~~~~~~~~
   security/integrity/ima/ima_api.c:329:2: note: Taking false branch
           if (result < 0) {
           ^
   security/integrity/ima/ima_api.c:335:30: note: Passing null pointer valu=
e via 1st parameter 'entry'
           result =3D ima_store_template(entry, violation, inode, filename,=
 pcr);
                                       ^~~~~
   security/integrity/ima/ima_api.c:335:11: note: Calling 'ima_store_templa=
te'
           result =3D ima_store_template(entry, violation, inode, filename,=
 pcr);
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   security/integrity/ima/ima_api.c:108:24: note: Access to field 'template=
_desc' results in a dereference of a null pointer (loaded from variable 'en=
try')
           char *template_name =3D entry->template_desc->name;
                                 ^~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   22 warnings generated.
   fs/verity/open.c:78:31: warning: The result of the left shift is undefin=
ed due to shifting by '4294967277', which is greater or equal to the width =
of type 'int' [clang-analyzer-core.UndefinedBinaryOperatorResult]
           params->hashes_per_block =3D 1 << params->log_arity;
                                        ^
   fs/verity/open.c:347:6: note: Assuming the condition is false
           if (!IS_VERITY(inode))
--
               ^~~~~~~
   security/keys/trusted-keys/trusted_tpm1.c:483:2: note: Taking false bran=
ch
           if (ret < 0)
           ^
   security/keys/trusted-keys/trusted_tpm1.c:490:8: note: Calling 'TSS_sha1'
           ret =3D TSS_sha1(td->xorwork, SHA1_DIGEST_SIZE * 2, td->xorhash);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/keys/trusted-keys/trusted_tpm1.c:57:10: note: Calling 'init_sde=
sc'
           sdesc =3D init_sdesc(hashalg);
                   ^~~~~~~~~~~~~~~~~~~
   security/keys/trusted-keys/trusted_tpm1.c:44:10: note: Memory is allocat=
ed
           sdesc =3D kmalloc(size, GFP_KERNEL);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   security/keys/trusted-keys/trusted_tpm1.c:45:6: note: Assuming 'sdesc' i=
s non-null
           if (!sdesc)
               ^~~~~~
   security/keys/trusted-keys/trusted_tpm1.c:45:2: note: Taking false branch
           if (!sdesc)
           ^
   security/keys/trusted-keys/trusted_tpm1.c:57:10: note: Returned allocate=
d memory
           sdesc =3D init_sdesc(hashalg);
                   ^~~~~~~~~~~~~~~~~~~
   security/keys/trusted-keys/trusted_tpm1.c:58:2: note: Taking true branch
           if (IS_ERR(sdesc)) {
           ^
   security/keys/trusted-keys/trusted_tpm1.c:59:3: note: Loop condition is =
false.  Exiting loop
                   pr_info("can't alloc %s\n", hash_alg);
                   ^
   include/linux/printk.h:519:2: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   security/keys/trusted-keys/trusted_tpm1.c:490:8: note: Returned allocate=
d memory
           ret =3D TSS_sha1(td->xorwork, SHA1_DIGEST_SIZE * 2, td->xorhash);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/keys/trusted-keys/trusted_tpm1.c:491:6: note: 'ret' is >=3D 0
           if (ret < 0)
               ^~~
   security/keys/trusted-keys/trusted_tpm1.c:491:2: note: Taking false bran=
ch
           if (ret < 0)
           ^
   security/keys/trusted-keys/trusted_tpm1.c:495:6: note: Assuming 'ret' is=
 >=3D 0
           if (ret < 0)
               ^~~~~~~
   security/keys/trusted-keys/trusted_tpm1.c:495:2: note: Taking false bran=
ch
           if (ret < 0)
           ^
   security/keys/trusted-keys/trusted_tpm1.c:498:6: note: Potential leak of=
 memory pointed to by 'ret'
           if (ret !=3D TPM_NONCE_SIZE) {
               ^
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/clk/socfpga/clk-periph.c:69:41: warning: The right operand of '+=
' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           periph_clk->hw.reg =3D clk_mgr_base_addr + reg;
                                                  ^
   drivers/clk/socfpga/clk-periph.c:108:2: note: Calling '__socfpga_periph_=
init'
           __socfpga_periph_init(node, &periclk_ops);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/socfpga/clk-periph.c:53:2: note: 'reg' declared without an i=
nitial value
           u32 reg;
           ^~~~~~~
   drivers/clk/socfpga/clk-periph.c:63:2: note: Calling 'of_property_read_u=
32'
           of_property_read_u32(node, "reg", &reg);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/of.h:1256:9: note: Calling 'of_property_read_u32_array'
           return of_property_read_u32_array(np, propname, out_value, 1);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/of.h:752:2: note: Returning without writing to '*out_value=
s'
           return -ENOSYS;
           ^
   include/linux/of.h:1256:9: note: Returning from 'of_property_read_u32_ar=
ray'
           return of_property_read_u32_array(np, propname, out_value, 1);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/of.h:1256:2: note: Returning without writing to '*out_valu=
e'
           return of_property_read_u32_array(np, propname, out_value, 1);
           ^
   drivers/clk/socfpga/clk-periph.c:63:2: note: Returning from 'of_property=
_read_u32'
           of_property_read_u32(node, "reg", &reg);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/socfpga/clk-periph.c:66:14: note: Assuming 'periph_clk' is n=
on-null
           if (WARN_ON(!periph_clk))
                       ^
   include/asm-generic/bug.h:166:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   drivers/clk/socfpga/clk-periph.c:66:2: note: Taking false branch
           if (WARN_ON(!periph_clk))
           ^
   drivers/clk/socfpga/clk-periph.c:69:41: note: The right operand of '+' i=
s a garbage value
           periph_clk->hw.reg =3D clk_mgr_base_addr + reg;
                                                  ^ ~~~
>> drivers/clk/socfpga/clk-periph.c:103:2: warning: Value stored to 'rc' is=
 never read [clang-analyzer-deadcode.DeadStores]
           rc =3D of_clk_add_provider(node, of_clk_src_simple_get, hw_clk);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/socfpga/clk-periph.c:103:2: note: Value stored to 'rc' is ne=
ver read
           rc =3D of_clk_add_provider(node, of_clk_src_simple_get, hw_clk);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   fs/autofs/dev-ioctl.c:519:34: warning: Although the value stored to 'dev=
id' is used in the enclosing expression, the value is never actually read f=
rom 'devid' [clang-analyzer-deadcode.DeadStores]
           param->ismountpoint.out.devid =3D devid =3D 0;
                                           ^       ~
   fs/autofs/dev-ioctl.c:519:34: note: Although the value stored to 'devid'=
 is used in the enclosing expression, the value is never actually read from=
 'devid'
           param->ismountpoint.out.devid =3D devid =3D 0;
                                           ^       ~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   fs/debugfs/file.c:63:9: warning: Use of memory after it is freed [clang-=
analyzer-unix.Malloc]
           return fsd->real_fops;
                  ^
   fs/debugfs/file.c:252:6: note: Calling 'debugfs_file_get'
           if (debugfs_file_get(dentry))
               ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/debugfs/file.c:87:10: note: Left side of '||' is false
           d_fsd =3D READ_ONCE(dentry->d_fsdata);
                   ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:290:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   fs/debugfs/file.c:87:10: note: Left side of '||' is false
           d_fsd =3D READ_ONCE(dentry->d_fsdata);
                   ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:290:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   fs/debugfs/file.c:87:10: note: Left side of '||' is true
           d_fsd =3D READ_ONCE(dentry->d_fsdata);
                   ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:291:28: note: expanded from macro '__nati=
ve_word'
            sizeof(t) =3D=3D sizeof(int) || sizeof(t) =3D=3D sizeof(long))
                                     ^
   fs/debugfs/file.c:87:10: note: Taking false branch
           d_fsd =3D READ_ONCE(dentry->d_fsdata);
                   ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   fs/debugfs/file.c:87:10: note: Loop condition is false.  Exiting loop
           d_fsd =3D READ_ONCE(dentry->d_fsdata);
                   ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
--
                           ^
   include/asm-generic/bug.h:166:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   drivers/gpu/drm/vkms/vkms_crtc.c:199:8: note: Access to field 'visible' =
results in a dereference of a null pointer (loaded from variable 'plane_sta=
te')
                   if (!plane_state->visible)
                        ^~~~~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/clk/clk-max9485.c:199:9: warning: Access to field 'out' results =
in a dereference of a null pointer (loaded from variable 'prev') [clang-ana=
lyzer-core.NullDereference]
           return prev->out;
                  ^~~~
   drivers/clk/clk-max9485.c:165:36: note: 'prev' initialized to a null poi=
nter value
           const struct max9485_rate *curr, *prev =3D NULL;
                                             ^~~~
   drivers/clk/clk-max9485.c:167:29: note: Assuming field 'out' is equal to=
 0
           for (curr =3D max9485_rates; curr->out !=3D 0; curr++) {
                                      ^~~~~~~~~~~~~~
   drivers/clk/clk-max9485.c:167:2: note: Loop condition is false. Executio=
n continues on line 199
           for (curr =3D max9485_rates; curr->out !=3D 0; curr++) {
           ^
   drivers/clk/clk-max9485.c:199:9: note: Access to field 'out' results in =
a dereference of a null pointer (loaded from variable 'prev')
           return prev->out;
                  ^~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> drivers/clk/socfpga/clk-gate.c:37:10: warning: Although the value stored=
 to 'l4_src' is used in the enclosing expression, the value is never actual=
ly read from 'l4_src' [clang-analyzer-deadcode.DeadStores]
                   return l4_src &=3D 0x1;
                          ^         ~~~
   drivers/clk/socfpga/clk-gate.c:37:10: note: Although the value stored to=
 'l4_src' is used in the enclosing expression, the value is never actually =
read from 'l4_src'
                   return l4_src &=3D 0x1;
                          ^         ~~~
>> drivers/clk/socfpga/clk-gate.c:46:10: warning: Although the value stored=
 to 'perpll_src' is used in the enclosing expression, the value is never ac=
tually read from 'perpll_src' [clang-analyzer-deadcode.DeadStores]
                   return perpll_src &=3D 0x3;
                          ^             ~~~
   drivers/clk/socfpga/clk-gate.c:46:10: note: Although the value stored to=
 'perpll_src' is used in the enclosing expression, the value is never actua=
lly read from 'perpll_src'
                   return perpll_src &=3D 0x3;
                          ^             ~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   drivers/misc/lis3lv02d/lis3lv02d.c:160:3: warning: Undefined or garbage =
value returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
                   return -hw_values[-axis - 1];
                   ^
   drivers/misc/lis3lv02d/lis3lv02d.c:1132:2: note: Control jumps to 'case =
WAI_3DC:'  at line 1155
           switch (lis3->whoami) {
           ^
   drivers/misc/lis3lv02d/lis3lv02d.c:1156:3: note: Loop condition is false=
.  Exiting loop
                   pr_info("8 bits 3DC sensor found\n");
                   ^
   include/linux/printk.h:519:2: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   drivers/misc/lis3lv02d/lis3lv02d.c:1163:3: note:  Execution continues on=
 line 1179
                   break;
                   ^
   drivers/misc/lis3lv02d/lis3lv02d.c:1179:28: note: '?' condition is true
           lis3->reg_cache =3D kzalloc(max(sizeof(lis3_wai8_regs),
                                     ^
   include/linux/minmax.h:52:19: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
                           ^
   include/linux/minmax.h:37:3: note: expanded from macro '__careful_cmp'
                   __cmp(x, y, op), \
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   drivers/misc/lis3lv02d/lis3lv02d.c:1182:6: note: Assuming field 'reg_cac=
he' is not equal to NULL
           if (lis3->reg_cache =3D=3D NULL)
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/lis3lv02d/lis3lv02d.c:1182:2: note: Taking false branch
           if (lis3->reg_cache =3D=3D NULL)
           ^
   drivers/misc/lis3lv02d/lis3lv02d.c:1185:2: note: Loop condition is false=
.  Exiting loop
           mutex_init(&lis3->mutex);
           ^
   include/linux/mutex.h:101:32: note: expanded from macro 'mutex_init'
   #define mutex_init(mutex)                                               \
                                                                           ^
   drivers/misc/lis3lv02d/lis3lv02d.c:1190:6: note: 'err' is 0
           if (err) {
               ^~~
   drivers/misc/lis3lv02d/lis3lv02d.c:1190:2: note: Taking false branch
           if (err) {
           ^
   drivers/misc/lis3lv02d/lis3lv02d.c:1195:6: note: Assuming field 'pm_dev'=
 is null
           if (lis3->pm_dev) {
               ^~~~~~~~~~~~
   drivers/misc/lis3lv02d/lis3lv02d.c:1195:2: note: Taking false branch
           if (lis3->pm_dev) {
           ^
   drivers/misc/lis3lv02d/lis3lv02d.c:1200:6: note: Calling 'lis3lv02d_joys=
tick_enable'
           if (lis3lv02d_joystick_enable(lis3))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/lis3lv02d/lis3lv02d.c:687:6: note: Assuming field 'idev' is=
 null
           if (lis3->idev)
               ^~~~~~~~~~
   drivers/misc/lis3lv02d/lis3lv02d.c:687:2: note: Taking false branch
           if (lis3->idev)
           ^
   drivers/misc/lis3lv02d/lis3lv02d.c:691:6: note: Assuming 'input_dev' is =
non-null
           if (!input_dev)
               ^~~~~~~~~~
   drivers/misc/lis3lv02d/lis3lv02d.c:691:2: note: Taking false branch
           if (!input_dev)

vim +154 arch/arm/mach-ep93xx/clock.c

ff05c0330b9880 Hartley Sweeten 2009-05-07  125  =

9645ccc7bd7a16 Nikita Shubin   2021-10-18  126  static struct clk_hw *ep93x=
x_clk_register_gate(const char *name,
9645ccc7bd7a16 Nikita Shubin   2021-10-18  127  				    const char *parent_=
name,
9645ccc7bd7a16 Nikita Shubin   2021-10-18  128  				    void __iomem *reg,
9645ccc7bd7a16 Nikita Shubin   2021-10-18  129  				    u8 bit_idx)
9645ccc7bd7a16 Nikita Shubin   2021-10-18  130  {
9645ccc7bd7a16 Nikita Shubin   2021-10-18  131  	struct clk_init_data init;
9645ccc7bd7a16 Nikita Shubin   2021-10-18  132  	struct clk_psc *psc;
9645ccc7bd7a16 Nikita Shubin   2021-10-18  133  	struct clk *clk;
9645ccc7bd7a16 Nikita Shubin   2021-10-18  134  =

9645ccc7bd7a16 Nikita Shubin   2021-10-18  135  	psc =3D kzalloc(sizeof(*ps=
c), GFP_KERNEL);
9645ccc7bd7a16 Nikita Shubin   2021-10-18  136  	if (!psc)
9645ccc7bd7a16 Nikita Shubin   2021-10-18  137  		return ERR_PTR(-ENOMEM);
9645ccc7bd7a16 Nikita Shubin   2021-10-18  138  =

9645ccc7bd7a16 Nikita Shubin   2021-10-18  139  	init.name =3D name;
9645ccc7bd7a16 Nikita Shubin   2021-10-18  140  	init.ops =3D &clk_ep93xx_g=
ate_ops;
9645ccc7bd7a16 Nikita Shubin   2021-10-18  141  	init.flags =3D CLK_SET_RAT=
E_PARENT;
9645ccc7bd7a16 Nikita Shubin   2021-10-18  142  	init.parent_names =3D (par=
ent_name ? &parent_name : NULL);
9645ccc7bd7a16 Nikita Shubin   2021-10-18  143  	init.num_parents =3D (pare=
nt_name ? 1 : 0);
9645ccc7bd7a16 Nikita Shubin   2021-10-18  144  =

9645ccc7bd7a16 Nikita Shubin   2021-10-18  145  	psc->reg =3D reg;
9645ccc7bd7a16 Nikita Shubin   2021-10-18  146  	psc->bit_idx =3D bit_idx;
9645ccc7bd7a16 Nikita Shubin   2021-10-18  147  	psc->hw.init =3D &init;
9645ccc7bd7a16 Nikita Shubin   2021-10-18  148  	psc->lock =3D &clk_lock;
9645ccc7bd7a16 Nikita Shubin   2021-10-18  149  =

9645ccc7bd7a16 Nikita Shubin   2021-10-18  150  	clk =3D clk_register(NULL,=
 &psc->hw);
9645ccc7bd7a16 Nikita Shubin   2021-10-18  151  	if (IS_ERR(clk))
9645ccc7bd7a16 Nikita Shubin   2021-10-18  152  		kfree(psc);
9645ccc7bd7a16 Nikita Shubin   2021-10-18  153  =

9645ccc7bd7a16 Nikita Shubin   2021-10-18 @154  	return &psc->hw;
ff05c0330b9880 Hartley Sweeten 2009-05-07  155  }
ff05c0330b9880 Hartley Sweeten 2009-05-07  156  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7936176597902869073==--


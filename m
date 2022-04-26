Content-Type: multipart/mixed; boundary="===============7319295312371877424=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/pci/aw2/aw2-alsa.c:288:2: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provi...
Date: Tue, 26 Apr 2022 11:04:32 +0800
Message-ID: <202204261025.oePn8bz1-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7319295312371877424==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>
CC: Masahiro Yamada <masahiroy@kernel.org>
CC: Alex Shi <alexs@kernel.org>
CC: Nick Desaulniers <ndesaulniers@google.com>
CC: Miguel Ojeda <ojeda@kernel.org>
CC: Nathan Chancellor <nathan@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d615b5416f8a1afeb82d13b238f8152c572d59c0
commit: e8c07082a810fbb9db303a2b66b66b8d7e588b53 Kbuild: move to -std=3Dgnu=
11
date:   6 weeks ago
:::::: branch date: 9 hours ago
:::::: commit date: 6 weeks ago
config: x86_64-randconfig-c007-20220425 (https://download.01.org/0day-ci/ar=
chive/20220426/202204261025.oePn8bz1-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1cddcf=
dc3c683b393df1a5c9063252eb60e52818)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De8c07082a810fbb9db303a2b66b66b8d7e588b53
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e8c07082a810fbb9db303a2b66b66b8d7e588b53
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                  ^~~~~~~
   drivers/mmc/core/mmc.c:805:1: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   MMC_DEV_ATTR(ocr, "0x%08x\n", card->ocr);
   ^
   drivers/mmc/core/bus.h:20:9: note: expanded from macro 'MMC_DEV_ATTR'
           return sprintf(buf, fmt, args);                                 =
        \
                  ^~~~~~~
   drivers/mmc/core/mmc.c:805:1: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
   MMC_DEV_ATTR(ocr, "0x%08x\n", card->ocr);
   ^
   drivers/mmc/core/bus.h:20:9: note: expanded from macro 'MMC_DEV_ATTR'
           return sprintf(buf, fmt, args);                                 =
        \
                  ^~~~~~~
   drivers/mmc/core/mmc.c:806:1: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   MMC_DEV_ATTR(rca, "0x%04x\n", card->rca);
   ^
   drivers/mmc/core/bus.h:20:9: note: expanded from macro 'MMC_DEV_ATTR'
           return sprintf(buf, fmt, args);                                 =
        \
                  ^~~~~~~
   drivers/mmc/core/mmc.c:806:1: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
   MMC_DEV_ATTR(rca, "0x%04x\n", card->rca);
   ^
   drivers/mmc/core/bus.h:20:9: note: expanded from macro 'MMC_DEV_ATTR'
           return sprintf(buf, fmt, args);                                 =
        \
                  ^~~~~~~
   drivers/mmc/core/mmc.c:807:1: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   MMC_DEV_ATTR(cmdq_en, "%d\n", card->ext_csd.cmdq_en);
   ^
   drivers/mmc/core/bus.h:20:9: note: expanded from macro 'MMC_DEV_ATTR'
           return sprintf(buf, fmt, args);                                 =
        \
                  ^~~~~~~
   drivers/mmc/core/mmc.c:807:1: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
   MMC_DEV_ATTR(cmdq_en, "%d\n", card->ext_csd.cmdq_en);
   ^
   drivers/mmc/core/bus.h:20:9: note: expanded from macro 'MMC_DEV_ATTR'
           return sprintf(buf, fmt, args);                                 =
        \
                  ^~~~~~~
   drivers/mmc/core/mmc.c:816:10: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "0x%x\n", card->cid.fwrev);
                          ^~~~~~~
   drivers/mmc/core/mmc.c:816:10: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "0x%x\n", card->cid.fwrev);
                          ^~~~~~~
   drivers/mmc/core/mmc.c:818:10: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "0x%*phN\n", MMC_FIRMWARE_LEN,
                          ^~~~~~~
   drivers/mmc/core/mmc.c:818:10: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "0x%*phN\n", MMC_FIRMWARE_LEN,
                          ^~~~~~~
   drivers/mmc/core/mmc.c:833:10: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "0x%x\n", host->dsr);
                          ^~~~~~~
   drivers/mmc/core/mmc.c:833:10: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "0x%x\n", host->dsr);
                          ^~~~~~~
   drivers/mmc/core/mmc.c:836:10: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "0x%x\n", 0x404);
                          ^~~~~~~
   drivers/mmc/core/mmc.c:836:10: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "0x%x\n", 0x404);
                          ^~~~~~~
   drivers/mmc/core/mmc.c:1637:3: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(card->raw_cid, cid, sizeof(card->raw_cid));
                   ^~~~~~
   drivers/mmc/core/mmc.c:1637:3: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
                   memcpy(card->raw_cid, cid, sizeof(card->raw_cid));
                   ^~~~~~
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   drivers/mtd/ubi/upd.c:227:3: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(buf + len, 0xFF, l - len);
                   ^~~~~~
   drivers/mtd/ubi/upd.c:227:3: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
                   memset(buf + len, 0xFF, l - len);
                   ^~~~~~
   drivers/mtd/ubi/upd.c:245:3: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(buf + len, 0, vol->usable_leb_size - len);
                   ^~~~~~
   drivers/mtd/ubi/upd.c:245:3: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
                   memset(buf + len, 0, vol->usable_leb_size - len);
                   ^~~~~~
   drivers/mtd/ubi/upd.c:403:3: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(vol->upd_buf + vol->upd_bytes, 0xFF,
                   ^~~~~~
   drivers/mtd/ubi/upd.c:403:3: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
                   memset(vol->upd_buf + vol->upd_bytes, 0xFF,
                   ^~~~~~
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
   Suppressed 48 warnings (48 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
>> sound/pci/aw2/aw2-alsa.c:288:2: warning: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferH=
andling]
           sprintf(card->longname, "%s with SAA7146 irq %i",
           ^~~~~~~
   sound/pci/aw2/aw2-alsa.c:288:2: note: Call to function 'sprintf' is inse=
cure as it does not provide bounding of the memory buffer or security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'sprintf_s' in ca=
se of C11
           sprintf(card->longname, "%s with SAA7146 irq %i",
           ^~~~~~~
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   sound/pci/ctxfi/xfi.c:103:2: warning: Call to function 'snprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(card->longname, sizeof(card->longname), "%s %s %s",
           ^~~~~~~~
   sound/pci/ctxfi/xfi.c:103:2: note: Call to function 'snprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'snprintf_s' in case of C11
           snprintf(card->longname, sizeof(card->longname), "%s %s %s",
           ^~~~~~~~
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   sound/pci/ctxfi/ctvmem.c:51:6: warning: Access to field 'size' results i=
n a dereference of an undefined pointer value (loaded from variable 'entry'=
) [clang-analyzer-core.NullDereference]
           if (entry->size =3D=3D size) {
               ^
   sound/pci/ctxfi/ctvmem.c:132:10: note: Calling 'get_vm_block'
           block =3D get_vm_block(vm, size, atc);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/ctxfi/ctvmem.c:32:37: note: 'entry' declared without an initia=
l value
           struct ct_vm_block *block =3D NULL, *entry;
                                              ^~~~~
   sound/pci/ctxfi/ctvmem.c:36:6: note: Assuming 'size' is <=3D field 'size'
           if (size > vm->size) {
               ^~~~~~~~~~~~~~~
   sound/pci/ctxfi/ctvmem.c:36:2: note: Taking false branch
           if (size > vm->size) {
           ^
   sound/pci/ctxfi/ctvmem.c:43:2: note: Loop condition is false. Execution =
continues on line 48
           list_for_each(pos, &vm->unused) {
           ^
   include/linux/list.h:580:2: note: expanded from macro 'list_for_each'
           for (pos =3D (head)->next; !list_is_head(pos, (head)); pos =3D p=
os->next)
           ^
   sound/pci/ctxfi/ctvmem.c:48:6: note: Assuming the condition is false
           if (pos =3D=3D &vm->unused)
               ^~~~~~~~~~~~~~~~~~
   sound/pci/ctxfi/ctvmem.c:48:2: note: Taking false branch
           if (pos =3D=3D &vm->unused)
           ^
   sound/pci/ctxfi/ctvmem.c:51:6: note: Access to field 'size' results in a=
 dereference of an undefined pointer value (loaded from variable 'entry')
           if (entry->size =3D=3D size) {
               ^~~~~
   sound/pci/ctxfi/ctvmem.c:95:38: warning: Access to field 'addr' results =
in a dereference of an undefined pointer value (loaded from variable 'entry=
') [clang-analyzer-core.NullDereference]
                   if ((block->addr + block->size) =3D=3D entry->addr) {
                                                      ^
   sound/pci/ctxfi/ctvmem.c:155:2: note: Calling 'put_vm_block'
           put_vm_block(vm, block);
           ^~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/ctxfi/ctvmem.c:77:22: note: 'entry' declared without an initia=
l value
           struct ct_vm_block *entry, *pre_ent;
                               ^~~~~
   sound/pci/ctxfi/ctvmem.c:86:2: note: Loop condition is false. Execution =
continues on line 91
           list_for_each(pos, &vm->unused) {
           ^
   include/linux/list.h:580:2: note: expanded from macro 'list_for_each'
           for (pos =3D (head)->next; !list_is_head(pos, (head)); pos =3D p=
os->next)
           ^
   sound/pci/ctxfi/ctvmem.c:91:6: note: Assuming the condition is false
           if (pos =3D=3D &vm->unused) {
               ^~~~~~~~~~~~~~~~~~
   sound/pci/ctxfi/ctvmem.c:91:2: note: Taking false branch
           if (pos =3D=3D &vm->unused) {
           ^
   sound/pci/ctxfi/ctvmem.c:95:38: note: Access to field 'addr' results in =
a dereference of an undefined pointer value (loaded from variable 'entry')
                   if ((block->addr + block->size) =3D=3D entry->addr) {
                                                      ^~~~~
   sound/pci/ctxfi/ctvmem.c:224:3: warning: Use of memory after it is freed=
 [clang-analyzer-unix.Malloc]
                   list_del(pos);
                   ^
   sound/pci/ctxfi/ctvmem.c:178:6: note: Assuming 'vm' is non-null
           if (!vm)
               ^~~
   sound/pci/ctxfi/ctvmem.c:178:2: note: Taking false branch
           if (!vm)
           ^
   sound/pci/ctxfi/ctvmem.c:181:2: note: Loop condition is false.  Exiting =
loop
           mutex_init(&vm->lock);
           ^
   include/linux/mutex.h:101:32: note: expanded from macro 'mutex_init'
   #define mutex_init(mutex)                                               \
                                                                           ^
   sound/pci/ctxfi/ctvmem.c:184:2: note: Loop condition is true.  Entering =
loop body
           for (i =3D 0; i < CT_PTP_NUM; i++) {
           ^
   sound/pci/ctxfi/ctvmem.c:188:7: note: Assuming 'err' is < 0
                   if (err < 0)
                       ^~~~~~~
   sound/pci/ctxfi/ctvmem.c:188:3: note: Taking true branch
                   if (err < 0)

vim +288 sound/pci/aw2/aw2-alsa.c

98f2a97f207a77 Cedric Bregardis 2008-02-20  250  =

98f2a97f207a77 Cedric Bregardis 2008-02-20  251  /* constructor */
e23e7a14362072 Bill Pemberton   2012-12-06  252  static int snd_aw2_probe(s=
truct pci_dev *pci,
98f2a97f207a77 Cedric Bregardis 2008-02-20  253  			 const struct pci_devic=
e_id *pci_id)
98f2a97f207a77 Cedric Bregardis 2008-02-20  254  {
98f2a97f207a77 Cedric Bregardis 2008-02-20  255  	static int dev;
98f2a97f207a77 Cedric Bregardis 2008-02-20  256  	struct snd_card *card;
98f2a97f207a77 Cedric Bregardis 2008-02-20  257  	struct aw2 *chip;
98f2a97f207a77 Cedric Bregardis 2008-02-20  258  	int err;
98f2a97f207a77 Cedric Bregardis 2008-02-20  259  =

98f2a97f207a77 Cedric Bregardis 2008-02-20  260  	/* (1) Continue if device=
 is not enabled, else inc dev */
98f2a97f207a77 Cedric Bregardis 2008-02-20  261  	if (dev >=3D SNDRV_CARDS)
98f2a97f207a77 Cedric Bregardis 2008-02-20  262  		return -ENODEV;
98f2a97f207a77 Cedric Bregardis 2008-02-20  263  	if (!enable[dev]) {
98f2a97f207a77 Cedric Bregardis 2008-02-20  264  		dev++;
98f2a97f207a77 Cedric Bregardis 2008-02-20  265  		return -ENOENT;
98f2a97f207a77 Cedric Bregardis 2008-02-20  266  	}
98f2a97f207a77 Cedric Bregardis 2008-02-20  267  =

98f2a97f207a77 Cedric Bregardis 2008-02-20  268  	/* (2) Create card instan=
ce */
33631012cd067d Takashi Iwai     2021-07-15  269  	err =3D snd_devm_card_new=
(&pci->dev, index[dev], id[dev], THIS_MODULE,
33631012cd067d Takashi Iwai     2021-07-15  270  				sizeof(*chip), &card);
e58de7baf7de11 Takashi Iwai     2008-12-28  271  	if (err < 0)
e58de7baf7de11 Takashi Iwai     2008-12-28  272  		return err;
33631012cd067d Takashi Iwai     2021-07-15  273  	chip =3D card->private_da=
ta;
98f2a97f207a77 Cedric Bregardis 2008-02-20  274  =

98f2a97f207a77 Cedric Bregardis 2008-02-20  275  	/* (3) Create main compon=
ent */
33631012cd067d Takashi Iwai     2021-07-15  276  	err =3D snd_aw2_create(ca=
rd, pci);
33631012cd067d Takashi Iwai     2021-07-15  277  	if (err < 0)
98f2a97f207a77 Cedric Bregardis 2008-02-20  278  		return err;
98f2a97f207a77 Cedric Bregardis 2008-02-20  279  =

98f2a97f207a77 Cedric Bregardis 2008-02-20  280  	/* initialize mutex */
98f2a97f207a77 Cedric Bregardis 2008-02-20  281  	mutex_init(&chip->mtx);
98f2a97f207a77 Cedric Bregardis 2008-02-20  282  	/* init spinlock */
98f2a97f207a77 Cedric Bregardis 2008-02-20  283  	spin_lock_init(&chip->reg=
_lock);
98f2a97f207a77 Cedric Bregardis 2008-02-20  284  	/* (4) Define driver ID a=
nd name string */
98f2a97f207a77 Cedric Bregardis 2008-02-20  285  	strcpy(card->driver, "aw2=
");
98f2a97f207a77 Cedric Bregardis 2008-02-20  286  	strcpy(card->shortname, "=
Audiowerk2");
98f2a97f207a77 Cedric Bregardis 2008-02-20  287  =

98f2a97f207a77 Cedric Bregardis 2008-02-20 @288  	sprintf(card->longname, "=
%s with SAA7146 irq %i",
98f2a97f207a77 Cedric Bregardis 2008-02-20  289  		card->shortname, chip->i=
rq);
98f2a97f207a77 Cedric Bregardis 2008-02-20  290  =

98f2a97f207a77 Cedric Bregardis 2008-02-20  291  	/* (5) Create other compo=
nents */
98f2a97f207a77 Cedric Bregardis 2008-02-20  292  	snd_aw2_new_pcm(chip);
98f2a97f207a77 Cedric Bregardis 2008-02-20  293  =

98f2a97f207a77 Cedric Bregardis 2008-02-20  294  	/* (6) Register card inst=
ance */
98f2a97f207a77 Cedric Bregardis 2008-02-20  295  	err =3D snd_card_register=
(card);
33631012cd067d Takashi Iwai     2021-07-15  296  	if (err < 0)
98f2a97f207a77 Cedric Bregardis 2008-02-20  297  		return err;
98f2a97f207a77 Cedric Bregardis 2008-02-20  298  =

98f2a97f207a77 Cedric Bregardis 2008-02-20  299  	/* (7) Set PCI driver dat=
a */
98f2a97f207a77 Cedric Bregardis 2008-02-20  300  	pci_set_drvdata(pci, card=
);
98f2a97f207a77 Cedric Bregardis 2008-02-20  301  =

98f2a97f207a77 Cedric Bregardis 2008-02-20  302  	dev++;
98f2a97f207a77 Cedric Bregardis 2008-02-20  303  	return 0;
98f2a97f207a77 Cedric Bregardis 2008-02-20  304  }
98f2a97f207a77 Cedric Bregardis 2008-02-20  305  =


:::::: The code@line 288 was first introduced by commit
:::::: 98f2a97f207a776603173ee96327d977e592579d [ALSA] Emagic Audiowerk 2 A=
LSA driver.

:::::: TO: Cedric Bregardis <cedric.bregardis@free.fr>
:::::: CC: Takashi Iwai <tiwai@suse.de>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7319295312371877424==--


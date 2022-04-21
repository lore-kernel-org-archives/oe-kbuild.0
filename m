Content-Type: multipart/mixed; boundary="===============2856540053824992676=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/scsi/pm8001/pm8001_init.c:531:2: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments...
Date: Thu, 21 Apr 2022 15:16:07 +0800
Message-ID: <202204211522.ZO0BfMax-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2856540053824992676==
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
head:   b253435746d9a4a701b5f09211b9c14d3370d0da
commit: e8c07082a810fbb9db303a2b66b66b8d7e588b53 Kbuild: move to -std=3Dgnu=
11
date:   6 weeks ago
:::::: branch date: 12 hours ago
:::::: commit date: 6 weeks ago
config: riscv-randconfig-c006-20220419 (https://download.01.org/0day-ci/arc=
hive/20220421/202204211522.ZO0BfMax-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c1c49a=
356162b22554088d269f7689bdb044a9f1)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De8c07082a810fbb9db303a2b66b66b8d7e588b53
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e8c07082a810fbb9db303a2b66b66b8d7e588b53
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                  ^~~~~~~
   drivers/leds/trigger/ledtrig-oneshot.c:97:9: warning: Call to function '=
sprintf' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'sprintf_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%lu\n", led_cdev->blink_delay_off);
                  ^~~~~~~
   drivers/leds/trigger/ledtrig-oneshot.c:97:9: note: Call to function 'spr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%lu\n", led_cdev->blink_delay_off);
                  ^~~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   58 warnings generated.
   fs/ext4/inline.c:183:2: warning: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buffer, (void *)(raw_inode->i_block), cp_len);
           ^~~~~~
   fs/ext4/inline.c:183:2: note: Call to function 'memcpy' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memcpy_s' in case of C11
           memcpy(buffer, (void *)(raw_inode->i_block), cp_len);
           ^~~~~~
   fs/ext4/inline.c:197:2: warning: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buffer,
           ^~~~~~
   fs/ext4/inline.c:197:2: note: Call to function 'memcpy' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memcpy_s' in case of C11
           memcpy(buffer,
           ^~~~~~
   fs/ext4/inline.c:231:3: warning: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy((void *)raw_inode->i_block + pos, buffer, cp_len);
                   ^~~~~~
   fs/ext4/inline.c:231:3: note: Call to function 'memcpy' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memcpy_s' in case of C11
                   memcpy((void *)raw_inode->i_block + pos, buffer, cp_len);
                   ^~~~~~
   fs/ext4/inline.c:246:2: warning: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy((void *)IFIRST(header) + le16_to_cpu(entry->e_value_offs)=
 + pos,
           ^~~~~~
   fs/ext4/inline.c:246:2: note: Call to function 'memcpy' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memcpy_s' in case of C11
           memcpy((void *)IFIRST(header) + le16_to_cpu(entry->e_value_offs)=
 + pos,
           ^~~~~~
   fs/ext4/inline.c:299:2: warning: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
           memset((void *)ext4_raw_inode(&is.iloc)->i_block,
           ^~~~~~
   fs/ext4/inline.c:299:2: note: Call to function 'memset' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memset_s' in case of C11
           memset((void *)ext4_raw_inode(&is.iloc)->i_block,
           ^~~~~~
   fs/ext4/inline.c:442:2: warning: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
           memset((void *)ext4_raw_inode(&is.iloc)->i_block,
           ^~~~~~
   fs/ext4/inline.c:442:2: note: Call to function 'memset' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memset_s' in case of C11
           memset((void *)ext4_raw_inode(&is.iloc)->i_block,
           ^~~~~~
   fs/ext4/inline.c:444:2: warning: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(ei->i_data, 0, EXT4_MIN_INLINE_DATA_SIZE);
           ^~~~~~
   fs/ext4/inline.c:444:2: note: Call to function 'memset' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memset_s' in case of C11
           memset(ei->i_data, 0, EXT4_MIN_INLINE_DATA_SIZE);
           ^~~~~~
   fs/ext4/inline.c:1164:2: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy((void *)de, buf + EXT4_INLINE_DOTDOT_SIZE,
           ^~~~~~
   fs/ext4/inline.c:1164:2: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
           memcpy((void *)de, buf + EXT4_INLINE_DOTDOT_SIZE,
           ^~~~~~
   fs/ext4/inline.c:1250:2: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(data_bh->b_data, 0, inode->i_sb->s_blocksize);
           ^~~~~~
   fs/ext4/inline.c:1250:2: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
           memset(data_bh->b_data, 0, inode->i_sb->s_blocksize);
           ^~~~~~
   fs/ext4/inline.c:1253:3: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(data_bh->b_data, buf, inline_size);
                   ^~~~~~
   fs/ext4/inline.c:1253:3: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
                   memcpy(data_bh->b_data, buf, inline_size);
                   ^~~~~~
   fs/ext4/inline.c:1972:4: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(p + i_size, 0,
                           ^~~~~~
   fs/ext4/inline.c:1972:4: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
                           memset(p + i_size, 0,
                           ^~~~~~
   Suppressed 47 warnings (47 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   drivers/scsi/aic7xxx/aic79xx_osm_pci.c:157:2: warning: Call to function =
'sprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'sprintf_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(buf, "ahd_pci:%d:%d:%d",
           ^~~~~~~
   drivers/scsi/aic7xxx/aic79xx_osm_pci.c:157:2: note: Call to function 'sp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'sprintf_s' in case of C11
           sprintf(buf, "ahd_pci:%d:%d:%d",
           ^~~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   56 warnings generated.
   drivers/scsi/pm8001/pm8001_init.c:412:3: warning: Value stored to 'rc' i=
s never read [clang-analyzer-deadcode.DeadStores]
                   rc =3D -ENOMEM;
                   ^    ~~~~~~~
   drivers/scsi/pm8001/pm8001_init.c:412:3: note: Value stored to 'rc' is n=
ever read
                   rc =3D -ENOMEM;
                   ^    ~~~~~~~
>> drivers/scsi/pm8001/pm8001_init.c:531:2: warning: Call to function 'spri=
ntf' is insecure as it does not provide bounding of the memory buffer or se=
curity checks introduced in the C11 standard. Replace with analogous functi=
ons that support length arguments or provides boundary checks such as 'spri=
ntf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsa=
feBufferHandling]
           sprintf(pm8001_ha->name, "%s%d", DRV_NAME, pm8001_ha->id);
           ^~~~~~~
   drivers/scsi/pm8001/pm8001_init.c:531:2: note: Call to function 'sprintf=
' is insecure as it does not provide bounding of the memory buffer or secur=
ity checks introduced in the C11 standard. Replace with analogous functions=
 that support length arguments or provides boundary checks such as 'sprintf=
_s' in case of C11
           sprintf(pm8001_ha->name, "%s%d", DRV_NAME, pm8001_ha->id);
           ^~~~~~~
   drivers/scsi/pm8001/pm8001_init.c:591:2: warning: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(sha, 0x00, sizeof(*sha));
           ^~~~~~
   drivers/scsi/pm8001/pm8001_init.c:591:2: note: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11
           memset(sha, 0x00, sizeof(*sha));
           ^~~~~~
   drivers/scsi/pm8001/pm8001_init.c:722:2: warning: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(sas_add, pm8001_ha->sas_addr, SAS_ADDR_SIZE);
           ^~~~~~
   drivers/scsi/pm8001/pm8001_init.c:722:2: note: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(sas_add, pm8001_ha->sas_addr, SAS_ADDR_SIZE);
           ^~~~~~
   drivers/scsi/pm8001/pm8001_init.c:726:3: warning: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&pm8001_ha->phy[i].dev_sas_addr,
                   ^~~~~~
   drivers/scsi/pm8001/pm8001_init.c:726:3: note: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&pm8001_ha->phy[i].dev_sas_addr,
                   ^~~~~~
   drivers/scsi/pm8001/pm8001_init.c:881:2: warning: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&phycfg_int, 0, sizeof(phycfg_int));
           ^~~~~~
   drivers/scsi/pm8001/pm8001_init.c:881:2: note: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11
           memset(&phycfg_int, 0, sizeof(phycfg_int));
           ^~~~~~
   drivers/scsi/pm8001/pm8001_init.c:882:2: warning: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&phycfg_ext, 0, sizeof(phycfg_ext));
           ^~~~~~
   drivers/scsi/pm8001/pm8001_init.c:882:2: note: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11
           memset(&phycfg_ext, 0, sizeof(phycfg_ext));
           ^~~~~~
   drivers/scsi/pm8001/pm8001_init.c:982:3: warning: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(pm8001_ha->intr_drvname[i],
                   ^~~~~~~~
   drivers/scsi/pm8001/pm8001_init.c:982:3: note: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(pm8001_ha->intr_drvname[i],
                   ^~~~~~~~
   Suppressed 48 warnings (48 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   50 warnings generated.
   fs/netfs/read_helper.c:249:42: warning: Use of memory after it is freed =
[clang-analyzer-unix.Malloc]
                   XA_STATE(xas, &rreq->mapping->i_pages, subreq->start / P=
AGE_SIZE);
                                                          ^
   fs/netfs/read_helper.c:355:2: note: Calling 'netfs_rreq_do_write_to_cach=
e'
           netfs_rreq_do_write_to_cache(rreq);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/netfs/read_helper.c:308:2: note: Loop condition is true.  Entering lo=
op body
           list_for_each_entry_safe(subreq, p, &rreq->subrequests, rreq_lin=
k) {
           ^
   include/linux/list.h:725:2: note: expanded from macro 'list_for_each_ent=
ry_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
           ^
   fs/netfs/read_helper.c:309:7: note: Assuming the condition is true
                   if (!test_bit(NETFS_SREQ_WRITE_TO_CACHE, &subreq->flags)=
) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/netfs/read_helper.c:309:3: note: Taking true branch
                   if (!test_bit(NETFS_SREQ_WRITE_TO_CACHE, &subreq->flags)=
) {
                   ^
   fs/netfs/read_helper.c:311:4: note: Calling 'netfs_put_subrequest'
                           netfs_put_subrequest(subreq, false);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/netfs/read_helper.c:36:2: note: Taking true branch
           if (refcount_dec_and_test(&subreq->usage))
           ^
   fs/netfs/read_helper.c:37:3: note: Calling '__netfs_put_subrequest'
                   __netfs_put_subrequest(subreq, was_async);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/netfs/read_helper.c:142:2: note: Memory is released
           kfree(subreq);
           ^~~~~~~~~~~~~
   fs/netfs/read_helper.c:37:3: note: Returning; memory was released
                   __netfs_put_subrequest(subreq, was_async);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/netfs/read_helper.c:311:4: note: Returning; memory was released
                           netfs_put_subrequest(subreq, false);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/netfs/read_helper.c:308:2: note: Loop condition is false. Execution c=
ontinues on line 315
           list_for_each_entry_safe(subreq, p, &rreq->subrequests, rreq_lin=
k) {
           ^
   include/linux/list.h:725:2: note: expanded from macro 'list_for_each_ent=
ry_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
           ^
   fs/netfs/read_helper.c:315:2: note: Loop condition is false. Execution c=
ontinues on line 346
           list_for_each_entry(subreq, &rreq->subrequests, rreq_link) {
           ^
   include/linux/list.h:638:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   fs/netfs/read_helper.c:346:6: note: Assuming the condition is true
           if (atomic_dec_and_test(&rreq->nr_wr_ops))
--
                              ^~~~~~~~~~~~~~~~
   lib/zstd/decompress/huf_decompress.c:1113:32: note: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11
       if (cSrcSize =3D=3D dstSize) { ZSTD_memcpy(dst, cSrc, dstSize); retu=
rn dstSize; }   /* not compressed */
                                  ^
   lib/zstd/decompress/../common/zstd_deps.h:32:28: note: expanded from mac=
ro 'ZSTD_memcpy'
   #define ZSTD_memcpy(d,s,n) __builtin_memcpy((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/decompress/huf_decompress.c:1114:26: warning: Call to function =
'memset' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memset_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
       if (cSrcSize =3D=3D 1) { ZSTD_memset(dst, *(const BYTE*)cSrc, dstSiz=
e); return dstSize; }   /* RLE */
                            ^
   lib/zstd/decompress/../common/zstd_deps.h:34:28: note: expanded from mac=
ro 'ZSTD_memset'
   #define ZSTD_memset(d,s,n) __builtin_memset((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   lib/zstd/decompress/huf_decompress.c:1114:26: note: Call to function 'me=
mset' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memset_s' in case of C11
       if (cSrcSize =3D=3D 1) { ZSTD_memset(dst, *(const BYTE*)cSrc, dstSiz=
e); return dstSize; }   /* RLE */
                            ^
   lib/zstd/decompress/../common/zstd_deps.h:34:28: note: expanded from mac=
ro 'ZSTD_memset'
   #define ZSTD_memset(d,s,n) __builtin_memset((d),(s),(n))
                              ^~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   79 warnings generated.
   drivers/scsi/pm8001/pm8001_ctl.c:64:10: warning: Call to function 'snpri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'snprintf_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return snprintf(buf, PAGE_SIZE, "%d\n",
                          ^~~~~~~~
   drivers/scsi/pm8001/pm8001_ctl.c:64:10: note: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11
                   return snprintf(buf, PAGE_SIZE, "%d\n",
                          ^~~~~~~~
   drivers/scsi/pm8001/pm8001_ctl.c:67:10: warning: Call to function 'snpri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'snprintf_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return snprintf(buf, PAGE_SIZE, "%d\n",
                          ^~~~~~~~
   drivers/scsi/pm8001/pm8001_ctl.c:67:10: note: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11
                   return snprintf(buf, PAGE_SIZE, "%d\n",
                          ^~~~~~~~
   drivers/scsi/pm8001/pm8001_ctl.c:89:9: warning: Call to function 'snprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'snprintf_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(buf, PAGE_SIZE, "%d\n",
                  ^~~~~~~~
   drivers/scsi/pm8001/pm8001_ctl.c:89:9: note: Call to function 'snprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'snprintf_s' in case of C11
           return snprintf(buf, PAGE_SIZE, "%d\n",
                  ^~~~~~~~
   drivers/scsi/pm8001/pm8001_ctl.c:110:10: warning: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return snprintf(buf, PAGE_SIZE, "%02x.%02x.%02x.%02x\n",
                          ^~~~~~~~
   drivers/scsi/pm8001/pm8001_ctl.c:110:10: note: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11
                   return snprintf(buf, PAGE_SIZE, "%02x.%02x.%02x.%02x\n",
                          ^~~~~~~~
   drivers/scsi/pm8001/pm8001_ctl.c:116:10: warning: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return snprintf(buf, PAGE_SIZE, "%02x.%02x.%02x.%02x\n",
                          ^~~~~~~~
   drivers/scsi/pm8001/pm8001_ctl.c:116:10: note: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11
                   return snprintf(buf, PAGE_SIZE, "%02x.%02x.%02x.%02x\n",
                          ^~~~~~~~
   drivers/scsi/pm8001/pm8001_ctl.c:141:10: warning: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return snprintf(buf, PAGE_SIZE, "%02x.%02x.%02x.%02x\n",
                          ^~~~~~~~
   drivers/scsi/pm8001/pm8001_ctl.c:141:10: note: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11
                   return snprintf(buf, PAGE_SIZE, "%02x.%02x.%02x.%02x\n",
                          ^~~~~~~~
   drivers/scsi/pm8001/pm8001_ctl.c:167:10: warning: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return snprintf(buf, PAGE_SIZE, "%02x.%02x.%02x.%02x\n",
                          ^~~~~~~~
   drivers/scsi/pm8001/pm8001_ctl.c:167:10: note: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11
                   return snprintf(buf, PAGE_SIZE, "%02x.%02x.%02x.%02x\n",
                          ^~~~~~~~
   drivers/scsi/pm8001/pm8001_ctl.c:194:10: warning: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return snprintf(buf, PAGE_SIZE, "%d\n",
                          ^~~~~~~~
   drivers/scsi/pm8001/pm8001_ctl.c:194:10: note: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11
                   return snprintf(buf, PAGE_SIZE, "%d\n",
                          ^~~~~~~~
   drivers/scsi/pm8001/pm8001_ctl.c:197:10: warning: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return snprintf(buf, PAGE_SIZE, "%d\n",
                          ^~~~~~~~
   drivers/scsi/pm8001/pm8001_ctl.c:197:10: note: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11
                   return snprintf(buf, PAGE_SIZE, "%d\n",
                          ^~~~~~~~
   drivers/scsi/pm8001/pm8001_ctl.c:218:10: warning: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return snprintf(buf, PAGE_SIZE, "%04d\n",
                          ^~~~~~~~
   drivers/scsi/pm8001/pm8001_ctl.c:218:10: note: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11
                   return snprintf(buf, PAGE_SIZE, "%04d\n",
                          ^~~~~~~~
   drivers/scsi/pm8001/pm8001_ctl.c:222:10: warning: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return snprintf(buf, PAGE_SIZE, "%04d\n",
                          ^~~~~~~~
   drivers/scsi/pm8001/pm8001_ctl.c:222:10: note: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11
                   return snprintf(buf, PAGE_SIZE, "%04d\n",
                          ^~~~~~~~
   drivers/scsi/pm8001/pm8001_ctl.c:245:10: warning: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return snprintf(buf, PAGE_SIZE, "%04d\n",
                          ^~~~~~~~
   drivers/scsi/pm8001/pm8001_ctl.c:245:10: note: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11
                   return snprintf(buf, PAGE_SIZE, "%04d\n",
                          ^~~~~~~~
   drivers/scsi/pm8001/pm8001_ctl.c:249:10: warning: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return snprintf(buf, PAGE_SIZE, "%04d\n",
                          ^~~~~~~~
   drivers/scsi/pm8001/pm8001_ctl.c:249:10: note: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11
                   return snprintf(buf, PAGE_SIZE, "%04d\n",
                          ^~~~~~~~
>> drivers/scsi/pm8001/pm8001_ctl.c:266:9: warning: Call to function 'sprin=
tf' is insecure as it does not provide bounding of the memory buffer or sec=
urity checks introduced in the C11 standard. Replace with analogous functio=
ns that support length arguments or provides boundary checks such as 'sprin=
tf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsaf=
eBufferHandling]
                   len =3D sprintf(buf, "%s", "SAS1.1");
                         ^~~~~~~
   drivers/scsi/pm8001/pm8001_ctl.c:266:9: note: Call to function 'sprintf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11
                   len =3D sprintf(buf, "%s", "SAS1.1");
                         ^~~~~~~
   drivers/scsi/pm8001/pm8001_ctl.c:268:10: warning: Call to function 'spri=
ntf' is insecure as it does not provide bounding of the memory buffer or se=
curity checks introduced in the C11 standard. Replace with analogous functi=
ons that support length arguments or provides boundary checks such as 'spri=
ntf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsa=
feBufferHandling]
                   len +=3D sprintf(buf + len, "%s%s", len ? ", " : "", "SA=
S2.0");
                          ^~~~~~~
   drivers/scsi/pm8001/pm8001_ctl.c:268:10: note: Call to function 'sprintf=
' is insecure as it does not provide bounding of the memory buffer or secur=
ity checks introduced in the C11 standard. Replace with analogous functions=
 that support length arguments or provides boundary checks such as 'sprintf=
_s' in case of C11
                   len +=3D sprintf(buf + len, "%s%s", len ? ", " : "", "SA=
S2.0");
                          ^~~~~~~
   drivers/scsi/pm8001/pm8001_ctl.c:269:9: warning: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           len +=3D sprintf(buf + len, "\n");
                  ^~~~~~~
   drivers/scsi/pm8001/pm8001_ctl.c:269:9: note: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11
           len +=3D sprintf(buf + len, "\n");
                  ^~~~~~~
   drivers/scsi/pm8001/pm8001_ctl.c:318:9: warning: Call to function 'snpri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'snprintf_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(buf, PAGE_SIZE, "0x%016llx\n",
                  ^~~~~~~~
   drivers/scsi/pm8001/pm8001_ctl.c:318:9: note: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11
           return snprintf(buf, PAGE_SIZE, "0x%016llx\n",
                  ^~~~~~~~
   drivers/scsi/pm8001/pm8001_ctl.c:339:9: warning: Call to function 'snpri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'snprintf_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(buf, PAGE_SIZE, "%08xh\n", pm8001_ha->logging_le=
vel);
                  ^~~~~~~~
   drivers/scsi/pm8001/pm8001_ctl.c:339:9: note: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11
           return snprintf(buf, PAGE_SIZE, "%08xh\n", pm8001_ha->logging_le=
vel);
                  ^~~~~~~~
   drivers/scsi/pm8001/pm8001_ctl.c:350:6: warning: Call to function 'sscan=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sscanf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (sscanf(buf, "%x", &val) !=3D 1)
               ^~~~~~
   drivers/scsi/pm8001/pm8001_ctl.c:350:6: note: Call to function 'sscanf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sscanf_s' in case of C11
           if (sscanf(buf, "%x", &val) !=3D 1)
               ^~~~~~
   drivers/scsi/pm8001/pm8001_ctl.c:379:10: warning: Call to function 'spri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'sprintf_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   str +=3D sprintf(str, "0x%08x 0x%08x 0x%08x 0x%08x 0x%08=
x 0x%08x"
                          ^~~~~~~
   drivers/scsi/pm8001/pm8001_ctl.c:379:10: note: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11
                   str +=3D sprintf(str, "0x%08x 0x%08x 0x%08x 0x%08x 0x%08=
x 0x%08x"
                          ^~~~~~~
   drivers/scsi/pm8001/pm8001_ctl.c:419:10: warning: Call to function 'spri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'sprintf_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   str +=3D sprintf(str, "0x%08x\n", IB_MEMMAP(start));
                          ^~~~~~~
   drivers/scsi/pm8001/pm8001_ctl.c:419:10: note: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11
                   str +=3D sprintf(str, "0x%08x\n", IB_MEMMAP(start));
                          ^~~~~~~
   drivers/scsi/pm8001/pm8001_ctl.c:456:10: warning: Call to function 'spri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'sprintf_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   str +=3D sprintf(str, "0x%08x\n", OB_MEMMAP(start));
                          ^~~~~~~
   drivers/scsi/pm8001/pm8001_ctl.c:456:10: note: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11
                   str +=3D sprintf(str, "0x%08x\n", OB_MEMMAP(start));
                          ^~~~~~~
   drivers/scsi/pm8001/pm8001_ctl.c:499:10: warning: Call to function 'spri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'sprintf_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   str +=3D sprintf(str, "%c",
                          ^~~~~~~
   drivers/scsi/pm8001/pm8001_ctl.c:499:10: note: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11
                   str +=3D sprintf(str, "%c",
                          ^~~~~~~
   drivers/scsi/pm8001/pm8001_ctl.c:520:9: warning: Call to function 'snpri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'snprintf_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(buf, PAGE_SIZE, "%d\n",
                  ^~~~~~~~
   drivers/scsi/pm8001/pm8001_ctl.c:520:9: note: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11
           return snprintf(buf, PAGE_SIZE, "%d\n",
                  ^~~~~~~~
   drivers/scsi/pm8001/pm8001_ctl.c:556:10: warning: Call to function 'spri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'sprintf_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   str +=3D sprintf(str, "%08x ", *(temp+start));
                          ^~~~~~~
   drivers/scsi/pm8001/pm8001_ctl.c:556:10: note: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11
                   str +=3D sprintf(str, "%08x ", *(temp+start));
                          ^~~~~~~
   drivers/scsi/pm8001/pm8001_ctl.c:607:9: warning: Call to function 'snpri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'snprintf_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(buf, PAGE_SIZE, "%08x",
                  ^~~~~~~~
   drivers/scsi/pm8001/pm8001_ctl.c:607:9: note: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11
           return snprintf(buf, PAGE_SIZE, "%08x",
                  ^~~~~~~~
   drivers/scsi/pm8001/pm8001_ctl.c:701:2: warning: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy((u8 *)&payload->func_specific, (u8 *)pm8001_ha->fw_image-=
>data,
           ^~~~~~
   drivers/scsi/pm8001/pm8001_ctl.c:701:2: note: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11
           memcpy((u8 *)&payload->func_specific, (u8 *)pm8001_ha->fw_image-=
>data,
           ^~~~~~
   drivers/scsi/pm8001/pm8001_ctl.c:764:4: warning: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy((u8 *)fwControl->buffer,
                           ^~~~~~
   drivers/scsi/pm8001/pm8001_ctl.c:764:4: note: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11
                           memcpy((u8 *)fwControl->buffer,
                           ^~~~~~
   drivers/scsi/pm8001/pm8001_ctl.c:770:4: warning: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy((u8 *)fwControl->buffer,
                           ^~~~~~
   drivers/scsi/pm8001/pm8001_ctl.c:770:4: note: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11
                           memcpy((u8 *)fwControl->buffer,
                           ^~~~~~
>> drivers/scsi/pm8001/pm8001_ctl.c:822:8: warning: Call to function 'sscan=
f' is insecure as it does not provide bounding of the memory buffer or secu=
rity checks introduced in the C11 standard. Replace with analogous function=
s that support length arguments or provides boundary checks such as 'sscanf=
_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeB=
ufferHandling]
           res =3D sscanf(buf, "%s %s", cmd_ptr, filename_ptr);
                 ^~~~~~
   drivers/scsi/pm8001/pm8001_ctl.c:822:8: note: Call to function 'sscanf' =
is insecure as it does not provide bounding of the memory buffer or securit=
y checks introduced in the C11 standard. Replace with analogous functions t=
hat support length arguments or provides boundary checks such as 'sscanf_s'=
 in case of C11
           res =3D sscanf(buf, "%s %s", cmd_ptr, filename_ptr);
                 ^~~~~~
   drivers/scsi/pm8001/pm8001_ctl.c:885:9: warning: Call to function 'snpri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'snprintf_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(buf, PAGE_SIZE, "status=3D%x %s\n",
                  ^~~~~~~~
   drivers/scsi/pm8001/pm8001_ctl.c:885:9: note: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11
           return snprintf(buf, PAGE_SIZE, "status=3D%x %s\n",
                  ^~~~~~~~
   Suppressed 48 warnings (48 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   drivers/gpu/drm/nouveau/nvkm/core/subdev.c:179:3: warning: Call to funct=
ion 'snprintf' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'snprintf_s' in case of C11 =
[clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   snprintf(subdev->name, sizeof(subdev->name), "%s%d", nvk=
m_subdev_type[type], inst);
                   ^~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/core/subdev.c:179:3: note: Call to function=
 'snprintf' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'snprintf_s' in case of C11
                   snprintf(subdev->name, sizeof(subdev->name), "%s%d", nvk=
m_subdev_type[type], inst);
                   ^~~~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   50 warnings generated.
   drivers/gpu/drm/nouveau/dispnv50/base907c.c:42:2: warning: Call to funct=
ion 'memcpy' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'memcpy_s' in case of C11 [cla=
ng-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           PUSH_MTHD(push, NV907C, SET_CONTEXT_DMAS_ISO(0), asyw->image.han=
dle, 1);
           ^
   drivers/gpu/drm/nouveau/include/nvif/push.h:356:25: note: expanded from =
macro 'PUSH_MTHD'
   #define PUSH_MTHD(A...) PUSH_NV(NVSQ, ##A)
                           ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/include/nvif/push.h:353:7: note: expanded from m=
acro 'PUSH_NV'
                                     PUSH_NV_1 , PUSH_NV_1)(, ##A)
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/include/nvif/push.h:343:76: note: expanded from =
macro 'PUSH_NV_'
   #define PUSH_NV_(A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,IMPL,..=
.) IMPL
                                                                           =
   ^
   note: (skipping 6 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   drivers/gpu/drm/nouveau/include/nvif/push.h:128:2: note: expanded from m=
acro 'PUSH_1'
           PUSH_##f(X, (p), X##mA, 1, o, (dA), ds, "");                  \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: expanded from here
   drivers/gpu/drm/nouveau/include/nvif/push.h:121:2: note: expanded from m=
acro 'PUSH_DATAp'
           memcpy(_p->cur, (d), _s << 2);                           \
           ^~~~~~
   drivers/gpu/drm/nouveau/dispnv50/base907c.c:42:2: note: Call to function=
 'memcpy' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memcpy_s' in case of C11
           PUSH_MTHD(push, NV907C, SET_CONTEXT_DMAS_ISO(0), asyw->image.han=
dle, 1);
           ^
   drivers/gpu/drm/nouveau/include/nvif/push.h:356:25: note: expanded from =
macro 'PUSH_MTHD'
   #define PUSH_MTHD(A...) PUSH_NV(NVSQ, ##A)
                           ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/include/nvif/push.h:353:7: note: expanded from m=
acro 'PUSH_NV'
                                     PUSH_NV_1 , PUSH_NV_1)(, ##A)
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/include/nvif/push.h:343:76: note: expanded from =
macro 'PUSH_NV_'
   #define PUSH_NV_(A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,IMPL,..=
.) IMPL
                                                                           =
   ^
   note: (skipping 6 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   drivers/gpu/drm/nouveau/include/nvif/push.h:128:2: note: expanded from m=
acro 'PUSH_1'
           PUSH_##f(X, (p), X##mA, 1, o, (dA), ds, "");                  \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: expanded from here
   drivers/gpu/drm/nouveau/include/nvif/push.h:121:2: note: expanded from m=
acro 'PUSH_DATAp'
           memcpy(_p->cur, (d), _s << 2);                           \
           ^~~~~~
   drivers/gpu/drm/nouveau/dispnv50/base907c.c:179:2: warning: Call to func=
tion 'memcpy' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'memcpy_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           PUSH_MTHD(push, NV907C, SET_CSC_RED2RED,
           ^
   drivers/gpu/drm/nouveau/include/nvif/push.h:356:25: note: expanded from =
macro 'PUSH_MTHD'
   #define PUSH_MTHD(A...) PUSH_NV(NVSQ, ##A)
                           ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/include/nvif/push.h:352:7: note: expanded from m=
acro 'PUSH_NV'
                                     PUSH_NV_2 , PUSH_NV_2,        \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/include/nvif/push.h:343:76: note: expanded from =
macro 'PUSH_NV_'
   #define PUSH_NV_(A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,IMPL,..=
.) IMPL
                                                                           =
   ^
   note: (skipping 6 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   drivers/gpu/drm/nouveau/include/nvif/push.h:133:2: note: expanded from m=
acro 'PUSH_2'
           PUSH_##f(X, (p), X##mB, 0, o, (dB), ds, "");                  \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: expanded from here
   drivers/gpu/drm/nouveau/include/nvif/push.h:121:2: note: expanded from m=
acro 'PUSH_DATAp'
           memcpy(_p->cur, (d), _s << 2);                           \
           ^~~~~~
   drivers/gpu/drm/nouveau/dispnv50/base907c.c:179:2: note: Call to functio=
n 'memcpy' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memcpy_s' in case of C11
           PUSH_MTHD(push, NV907C, SET_CSC_RED2RED,
           ^
   drivers/gpu/drm/nouveau/include/nvif/push.h:356:25: note: expanded from =
macro 'PUSH_MTHD'
   #define PUSH_MTHD(A...) PUSH_NV(NVSQ, ##A)

vim +531 drivers/scsi/pm8001/pm8001_init.c

dbf9bfe615717d jack wang             2009-10-14  493  =

dbf9bfe615717d jack wang             2009-10-14  494  /**
dbf9bfe615717d jack wang             2009-10-14  495   * pm8001_pci_alloc -=
 initialize our ha card structure
dbf9bfe615717d jack wang             2009-10-14  496   * @pdev: pci device.
dbf9bfe615717d jack wang             2009-10-14  497   * @ent: ent
dbf9bfe615717d jack wang             2009-10-14  498   * @shost: scsi host =
struct which has been initialized before.
dbf9bfe615717d jack wang             2009-10-14  499   */
6f039790510fd6 Greg Kroah-Hartman    2012-12-21  500  static struct pm8001_=
hba_info *pm8001_pci_alloc(struct pci_dev *pdev,
e590adfd2b35ae Sakthivel K           2013-02-27  501  				 const struct pci=
_device_id *ent,
6f039790510fd6 Greg Kroah-Hartman    2012-12-21  502  				struct Scsi_Host =
*shost)
e590adfd2b35ae Sakthivel K           2013-02-27  503  =

dbf9bfe615717d jack wang             2009-10-14  504  {
dbf9bfe615717d jack wang             2009-10-14  505  	struct pm8001_hba_in=
fo *pm8001_ha;
dbf9bfe615717d jack wang             2009-10-14  506  	struct sas_ha_struct=
 *sha =3D SHOST_TO_SAS_HA(shost);
6cd60b37f72b2d Nikith Ganigarakoppal 2013-11-11  507  	int j;
dbf9bfe615717d jack wang             2009-10-14  508  =

dbf9bfe615717d jack wang             2009-10-14  509  	pm8001_ha =3D sha->l=
ldd_ha;
dbf9bfe615717d jack wang             2009-10-14  510  	if (!pm8001_ha)
dbf9bfe615717d jack wang             2009-10-14  511  		return NULL;
dbf9bfe615717d jack wang             2009-10-14  512  =

dbf9bfe615717d jack wang             2009-10-14  513  	pm8001_ha->pdev =3D =
pdev;
dbf9bfe615717d jack wang             2009-10-14  514  	pm8001_ha->dev =3D &=
pdev->dev;
e590adfd2b35ae Sakthivel K           2013-02-27  515  	pm8001_ha->chip_id =
=3D ent->driver_data;
dbf9bfe615717d jack wang             2009-10-14  516  	pm8001_ha->chip =3D =
&pm8001_chips[pm8001_ha->chip_id];
dbf9bfe615717d jack wang             2009-10-14  517  	pm8001_ha->irq =3D p=
dev->irq;
dbf9bfe615717d jack wang             2009-10-14  518  	pm8001_ha->sas =3D s=
ha;
dbf9bfe615717d jack wang             2009-10-14  519  	pm8001_ha->shost =3D=
 shost;
dbf9bfe615717d jack wang             2009-10-14  520  	pm8001_ha->id =3D pm=
8001_id++;
7370672dc3e7e4 peter chang           2019-11-14  521  	pm8001_ha->logging_l=
evel =3D logging_level;
dba2cc03b9db85 Deepak Ukey           2020-03-16  522  	pm8001_ha->non_fatal=
_count =3D 0;
3e253d9657b06b peter chang           2019-11-14  523  	if (link_rate >=3D 1=
 && link_rate <=3D 15)
3e253d9657b06b peter chang           2019-11-14  524  		pm8001_ha->link_rat=
e =3D (link_rate << 8);
3e253d9657b06b peter chang           2019-11-14  525  	else {
3e253d9657b06b peter chang           2019-11-14  526  		pm8001_ha->link_rat=
e =3D LINKRATE_15 | LINKRATE_30 |
3e253d9657b06b peter chang           2019-11-14  527  			LINKRATE_60 | LINK=
RATE_120;
1b5d2793283dcb Joe Perches           2020-11-20  528  		pm8001_dbg(pm8001_h=
a, FAIL,
1b5d2793283dcb Joe Perches           2020-11-20  529  			   "Setting link r=
ate to default value\n");
3e253d9657b06b peter chang           2019-11-14  530  	}
dbf9bfe615717d jack wang             2009-10-14 @531  	sprintf(pm8001_ha->n=
ame, "%s%d", DRV_NAME, pm8001_ha->id);
f74cf271e69284 Sakthivel K           2013-02-27  532  	/* IOMB size is 128 =
for 8088/89 controllers */
f74cf271e69284 Sakthivel K           2013-02-27  533  	if (pm8001_ha->chip_=
id !=3D chip_8001)
f74cf271e69284 Sakthivel K           2013-02-27  534  		pm8001_ha->iomb_siz=
e =3D IOMB_SIZE_SPCV;
f74cf271e69284 Sakthivel K           2013-02-27  535  	else
f74cf271e69284 Sakthivel K           2013-02-27  536  		pm8001_ha->iomb_siz=
e =3D IOMB_SIZE_SPC;
f74cf271e69284 Sakthivel K           2013-02-27  537  =


:::::: The code at line 531 was first introduced by commit
:::::: dbf9bfe615717d1145f263c0049fe2328e6ed395 [SCSI] pm8001: add SAS/SATA=
 HBA driver

:::::: TO: jack wang <jack_wang@usish.com>
:::::: CC: James Bottomley <James.Bottomley@suse.de>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2856540053824992676==--


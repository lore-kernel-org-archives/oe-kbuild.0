Content-Type: multipart/mixed; boundary="===============7041310042028729330=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/soc/amd/yc/pci-acp6x.c:251:7: warning: The expression is an uninitialized value. The computed value will also be garbage [clang-analyzer-core.uninitialized.Assign]
Date: Wed, 08 Dec 2021 18:58:24 +0800
Message-ID: <202112081736.bx8rAHCS-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7041310042028729330==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   2a987e65025e2b79c6d453b78cb5985ac6e5eb26
commit: 89728d97db3f078aceb967ebe5ed2d0797b6a117 ASoC: amd: enable Yellow c=
arp acp6x drivers build
date:   7 weeks ago
:::::: branch date: 10 hours ago
:::::: commit date: 7 weeks ago
config: x86_64-randconfig-c007-20211205 (https://download.01.org/0day-ci/ar=
chive/20211208/202112081736.bx8rAHCS-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5f1d18=
54eb1450d352663ee732235893c5782237)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D89728d97db3f078aceb967ebe5ed2d0797b6a117
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 89728d97db3f078aceb967ebe5ed2d0797b6a117
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   7 warnings generated.
   Suppressed 7 warnings (6 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
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
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
>> sound/soc/amd/yc/pci-acp6x.c:251:7: warning: The expression is an uninit=
ialized value. The computed value will also be garbage [clang-analyzer-core=
.uninitialized.Assign]
           for (--index; index >=3D 0; index--)
                ^ ~~~~~
   sound/soc/amd/yc/pci-acp6x.c:149:11: note: 'index' declared without an i=
nitial value
           int ret, index;
                    ^~~~~
   sound/soc/amd/yc/pci-acp6x.c:156:6: note: Assuming field 'revision' is e=
qual to 96
           if (pci->revision !=3D 0x60)
               ^~~~~~~~~~~~~~~~~~~~~
   sound/soc/amd/yc/pci-acp6x.c:156:2: note: Taking false branch
           if (pci->revision !=3D 0x60)
           ^
   sound/soc/amd/yc/pci-acp6x.c:159:6: note: Assuming the condition is false
           if (pci_enable_device(pci)) {
               ^~~~~~~~~~~~~~~~~~~~~~
   sound/soc/amd/yc/pci-acp6x.c:159:2: note: Taking false branch
           if (pci_enable_device(pci)) {
           ^
   sound/soc/amd/yc/pci-acp6x.c:165:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0) {
               ^~~~~~~
   sound/soc/amd/yc/pci-acp6x.c:165:2: note: Taking false branch
           if (ret < 0) {
           ^
   sound/soc/amd/yc/pci-acp6x.c:172:6: note: Assuming 'adata' is non-null
           if (!adata) {
               ^~~~~~
   sound/soc/amd/yc/pci-acp6x.c:172:2: note: Taking false branch
           if (!adata) {
           ^
   sound/soc/amd/yc/pci-acp6x.c:179:7: note: Assuming field 'end' is equal =
to 0
                                            pci_resource_len(pci, 0));
                                            ^
   include/linux/pci.h:1932:4: note: expanded from macro 'pci_resource_len'
           ((pci_resource_end((dev), (bar)) =3D=3D 0) ? 0 :    \
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pci.h:1929:36: note: expanded from macro 'pci_resource_end'
   #define pci_resource_end(dev, bar)      ((dev)->resource[(bar)].end)
                                           ^
   sound/soc/amd/yc/pci-acp6x.c:179:7: note: '?' condition is true
                                            pci_resource_len(pci, 0));
                                            ^
   include/linux/pci.h:1932:3: note: expanded from macro 'pci_resource_len'
           ((pci_resource_end((dev), (bar)) =3D=3D 0) ? 0 :    \
            ^
   sound/soc/amd/yc/pci-acp6x.c:180:6: note: Assuming field 'acp6x_base' is=
 non-null
           if (!adata->acp6x_base) {
               ^~~~~~~~~~~~~~~~~~
   sound/soc/amd/yc/pci-acp6x.c:180:2: note: Taking false branch
           if (!adata->acp6x_base) {
           ^
   sound/soc/amd/yc/pci-acp6x.c:186:8: note: Calling 'acp6x_init'
           ret =3D acp6x_init(adata->acp6x_base);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/amd/yc/pci-acp6x.c:91:6: note: Assuming 'ret' is 0
           if (ret) {
               ^~~
   sound/soc/amd/yc/pci-acp6x.c:91:2: note: Taking false branch
           if (ret) {
           ^
   sound/soc/amd/yc/pci-acp6x.c:98:6: note: Assuming 'ret' is 0
           if (ret) {
               ^~~
   sound/soc/amd/yc/pci-acp6x.c:98:2: note: Taking false branch
           if (ret) {
           ^
   sound/soc/amd/yc/pci-acp6x.c:104:2: note: Returning zero, which particip=
ates in a condition later
           return 0;
           ^~~~~~~~
   sound/soc/amd/yc/pci-acp6x.c:186:8: note: Returning from 'acp6x_init'
           ret =3D acp6x_init(adata->acp6x_base);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/amd/yc/pci-acp6x.c:187:6: note: 'ret' is 0
           if (ret)
               ^~~
   sound/soc/amd/yc/pci-acp6x.c:187:2: note: Taking false branch
           if (ret)
           ^
   sound/soc/amd/yc/pci-acp6x.c:190:2: note: Control jumps to 'case ACP_CON=
FIG_15:'  at line 196
           switch (val) {
           ^
   sound/soc/amd/yc/pci-acp6x.c:197:3: note: Loop condition is false.  Exit=
ing loop
                   dev_info(&pci->dev, "Audio Mode %d\n", val);
                   ^
   include/linux/dev_printk.h:150:2: note: expanded from macro 'dev_info'
           dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), #=
#__VA_ARGS__)
           ^
   include/linux/dev_printk.h:109:3: note: expanded from macro 'dev_printk_=
index_wrap'
                   dev_printk_index_emit(level, fmt);                      \
                   ^
   include/linux/dev_printk.h:105:2: note: expanded from macro 'dev_printk_=
index_emit'
           printk_index_subsys_emit("%s %s: ", level, fmt)
           ^
   include/linux/printk.h:413:2: note: expanded from macro 'printk_index_su=
bsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   sound/soc/amd/yc/pci-acp6x.c:198:3: note:  Execution continues on line 2=
38
                   break;
--
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (6 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   sound/soc/codecs/ak4613.c:402:2: warning: Value stored to 'fmt_ctrl' is =
never read [clang-analyzer-deadcode.DeadStores]
           fmt_ctrl =3D NO_FMT;
           ^
   sound/soc/codecs/ak4613.c:402:2: note: Value stored to 'fmt_ctrl' is nev=
er read
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
>> sound/soc/amd/yc/acp6x-pdm-dma.c:54:2: warning: Value stored to 'pdm_ctr=
l' is never read [clang-analyzer-deadcode.DeadStores]
           pdm_ctrl =3D 0x00;
           ^          ~~~~
   sound/soc/amd/yc/acp6x-pdm-dma.c:54:2: note: Value stored to 'pdm_ctrl' =
is never read
           pdm_ctrl =3D 0x00;
           ^          ~~~~
>> sound/soc/amd/yc/acp6x-pdm-dma.c:121:2: warning: Value stored to 'pdm_en=
able' is never read [clang-analyzer-deadcode.DeadStores]
           pdm_enable =3D 0x00;
           ^            ~~~~
   sound/soc/amd/yc/acp6x-pdm-dma.c:121:2: note: Value stored to 'pdm_enabl=
e' is never read
           pdm_enable =3D 0x00;
           ^            ~~~~
>> sound/soc/amd/yc/acp6x-pdm-dma.c:122:2: warning: Value stored to 'pdm_dm=
a_enable' is never read [clang-analyzer-deadcode.DeadStores]
           pdm_dma_enable  =3D 0x00;
           ^                 ~~~~
   sound/soc/amd/yc/acp6x-pdm-dma.c:122:2: note: Value stored to 'pdm_dma_e=
nable' is never read
           pdm_dma_enable  =3D 0x00;
           ^                 ~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   sound/soc/intel/atom/sst-atom-controls.c:145:2: warning: Call to functio=
n 'strcpy' is insecure as it does not provide bounding of the memory buffer=
. Replace unbounded copy functions with analogous functions that support le=
ngth arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecure=
API.strcpy]
           strcpy(uinfo->value.enumerated.name,
           ^~~~~~
   sound/soc/intel/atom/sst-atom-controls.c:145:2: note: Call to function '=
strcpy' is insecure as it does not provide bounding of the memory buffer. R=
eplace unbounded copy functions with analogous functions that support lengt=
h arguments such as 'strlcpy'. CWE-119
           strcpy(uinfo->value.enumerated.name,
           ^~~~~~
   sound/soc/intel/atom/sst-atom-controls.c:442:28: warning: Value stored t=
o 'component' during its initialization is never read [clang-analyzer-deadc=
ode.DeadStores]
           struct snd_soc_component *component =3D snd_kcontrol_chip(kcontr=
ol);
                                     ^~~~~~~~~
   sound/soc/intel/atom/sst-atom-controls.c:442:28: note: Value stored to '=
component' during its initialization is never read
           struct snd_soc_component *component =3D snd_kcontrol_chip(kcontr=
ol);
                                     ^~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   sound/hda/intel-dsp-config.c:29:8: warning: Excessive padding in 'struct=
 config_entry' (8 padding bytes, where 0 is optimal). =

   Optimal fields order: =

   dmi_table, =

   flags, =

   device, =

   acpi_hid, =

   codec_hid, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct config_entry {
   ~~~~~~~^~~~~~~~~~~~~~
   sound/hda/intel-dsp-config.c:29:8: note: Excessive padding in 'struct co=
nfig_entry' (8 padding bytes, where 0 is optimal). Optimal fields order: dm=
i_table, flags, device, acpi_hid, codec_hid, consider reordering the fields=
 or adding explicit padding members
   struct config_entry {
   ~~~~~~~^~~~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/media/dvb-frontends/mb86a20s.c:877:3: warning: Value stored to '=
rc' is never read [clang-analyzer-deadcode.DeadStores]
                   rc =3D mb86a20s_writereg(state, 0x52, 0x00);
                   ^
   drivers/media/dvb-frontends/mb86a20s.c:877:3: note: Value stored to 'rc'=
 is never read
   drivers/media/dvb-frontends/mb86a20s.c:903:3: warning: Value stored to '=
rc' is never read [clang-analyzer-deadcode.DeadStores]
                   rc =3D mb86a20s_writereg(state, 0x52, 0x01);
                   ^
   drivers/media/dvb-frontends/mb86a20s.c:903:3: note: Value stored to 'rc'=
 is never read
   drivers/media/dvb-frontends/mb86a20s.c:1011:3: warning: Value stored to =
'rc' is never read [clang-analyzer-deadcode.DeadStores]
                   rc =3D mb86a20s_writereg(state, 0x5e, 0x00);

vim +251 sound/soc/amd/yc/pci-acp6x.c

cc0deaa2dc7300 Vijendar Mukunda 2021-10-18  143  =

c62442bd5d9f86 Vijendar Mukunda 2021-10-18  144  static int snd_acp6x_probe=
(struct pci_dev *pci,
c62442bd5d9f86 Vijendar Mukunda 2021-10-18  145  			   const struct pci_dev=
ice_id *pci_id)
c62442bd5d9f86 Vijendar Mukunda 2021-10-18  146  {
c62442bd5d9f86 Vijendar Mukunda 2021-10-18  147  	struct acp6x_dev_data *ad=
ata;
fc329c1de49825 Vijendar Mukunda 2021-10-18  148  	struct platform_device_in=
fo pdevinfo[ACP6x_DEVS];
fc329c1de49825 Vijendar Mukunda 2021-10-18  149  	int ret, index;
fc329c1de49825 Vijendar Mukunda 2021-10-18  150  	int val =3D 0x00;
c62442bd5d9f86 Vijendar Mukunda 2021-10-18  151  	u32 addr;
cc0deaa2dc7300 Vijendar Mukunda 2021-10-18  152  	unsigned int irqflags;
c62442bd5d9f86 Vijendar Mukunda 2021-10-18  153  =

cc0deaa2dc7300 Vijendar Mukunda 2021-10-18  154  	irqflags =3D IRQF_SHARED;
c62442bd5d9f86 Vijendar Mukunda 2021-10-18  155  	/* Yellow Carp device che=
ck */
c62442bd5d9f86 Vijendar Mukunda 2021-10-18  156  	if (pci->revision !=3D 0x=
60)
c62442bd5d9f86 Vijendar Mukunda 2021-10-18  157  		return -ENODEV;
c62442bd5d9f86 Vijendar Mukunda 2021-10-18  158  =

c62442bd5d9f86 Vijendar Mukunda 2021-10-18  159  	if (pci_enable_device(pci=
)) {
c62442bd5d9f86 Vijendar Mukunda 2021-10-18  160  		dev_err(&pci->dev, "pci_=
enable_device failed\n");
c62442bd5d9f86 Vijendar Mukunda 2021-10-18  161  		return -ENODEV;
c62442bd5d9f86 Vijendar Mukunda 2021-10-18  162  	}
c62442bd5d9f86 Vijendar Mukunda 2021-10-18  163  =

c62442bd5d9f86 Vijendar Mukunda 2021-10-18  164  	ret =3D pci_request_regio=
ns(pci, "AMD ACP3x audio");
c62442bd5d9f86 Vijendar Mukunda 2021-10-18  165  	if (ret < 0) {
c62442bd5d9f86 Vijendar Mukunda 2021-10-18  166  		dev_err(&pci->dev, "pci_=
request_regions failed\n");
c62442bd5d9f86 Vijendar Mukunda 2021-10-18  167  		goto disable_pci;
c62442bd5d9f86 Vijendar Mukunda 2021-10-18  168  	}
c62442bd5d9f86 Vijendar Mukunda 2021-10-18  169  =

c62442bd5d9f86 Vijendar Mukunda 2021-10-18  170  	adata =3D devm_kzalloc(&p=
ci->dev, sizeof(struct acp6x_dev_data),
c62442bd5d9f86 Vijendar Mukunda 2021-10-18  171  			     GFP_KERNEL);
c62442bd5d9f86 Vijendar Mukunda 2021-10-18  172  	if (!adata) {
c62442bd5d9f86 Vijendar Mukunda 2021-10-18  173  		ret =3D -ENOMEM;
c62442bd5d9f86 Vijendar Mukunda 2021-10-18  174  		goto release_regions;
c62442bd5d9f86 Vijendar Mukunda 2021-10-18  175  	}
c62442bd5d9f86 Vijendar Mukunda 2021-10-18  176  =

c62442bd5d9f86 Vijendar Mukunda 2021-10-18  177  	addr =3D pci_resource_sta=
rt(pci, 0);
c62442bd5d9f86 Vijendar Mukunda 2021-10-18  178  	adata->acp6x_base =3D dev=
m_ioremap(&pci->dev, addr,
c62442bd5d9f86 Vijendar Mukunda 2021-10-18  179  					 pci_resource_len(pci=
, 0));
c62442bd5d9f86 Vijendar Mukunda 2021-10-18  180  	if (!adata->acp6x_base) {
c62442bd5d9f86 Vijendar Mukunda 2021-10-18  181  		ret =3D -ENOMEM;
c62442bd5d9f86 Vijendar Mukunda 2021-10-18  182  		goto release_regions;
c62442bd5d9f86 Vijendar Mukunda 2021-10-18  183  	}
c62442bd5d9f86 Vijendar Mukunda 2021-10-18  184  	pci_set_master(pci);
c62442bd5d9f86 Vijendar Mukunda 2021-10-18  185  	pci_set_drvdata(pci, adat=
a);
8c7161f2c97b2d Vijendar Mukunda 2021-10-18  186  	ret =3D acp6x_init(adata-=
>acp6x_base);
8c7161f2c97b2d Vijendar Mukunda 2021-10-18  187  	if (ret)
8c7161f2c97b2d Vijendar Mukunda 2021-10-18  188  		goto release_regions;
fc329c1de49825 Vijendar Mukunda 2021-10-18  189  	val =3D acp6x_readl(adata=
->acp6x_base + ACP_PIN_CONFIG);
fc329c1de49825 Vijendar Mukunda 2021-10-18  190  	switch (val) {
fc329c1de49825 Vijendar Mukunda 2021-10-18  191  	case ACP_CONFIG_0:
fc329c1de49825 Vijendar Mukunda 2021-10-18  192  	case ACP_CONFIG_1:
fc329c1de49825 Vijendar Mukunda 2021-10-18  193  	case ACP_CONFIG_2:
fc329c1de49825 Vijendar Mukunda 2021-10-18  194  	case ACP_CONFIG_3:
fc329c1de49825 Vijendar Mukunda 2021-10-18  195  	case ACP_CONFIG_9:
fc329c1de49825 Vijendar Mukunda 2021-10-18  196  	case ACP_CONFIG_15:
fc329c1de49825 Vijendar Mukunda 2021-10-18  197  		dev_info(&pci->dev, "Aud=
io Mode %d\n", val);
fc329c1de49825 Vijendar Mukunda 2021-10-18  198  		break;
fc329c1de49825 Vijendar Mukunda 2021-10-18  199  	default:
fc329c1de49825 Vijendar Mukunda 2021-10-18  200  		adata->res =3D devm_kzal=
loc(&pci->dev,
fc329c1de49825 Vijendar Mukunda 2021-10-18  201  					  sizeof(struct resou=
rce),
fc329c1de49825 Vijendar Mukunda 2021-10-18  202  					  GFP_KERNEL);
fc329c1de49825 Vijendar Mukunda 2021-10-18  203  		if (!adata->res) {
fc329c1de49825 Vijendar Mukunda 2021-10-18  204  			ret =3D -ENOMEM;
fc329c1de49825 Vijendar Mukunda 2021-10-18  205  			goto de_init;
fc329c1de49825 Vijendar Mukunda 2021-10-18  206  		}
fc329c1de49825 Vijendar Mukunda 2021-10-18  207  =

fc329c1de49825 Vijendar Mukunda 2021-10-18  208  		adata->res->name =3D "ac=
p_iomem";
fc329c1de49825 Vijendar Mukunda 2021-10-18  209  		adata->res->flags =3D IO=
RESOURCE_MEM;
fc329c1de49825 Vijendar Mukunda 2021-10-18  210  		adata->res->start =3D ad=
dr;
fc329c1de49825 Vijendar Mukunda 2021-10-18  211  		adata->res->end =3D addr=
 + (ACP6x_REG_END - ACP6x_REG_START);
fc329c1de49825 Vijendar Mukunda 2021-10-18  212  =

fc329c1de49825 Vijendar Mukunda 2021-10-18  213  		adata->acp6x_audio_mode =
=3D ACP6x_PDM_MODE;
fc329c1de49825 Vijendar Mukunda 2021-10-18  214  =

fc329c1de49825 Vijendar Mukunda 2021-10-18  215  		memset(&pdevinfo, 0, siz=
eof(pdevinfo));
fc329c1de49825 Vijendar Mukunda 2021-10-18  216  		pdevinfo[0].name =3D "ac=
p_yc_pdm_dma";
fc329c1de49825 Vijendar Mukunda 2021-10-18  217  		pdevinfo[0].id =3D 0;
fc329c1de49825 Vijendar Mukunda 2021-10-18  218  		pdevinfo[0].parent =3D &=
pci->dev;
fc329c1de49825 Vijendar Mukunda 2021-10-18  219  		pdevinfo[0].num_res =3D =
1;
fc329c1de49825 Vijendar Mukunda 2021-10-18  220  		pdevinfo[0].res =3D adat=
a->res;
8c7161f2c97b2d Vijendar Mukunda 2021-10-18  221  =

fc329c1de49825 Vijendar Mukunda 2021-10-18  222  		pdevinfo[1].name =3D "dm=
ic-codec";
fc329c1de49825 Vijendar Mukunda 2021-10-18  223  		pdevinfo[1].id =3D 0;
fc329c1de49825 Vijendar Mukunda 2021-10-18  224  		pdevinfo[1].parent =3D &=
pci->dev;
fc329c1de49825 Vijendar Mukunda 2021-10-18  225  =

fc329c1de49825 Vijendar Mukunda 2021-10-18  226  		for (index =3D 0; index =
< ACP6x_DEVS; index++) {
fc329c1de49825 Vijendar Mukunda 2021-10-18  227  			adata->pdev[index] =3D
fc329c1de49825 Vijendar Mukunda 2021-10-18  228  				platform_device_regist=
er_full(&pdevinfo[index]);
fc329c1de49825 Vijendar Mukunda 2021-10-18  229  			if (IS_ERR(adata->pdev[=
index])) {
fc329c1de49825 Vijendar Mukunda 2021-10-18  230  				dev_err(&pci->dev, "ca=
nnot register %s device\n",
fc329c1de49825 Vijendar Mukunda 2021-10-18  231  					pdevinfo[index].name);
fc329c1de49825 Vijendar Mukunda 2021-10-18  232  				ret =3D PTR_ERR(adata-=
>pdev[index]);
fc329c1de49825 Vijendar Mukunda 2021-10-18  233  				goto unregister_devs;
fc329c1de49825 Vijendar Mukunda 2021-10-18  234  			}
fc329c1de49825 Vijendar Mukunda 2021-10-18  235  		}
fc329c1de49825 Vijendar Mukunda 2021-10-18  236  		break;
fc329c1de49825 Vijendar Mukunda 2021-10-18  237  	}
cc0deaa2dc7300 Vijendar Mukunda 2021-10-18  238  	ret =3D devm_request_irq(=
&pci->dev, pci->irq, acp6x_irq_handler,
cc0deaa2dc7300 Vijendar Mukunda 2021-10-18  239  			       irqflags, "ACP_P=
CI_IRQ", adata);
cc0deaa2dc7300 Vijendar Mukunda 2021-10-18  240  	if (ret) {
cc0deaa2dc7300 Vijendar Mukunda 2021-10-18  241  		dev_err(&pci->dev, "ACP =
PCI IRQ request failed\n");
cc0deaa2dc7300 Vijendar Mukunda 2021-10-18  242  		goto unregister_devs;
cc0deaa2dc7300 Vijendar Mukunda 2021-10-18  243  	}
c8212df7bc0f2e Vijendar Mukunda 2021-10-18  244  	pm_runtime_set_autosuspen=
d_delay(&pci->dev, ACP_SUSPEND_DELAY_MS);
c8212df7bc0f2e Vijendar Mukunda 2021-10-18  245  	pm_runtime_use_autosuspen=
d(&pci->dev);
c8212df7bc0f2e Vijendar Mukunda 2021-10-18  246  	pm_runtime_put_noidle(&pc=
i->dev);
c8212df7bc0f2e Vijendar Mukunda 2021-10-18  247  	pm_runtime_allow(&pci->de=
v);
c8212df7bc0f2e Vijendar Mukunda 2021-10-18  248  =

c62442bd5d9f86 Vijendar Mukunda 2021-10-18  249  	return 0;
fc329c1de49825 Vijendar Mukunda 2021-10-18  250  unregister_devs:
fc329c1de49825 Vijendar Mukunda 2021-10-18 @251  	for (--index; index >=3D =
0; index--)
fc329c1de49825 Vijendar Mukunda 2021-10-18  252  		platform_device_unregist=
er(adata->pdev[index]);
fc329c1de49825 Vijendar Mukunda 2021-10-18  253  de_init:
fc329c1de49825 Vijendar Mukunda 2021-10-18  254  	if (acp6x_deinit(adata->a=
cp6x_base))
fc329c1de49825 Vijendar Mukunda 2021-10-18  255  		dev_err(&pci->dev, "ACP =
de-init failed\n");
c62442bd5d9f86 Vijendar Mukunda 2021-10-18  256  release_regions:
c62442bd5d9f86 Vijendar Mukunda 2021-10-18  257  	pci_release_regions(pci);
c62442bd5d9f86 Vijendar Mukunda 2021-10-18  258  disable_pci:
c62442bd5d9f86 Vijendar Mukunda 2021-10-18  259  	pci_disable_device(pci);
c62442bd5d9f86 Vijendar Mukunda 2021-10-18  260  =

c62442bd5d9f86 Vijendar Mukunda 2021-10-18  261  	return ret;
c62442bd5d9f86 Vijendar Mukunda 2021-10-18  262  }
c62442bd5d9f86 Vijendar Mukunda 2021-10-18  263  =


:::::: The code at line 251 was first introduced by commit
:::::: fc329c1de49825a30d5381e18316a3fd45aac7a9 ASoC: amd: add platform dev=
ices for acp6x pdm driver and dmic driver

:::::: TO: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
:::::: CC: Mark Brown <broonie@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7041310042028729330==--


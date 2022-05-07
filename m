Content-Type: multipart/mixed; boundary="===============6827787793099180651=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [cxl:preview 59/78] drivers/cxl/region.c:311:26: warning: Value stored to 'parent_port' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Sat, 07 May 2022 14:33:48 +0800
Message-ID: <202205071443.pBFp82CT-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6827787793099180651==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Alison Schofield <alison.schofield@intel.com>
CC: Vishal Verma <vishal.l.verma@intel.com>
CC: Ira Weiny <ira.weiny@intel.com>
CC: Ben Widawsky <ben.widawsky@intel.com>
CC: Dan Williams <dan.j.williams@intel.com>
CC: linux-kernel(a)vger.kernel.org
TO: Ben Widawsky <ben.widawsky@intel.com>
CC: Dan Williams <dan.j.williams@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git preview
head:   9b688fc651b9d2b633e8d959454670aba1c39162
commit: 8ed598d187016cd88ab1de9034000ddc59c10c98 [59/78] cxl/region: HB por=
t config verification
:::::: branch date: 2 months ago
:::::: commit date: 3 months ago
config: riscv-randconfig-c006-20220504 (https://download.01.org/0day-ci/arc=
hive/20220507/202205071443.pBFp82CT-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5e004f=
b787698440a387750db7f8028e7cb14cfc)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git/commi=
t/?id=3D8ed598d187016cd88ab1de9034000ddc59c10c98
        git remote add cxl https://git.kernel.org/pub/scm/linux/kernel/git/=
cxl/cxl.git
        git fetch --no-tags cxl preview
        git checkout 8ed598d187016cd88ab1de9034000ddc59c10c98
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   drivers/cxl/region.c:283:10: note: The result of the left shift is undef=
ined due to shifting by '229', which is greater or equal to the width of ty=
pe 'int'
           if (((1 << (rootd_ig - cxlr_ig)) * (1 << rootd_eniw)) > cxlr_iw)=
 {
                   ^  ~~~~~~~~~~~~~~~~~~~~
   drivers/cxl/region.c:283:10: warning: The result of the left shift is un=
defined due to shifting by '230', which is greater or equal to the width of=
 type 'int' [clang-analyzer-core.UndefinedBinaryOperatorResult]
           if (((1 << (rootd_ig - cxlr_ig)) * (1 << rootd_eniw)) > cxlr_iw)=
 {
                   ^
   drivers/cxl/region.c:490:6: note: Assuming the condition is false
           if (!is_root_decoder(dev))
               ^~~~~~~~~~~~~~~~~~~~~
   drivers/cxl/region.c:490:2: note: Taking false branch
           if (!is_root_decoder(dev))
           ^
   drivers/cxl/region.c:493:11: note: Calling 'rootd_valid'
           return !!rootd_valid(cxlr, to_cxl_decoder(dev));
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/cxl/region.c:461:2: note: Taking false branch
           if (!qtg_match(rootd, endpoint))
           ^
   drivers/cxl/region.c:464:7: note: Assuming the condition is true
           if (!cxl_is_pmem_t3(rootd->flags))
                ^
   drivers/cxl/cxl.h:241:3: note: expanded from macro 'cxl_is_pmem_t3'
           (((flags) & (CXL_DECODER_F_TYPE3 | CXL_DECODER_F_PMEM)) =3D=3D  =
           \
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   drivers/cxl/region.c:464:2: note: Taking false branch
           if (!cxl_is_pmem_t3(rootd->flags))
           ^
   drivers/cxl/region.c:467:7: note: Calling 'region_xhb_config_valid'
           if (!region_xhb_config_valid(cxlr, rootd))
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/cxl/region.c:262:32: note: Assuming 'i' is not equal to 0
           if (dev_WARN_ONCE(&cxlr->dev, i =3D=3D 0, "Cannot find a valid h=
ost bridge\n"))
                                         ^
   include/linux/dev_printk.h:274:12: note: expanded from macro 'dev_WARN_O=
NCE'
           WARN_ONCE(condition, "%s %s: " format, \
                     ^~~~~~~~~
   include/asm-generic/bug.h:150:18: note: expanded from macro 'WARN_ONCE'
           DO_ONCE_LITE_IF(condition, WARN, 1, format)
                           ^~~~~~~~~
   include/linux/once_lite.h:15:27: note: expanded from macro 'DO_ONCE_LITE=
_IF'
                   bool __ret_do_once =3D !!(condition);                   =
  \
                                           ^~~~~~~~~
   drivers/cxl/region.c:262:6: note: '__ret_do_once' is false
           if (dev_WARN_ONCE(&cxlr->dev, i =3D=3D 0, "Cannot find a valid h=
ost bridge\n"))
               ^
   include/linux/dev_printk.h:274:2: note: expanded from macro 'dev_WARN_ON=
CE'
           WARN_ONCE(condition, "%s %s: " format, \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:150:2: note: expanded from macro 'WARN_ONCE'
           DO_ONCE_LITE_IF(condition, WARN, 1, format)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/once_lite.h:17:16: note: expanded from macro 'DO_ONCE_LITE=
_IF'
                   if (unlikely(__ret_do_once && !__already_done)) {       \
                                ^~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/cxl/region.c:262:6: note: Left side of '&&' is false
           if (dev_WARN_ONCE(&cxlr->dev, i =3D=3D 0, "Cannot find a valid h=
ost bridge\n"))
               ^
   include/linux/dev_printk.h:274:2: note: expanded from macro 'dev_WARN_ON=
CE'
           WARN_ONCE(condition, "%s %s: " format, \
           ^
   include/asm-generic/bug.h:150:2: note: expanded from macro 'WARN_ONCE'
           DO_ONCE_LITE_IF(condition, WARN, 1, format)
           ^
   include/linux/once_lite.h:17:30: note: expanded from macro 'DO_ONCE_LITE=
_IF'
                   if (unlikely(__ret_do_once && !__already_done)) {       \
                                              ^
   drivers/cxl/region.c:262:6: note: Taking false branch
           if (dev_WARN_ONCE(&cxlr->dev, i =3D=3D 0, "Cannot find a valid h=
ost bridge\n"))
               ^
   include/linux/dev_printk.h:274:2: note: expanded from macro 'dev_WARN_ON=
CE'
           WARN_ONCE(condition, "%s %s: " format, \
           ^
   include/asm-generic/bug.h:150:2: note: expanded from macro 'WARN_ONCE'
           DO_ONCE_LITE_IF(condition, WARN, 1, format)
           ^
   include/linux/once_lite.h:17:3: note: expanded from macro 'DO_ONCE_LITE_=
IF'
                   if (unlikely(__ret_do_once && !__already_done)) {       \
                   ^
   drivers/cxl/region.c:262:2: note: Taking false branch
           if (dev_WARN_ONCE(&cxlr->dev, i =3D=3D 0, "Cannot find a valid h=
ost bridge\n"))
           ^
   drivers/cxl/region.c:266:6: note: Assuming 'i' is not equal to 1
           if (i =3D=3D 1)
               ^~~~~~
   drivers/cxl/region.c:266:2: note: Taking false branch
           if (i =3D=3D 1)
           ^
   drivers/cxl/region.c:270:6: note: 'rootd_ig' is >=3D 'cxlr_ig'
           if (rootd_ig < cxlr_ig) {
               ^~~~~~~~
   drivers/cxl/region.c:270:2: note: Taking false branch
           if (rootd_ig < cxlr_ig) {
           ^
   drivers/cxl/region.c:283:10: note: The result of the left shift is undef=
ined due to shifting by '230', which is greater or equal to the width of ty=
pe 'int'
           if (((1 << (rootd_ig - cxlr_ig)) * (1 << rootd_eniw)) > cxlr_iw)=
 {
                   ^  ~~~~~~~~~~~~~~~~~~~~
>> drivers/cxl/region.c:311:26: warning: Value stored to 'parent_port' duri=
ng its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct cxl_port *port, *parent_port =3D port =3D ep->port;
                                   ^~~~~~~~~~~          ~~~~~~~~
   drivers/cxl/region.c:311:26: note: Value stored to 'parent_port' during =
its initialization is never read
           struct cxl_port *port, *parent_port =3D port =3D ep->port;
                                   ^~~~~~~~~~~          ~~~~~~~~
   drivers/cxl/region.c:406:22: warning: The result of the left shift is un=
defined because the right operand is negative [clang-analyzer-core.Undefine=
dBinaryOperatorResult]
                   position_mask =3D (1 << (ilog2(num_root_ports))) - 1;
                                      ^
   drivers/cxl/region.c:490:6: note: Assuming the condition is false
           if (!is_root_decoder(dev))
               ^~~~~~~~~~~~~~~~~~~~~
   drivers/cxl/region.c:490:2: note: Taking false branch
           if (!is_root_decoder(dev))
           ^
   drivers/cxl/region.c:493:11: note: Calling 'rootd_valid'
           return !!rootd_valid(cxlr, to_cxl_decoder(dev));
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/cxl/region.c:461:2: note: Taking false branch
           if (!qtg_match(rootd, endpoint))
           ^
   drivers/cxl/region.c:464:7: note: Assuming the condition is true
           if (!cxl_is_pmem_t3(rootd->flags))
                ^
   drivers/cxl/cxl.h:241:3: note: expanded from macro 'cxl_is_pmem_t3'
           (((flags) & (CXL_DECODER_F_TYPE3 | CXL_DECODER_F_PMEM)) =3D=3D  =
           \
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   drivers/cxl/region.c:464:2: note: Taking false branch
           if (!cxl_is_pmem_t3(rootd->flags))
           ^
   drivers/cxl/region.c:467:2: note: Taking false branch
           if (!region_xhb_config_valid(cxlr, rootd))
           ^
   drivers/cxl/region.c:470:7: note: Calling 'region_hb_rp_config_valid'
           if (!region_hb_rp_config_valid(cxlr, rootd))
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/cxl/region.c:382:2: note: Taking false branch
           if (has_switch(cxlr))
           ^
   drivers/cxl/region.c:389:6: note: 'num_root_ports' is not equal to 1
           if (num_root_ports =3D=3D 1 && !has_switch(cxlr))
               ^~~~~~~~~~~~~~
   drivers/cxl/region.c:389:26: note: Left side of '&&' is false
           if (num_root_ports =3D=3D 1 && !has_switch(cxlr))
                                   ^
   drivers/cxl/region.c:392:2: note: Loop condition is true.  Entering loop=
 body
           for (i =3D 0; i < hb_count; i++) {
           ^
   drivers/cxl/region.c:406:26: note: '?' condition is false
                   position_mask =3D (1 << (ilog2(num_root_ports))) - 1;
                                          ^
   include/linux/log2.h:158:2: note: expanded from macro 'ilog2'
           __builtin_constant_p(n) ?       \
           ^
   drivers/cxl/region.c:406:26: note: '?' condition is true
                   position_mask =3D (1 << (ilog2(num_root_ports))) - 1;
                                          ^
   include/linux/log2.h:161:2: note: expanded from macro 'ilog2'
           (sizeof(n) <=3D 4) ?              \
           ^
   drivers/cxl/region.c:406:26: note: Calling '__ilog2_u32'
                   position_mask =3D (1 << (ilog2(num_root_ports))) - 1;
                                          ^
   include/linux/log2.h:162:2: note: expanded from macro 'ilog2'
           __ilog2_u32(n) :                \
           ^~~~~~~~~~~~~~
   include/linux/log2.h:24:2: note: Returning the value -1
           return fls(n) - 1;
           ^~~~~~~~~~~~~~~~~
   drivers/cxl/region.c:406:26: note: Returning from '__ilog2_u32'
                   position_mask =3D (1 << (ilog2(num_root_ports))) - 1;
                                          ^
   include/linux/log2.h:162:2: note: expanded from macro 'ilog2'
           __ilog2_u32(n) :                \
           ^~~~~~~~~~~~~~
   drivers/cxl/region.c:406:22: note: The result of the left shift is undef=
ined because the right operand is negative
                   position_mask =3D (1 << (ilog2(num_root_ports))) - 1;
                                      ^  ~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 13 warnings (6 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   block/blk-mq-cpumap.c:21:33: warning: Division by zero [clang-analyzer-c=
ore.DivideZero]
           return qmap->queue_offset + (q % nr_queues);
                                          ^
   block/blk-mq-cpumap.c:38:2: note: 'nr_queues' initialized here
           unsigned int nr_queues =3D qmap->nr_queues;
           ^~~~~~~~~~~~~~~~~~~~~~
   block/blk-mq-cpumap.c:41:2: note: Assuming 'cpu' is >=3D 'nr_cpu_ids'
           for_each_possible_cpu(cpu)
           ^
   include/linux/cpumask.h:814:36: note: expanded from macro 'for_each_poss=
ible_cpu'
   #define for_each_possible_cpu(cpu) for_each_cpu((cpu), cpu_possible_mask)

vim +/parent_port +311 drivers/cxl/region.c

786e9e58377374 Ben Widawsky 2022-02-11  308  =

8ed598d187016c Ben Widawsky 2022-02-11  309  static struct cxl_dport *get_r=
p(struct cxl_memdev *ep)
8ed598d187016c Ben Widawsky 2022-02-11  310  {
8ed598d187016c Ben Widawsky 2022-02-11 @311  	struct cxl_port *port, *paren=
t_port =3D port =3D ep->port;
8ed598d187016c Ben Widawsky 2022-02-11  312  	struct cxl_dport *dport;
8ed598d187016c Ben Widawsky 2022-02-11  313  =

8ed598d187016c Ben Widawsky 2022-02-11  314  	while (!is_cxl_root(port)) {
8ed598d187016c Ben Widawsky 2022-02-11  315  		parent_port =3D to_cxl_port(=
port->dev.parent);
8ed598d187016c Ben Widawsky 2022-02-11  316  		if (parent_port->depth =3D=
=3D 1)
8ed598d187016c Ben Widawsky 2022-02-11  317  			list_for_each_entry(dport, =
&parent_port->dports, list)
8ed598d187016c Ben Widawsky 2022-02-11  318  				if (dport->dport =3D=3D po=
rt->uport->parent->parent)
8ed598d187016c Ben Widawsky 2022-02-11  319  					return dport;
8ed598d187016c Ben Widawsky 2022-02-11  320  		port =3D parent_port;
8ed598d187016c Ben Widawsky 2022-02-11  321  	}
8ed598d187016c Ben Widawsky 2022-02-11  322  =

8ed598d187016c Ben Widawsky 2022-02-11  323  	BUG();
8ed598d187016c Ben Widawsky 2022-02-11  324  	return NULL;
8ed598d187016c Ben Widawsky 2022-02-11  325  }
8ed598d187016c Ben Widawsky 2022-02-11  326  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6827787793099180651==--


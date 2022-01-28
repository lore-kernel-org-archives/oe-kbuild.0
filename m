Content-Type: multipart/mixed; boundary="===============2892242933741604852=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [cxl:preview 58/60] drivers/cxl/region.c:681:7: warning: Branch condition evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]
Date: Fri, 28 Jan 2022 14:43:22 +0800
Message-ID: <202201281431.wpm0Vrdi-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2892242933741604852==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: Alison Schofield <alison.schofield@intel.com>
CC: Vishal Verma <vishal.l.verma@intel.com>
CC: Ira Weiny <ira.weiny@intel.com>
CC: Ben Widawsky <ben.widawsky@intel.com>
CC: Dan Williams <dan.j.williams@intel.com>
CC: linux-kernel(a)vger.kernel.org
TO: Ben Widawsky <ben.widawsky@intel.com>
CC: Dan Williams <dan.j.williams@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git preview
head:   41c2d219a2c8e14de644f4e953e0c57402c3e884
commit: 4e05d5fdf03a62261ed873c825ddbff6d5e6c9e4 [58/60] cxl: Program decod=
ers for regions
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
config: x86_64-randconfig-c007-20220124 (https://download.01.org/0day-ci/ar=
chive/20220128/202201281431.wpm0Vrdi-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f400a6=
012c668dfaa73462caf067ceb074e66c47)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git/commi=
t/?id=3D4e05d5fdf03a62261ed873c825ddbff6d5e6c9e4
        git remote add cxl https://git.kernel.org/pub/scm/linux/kernel/git/=
cxl/cxl.git
        git fetch --no-tags cxl preview
        git checkout 4e05d5fdf03a62261ed873c825ddbff6d5e6c9e4
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                   ^
   drivers/cxl/region.c:490:5: note: Taking true branch
                                   if (port_grouping =3D=3D -1)
                                   ^
   drivers/cxl/region.c:497:5: note: Taking false branch
                                   if ((idx & position_mask) !=3D port_grou=
ping) {
                                   ^
   drivers/cxl/region.c:503:10: note: 'state_update' is true
                                   if (!state_update)
                                        ^~~~~~~~~~~~
   drivers/cxl/region.c:503:5: note: Taking false branch
                                   if (!state_update)
                                   ^
   drivers/cxl/region.c:507:9: note: Assuming 'port_grouping' is < field 'n=
r_targets'
                                                     port_grouping >=3D cxl=
d->nr_targets,
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
   drivers/cxl/region.c:506:9: note: '__ret_do_once' is false
                                   if (dev_WARN_ONCE(&cxld->dev,
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
   drivers/cxl/region.c:506:9: note: Left side of '&&' is false
                                   if (dev_WARN_ONCE(&cxld->dev,
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
   drivers/cxl/region.c:506:9: note: Taking false branch
                                   if (dev_WARN_ONCE(&cxld->dev,
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
   drivers/cxl/region.c:506:5: note: Taking false branch
                                   if (dev_WARN_ONCE(&cxld->dev,
                                   ^
   drivers/cxl/region.c:519:9: note: Assuming field 'depth' is not equal to=
 2
                                   if (ep->port->depth =3D=3D 2)
                                       ^~~~~~~~~~~~~~~~~~~~
   drivers/cxl/region.c:519:5: note: Taking false branch
                                   if (ep->port->depth =3D=3D 2)
                                   ^
   drivers/cxl/region.c:526:5: note: Loop condition is true.  Entering loop=
 body
                                   list_for_each_entry(switch_cxld, &cxlr->=
staged_list, region_link) {
                                   ^
   include/linux/list.h:638:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/cxl/region.c:527:10: note: Assuming the condition is true
                                           if (to_cxl_port(switch_cxld->dev=
.parent) =3D=3D switch_port)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~
   drivers/cxl/region.c:527:6: note: Taking true branch
                                           if (to_cxl_port(switch_cxld->dev=
.parent) =3D=3D switch_port)
                                           ^
   drivers/cxl/region.c:526:5: note: Loop condition is false. Execution con=
tinues on line 531
                                   list_for_each_entry(switch_cxld, &cxlr->=
staged_list, region_link) {
                                   ^
   include/linux/list.h:638:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/cxl/region.c:531:9: note: 'found' is true
                                   if (found) {
                                       ^~~~~
   drivers/cxl/region.c:531:5: note: Taking true branch
                                   if (found) {
                                   ^
   drivers/cxl/region.c:533:26: note: The expression is an uninitialized va=
lue. The computed value will also be garbage
                                           switch_cxld->target[target_ndx++=
] =3D target;
                                                               ^~~~~~~~~~
>> drivers/cxl/region.c:681:7: warning: Branch condition evaluates to a gar=
bage value [clang-analyzer-core.uninitialized.Branch]
                   if (rc) {
                       ^
   drivers/cxl/region.c:721:6: note: Assuming field 'active' is false
           if (cxlr->active)
               ^~~~~~~~~~~~
   drivers/cxl/region.c:721:2: note: Taking false branch
           if (cxlr->active)
           ^
   drivers/cxl/region.c:724:2: note: Taking false branch
           if (uuid_is_null(&cxlr->config.uuid))
           ^
   drivers/cxl/region.c:730:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/cxl/region.c:730:2: note: Taking false branch
           if (ret)
           ^
   drivers/cxl/region.c:734:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/cxl/region.c:734:2: note: Taking false branch
           if (ret)
           ^
   drivers/cxl/region.c:737:2: note: Taking false branch
           if (!find_cdat_dsmas(cxlr))
           ^
   drivers/cxl/region.c:741:6: note: Assuming 'rootd' is non-null
           if (!rootd) {
               ^~~~~~
   drivers/cxl/region.c:741:2: note: Taking false branch
           if (!rootd) {
           ^
   drivers/cxl/region.c:746:2: note: Taking false branch
           if (!rootd_valid(cxlr, rootd, true)) {
           ^
   drivers/cxl/region.c:753:6: note: 'ours' is not equal to 'rootd'
           if (ours !=3D rootd)
               ^~~~
   drivers/cxl/region.c:753:2: note: Taking true branch
           if (ours !=3D rootd)
           ^
   drivers/cxl/region.c:754:3: note: Taking false branch
                   dev_dbg(dev, "Picked different rootd %s %s\n",
                   ^
   include/linux/dev_printk.h:162:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   drivers/cxl/region.c:756:6: note: 'ours' is null
           if (ours)
               ^~~~
   drivers/cxl/region.c:756:2: note: Taking false branch
           if (ours)
           ^
   drivers/cxl/region.c:760:6: note: 'ret' is 0
           if (ret) {
               ^~~
   drivers/cxl/region.c:760:2: note: Taking false branch
           if (ret) {
           ^
   drivers/cxl/region.c:765:8: note: Calling 'bind_region'
           ret =3D bind_region(cxlr);
                 ^~~~~~~~~~~~~~~~~
   drivers/cxl/region.c:667:2: note: 'rc' declared without an initial value
           int rc;
           ^~~~~~
   drivers/cxl/region.c:669:2: note: Loop condition is false. Execution con=
tinues on line 680
           list_for_each_entry_safe(cxld, d, &cxlr->staged_list, region_lin=
k) {
           ^
   include/linux/list.h:725:2: note: expanded from macro 'list_for_each_ent=
ry_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
           ^
   drivers/cxl/region.c:680:2: note: Loop condition is true.  Entering loop=
 body
           list_for_each_entry_safe(cxld, d, &cxlr->commit_list, region_lin=
k) {
           ^
   include/linux/list.h:725:2: note: expanded from macro 'list_for_each_ent=
ry_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
           ^
   drivers/cxl/region.c:681:7: note: Branch condition evaluates to a garbag=
e value
                   if (rc) {
                       ^~
   drivers/cxl/region.c:687:6: warning: Branch condition evaluates to a gar=
bage value [clang-analyzer-core.uninitialized.Branch]
           if (rc)
               ^
   drivers/cxl/region.c:721:6: note: Assuming field 'active' is false
           if (cxlr->active)
               ^~~~~~~~~~~~
   drivers/cxl/region.c:721:2: note: Taking false branch
           if (cxlr->active)
           ^
   drivers/cxl/region.c:724:2: note: Taking false branch
           if (uuid_is_null(&cxlr->config.uuid))
           ^
   drivers/cxl/region.c:730:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/cxl/region.c:730:2: note: Taking false branch
           if (ret)
           ^
   drivers/cxl/region.c:734:6: note: 'ret' is 0
           if (ret)

vim +681 drivers/cxl/region.c

84dbaed92240cd Ben Widawsky 2021-06-15  663  =

4e05d5fdf03a62 Ben Widawsky 2021-10-12  664  static int bind_region(struct =
cxl_region *cxlr)
84dbaed92240cd Ben Widawsky 2021-06-15  665  {
4e05d5fdf03a62 Ben Widawsky 2021-10-12  666  	struct cxl_decoder *cxld, *d;
4e05d5fdf03a62 Ben Widawsky 2021-10-12  667  	int rc;
4e05d5fdf03a62 Ben Widawsky 2021-10-12  668  =

4e05d5fdf03a62 Ben Widawsky 2021-10-12  669  	list_for_each_entry_safe(cxld=
, d, &cxlr->staged_list, region_link) {
4e05d5fdf03a62 Ben Widawsky 2021-10-12  670  		rc =3D cxl_commit_decoder(cx=
ld);
4e05d5fdf03a62 Ben Widawsky 2021-10-12  671  		if (!rc) {
4e05d5fdf03a62 Ben Widawsky 2021-10-12  672  			list_move_tail(&cxld->regio=
n_link, &cxlr->commit_list);
4e05d5fdf03a62 Ben Widawsky 2021-10-12  673  		} else {
4e05d5fdf03a62 Ben Widawsky 2021-10-12  674  			dev_dbg(&cxlr->dev, "Failed=
 to commit %s\n",
4e05d5fdf03a62 Ben Widawsky 2021-10-12  675  				dev_name(&cxld->dev));
4e05d5fdf03a62 Ben Widawsky 2021-10-12  676  			break;
4e05d5fdf03a62 Ben Widawsky 2021-10-12  677  		}
4e05d5fdf03a62 Ben Widawsky 2021-10-12  678  	}
4e05d5fdf03a62 Ben Widawsky 2021-10-12  679  =

4e05d5fdf03a62 Ben Widawsky 2021-10-12  680  	list_for_each_entry_safe(cxld=
, d, &cxlr->commit_list, region_link) {
4e05d5fdf03a62 Ben Widawsky 2021-10-12 @681  		if (rc) {
4e05d5fdf03a62 Ben Widawsky 2021-10-12  682  			cxl_disable_decoder(cxld);
4e05d5fdf03a62 Ben Widawsky 2021-10-12  683  			list_del(&cxld->region_link=
);
4e05d5fdf03a62 Ben Widawsky 2021-10-12  684  		}
4e05d5fdf03a62 Ben Widawsky 2021-10-12  685  	}
4e05d5fdf03a62 Ben Widawsky 2021-10-12  686  =

4e05d5fdf03a62 Ben Widawsky 2021-10-12  687  	if (rc)
4e05d5fdf03a62 Ben Widawsky 2021-10-12  688  		cleanup_staged_decoders(cxlr=
);
4e05d5fdf03a62 Ben Widawsky 2021-10-12  689  =

4e05d5fdf03a62 Ben Widawsky 2021-10-12  690  	BUG_ON(!list_empty(&cxlr->sta=
ged_list));
4e05d5fdf03a62 Ben Widawsky 2021-10-12  691  	return rc;
4e05d5fdf03a62 Ben Widawsky 2021-10-12  692  }
4e05d5fdf03a62 Ben Widawsky 2021-10-12  693  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2892242933741604852==--


Content-Type: multipart/mixed; boundary="===============7132679400212046359=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/soc/qcom/qdsp6/topology.c:336:18: warning: Access to field 'perf_mode' results in a dereference of an undefined pointer value (loaded from variable 'sg') [clang-analyzer-core.NullDereference]
Date: Wed, 02 Feb 2022 23:12:05 +0800
Message-ID: <202202022336.wpiKPnj0-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7132679400212046359==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
CC: Mark Brown <broonie@kernel.org>
CC: "Pierre-Louis Bossart" <pierre-louis.bossart@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9f7fb8de5d9bac17b6392a14af40baf555d9129b
commit: 36ad9bf1d93d66b901342eab9f8ed6c1537655a6 ASoC: qdsp6: audioreach: a=
dd topology support
date:   3 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 3 months ago
config: arm-randconfig-c002-20220122 (https://download.01.org/0day-ci/archi=
ve/20220202/202202022336.wpiKPnj0-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 7b3d30=
728816403d1fd73cc5082e9fb761262bce)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D36ad9bf1d93d66b901342eab9f8ed6c1537655a6
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 36ad9bf1d93d66b901342eab9f8ed6c1537655a6
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/mtd/maps/physmap-core.c:490:2: note: Taking false branch
           if (IS_ERR(info->gpios))
           ^
   drivers/mtd/maps/physmap-core.c:493:6: note: Assuming field 'gpios' is n=
ull
           if (info->gpios && info->nmaps > 1) {
               ^~~~~~~~~~~
   drivers/mtd/maps/physmap-core.c:493:18: note: Left side of '&&' is false
           if (info->gpios && info->nmaps > 1) {
                           ^
   drivers/mtd/maps/physmap-core.c:499:2: note: Calling 'pm_runtime_get_syn=
c'
           pm_runtime_get_sync(&dev->dev);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pm_runtime.h:393:9: note: Value assigned to field 'of_node=
', which participates in a condition later
           return __pm_runtime_resume(dev, RPM_GET_PUT);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/maps/physmap-core.c:499:2: note: Returning from 'pm_runtime_=
get_sync'
           pm_runtime_get_sync(&dev->dev);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/maps/physmap-core.c:501:6: note: Assuming field 'of_node' is=
 null
           if (dev->dev.of_node)
               ^~~~~~~~~~~~~~~~
   drivers/mtd/maps/physmap-core.c:501:2: note: Taking false branch
           if (dev->dev.of_node)
           ^
   drivers/mtd/maps/physmap-core.c:506:6: note: Assuming 'err' is 0
           if (err) {
               ^~~
   drivers/mtd/maps/physmap-core.c:506:2: note: Taking false branch
           if (err) {
           ^
   drivers/mtd/maps/physmap-core.c:512:14: note: Assuming 'i' is < field 'n=
maps'
           for (i =3D 0; i < info->nmaps; i++) {
                       ^~~~~~~~~~~~~~~
   drivers/mtd/maps/physmap-core.c:512:2: note: Loop condition is true.  En=
tering loop body
           for (i =3D 0; i < info->nmaps; i++) {
           ^
   drivers/mtd/maps/physmap-core.c:517:7: note: Calling 'IS_ERR'
                   if (IS_ERR(info->maps[i].virt)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/err.h:36:9: note: Assuming the condition is false
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:22:34: note: expanded from macro 'IS_ERR_VALUE'
   #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >=3D (unsign=
ed long)-MAX_ERRNO)
                           ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/err.h:36:2: note: Returning zero, which participates in a =
condition later
           return IS_ERR_VALUE((unsigned long)ptr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/maps/physmap-core.c:517:7: note: Returning from 'IS_ERR'
                   if (IS_ERR(info->maps[i].virt)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/maps/physmap-core.c:517:3: note: Taking false branch
                   if (IS_ERR(info->maps[i].virt)) {
                   ^
   drivers/mtd/maps/physmap-core.c:522:3: note: Loop condition is false.  E=
xiting loop
                   dev_notice(&dev->dev, "physmap platform flash device: %p=
R\n",
                   ^
   include/linux/dev_printk.h:148:2: note: expanded from macro 'dev_notice'
           dev_printk_index_wrap(_dev_notice, KERN_NOTICE, dev, dev_fmt(fmt=
), ##__VA_ARGS__)
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
   drivers/mtd/maps/physmap-core.c:525:7: note: Assuming field 'name' is no=
n-null
                   if (!info->maps[i].name)
                       ^~~~~~~~~~~~~~~~~~~
   drivers/mtd/maps/physmap-core.c:525:3: note: Taking false branch
                   if (!info->maps[i].name)
                   ^
   drivers/mtd/maps/physmap-core.c:528:7: note: Assuming field 'phys' is no=
t equal to 0
                   if (!info->maps[i].phys)
                       ^~~~~~~~~~~~~~~~~~~
   drivers/mtd/maps/physmap-core.c:528:3: note: Taking false branch
                   if (!info->maps[i].phys)
                   ^
   drivers/mtd/maps/physmap-core.c:533:14: note: Field 'gpios' is null
                                            (info->gpios ?
                                                   ^
   drivers/mtd/maps/physmap-core.c:533:8: note: '?' condition is false
                                            (info->gpios ?
                                             ^
   drivers/mtd/maps/physmap-core.c:532:24: note: The result of the left shi=
ft is undefined due to shifting by '4294967295', which is greater or equal =
to the width of type 'unsigned long'
                   info->maps[i].size =3D BIT(info->win_order +
                                        ^
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
   #define BIT(nr)                 (UL(1) << (nr))
                                          ^  ~~~~
   7 warnings generated.
>> sound/soc/qcom/qdsp6/topology.c:336:18: warning: Access to field 'perf_m=
ode' results in a dereference of an undefined pointer value (loaded from va=
riable 'sg') [clang-analyzer-core.NullDereference]
                           sg->perf_mode =3D le32_to_cpu(sg_elem->value);
                                         ^
   sound/soc/qcom/qdsp6/topology.c:781:2: note: Control jumps to 'case snd_=
soc_dapm_pga:'  at line 796
           switch (w->id) {
           ^
   sound/soc/qcom/qdsp6/topology.c:797:10: note: Calling 'audioreach_widget=
_load_pga'
                   return audioreach_widget_load_pga(component, index, w, t=
plg_w);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   sound/soc/qcom/qdsp6/topology.c:757:8: note: Calling 'audioreach_widget_=
load_module_common'
           ret =3D audioreach_widget_load_module_common(component, index, w=
, tplg_w);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   sound/soc/qcom/qdsp6/topology.c:498:7: note: Calling 'audioreach_parse_s=
g_tokens'
           sg =3D audioreach_parse_sg_tokens(apm, &tplg_w->priv);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/qcom/qdsp6/topology.c:310:2: note: 'sg' declared without an in=
itial value
           struct audioreach_sub_graph *sg;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/qcom/qdsp6/topology.c:316:2: note: Loop condition is true.  En=
tering loop body
           while (tkn_count <=3D (le32_to_cpu(sg_array->num_elems) - 1)) {
           ^
   sound/soc/qcom/qdsp6/topology.c:317:3: note: Control jumps to 'case 3:' =
 at line 335
                   switch (le32_to_cpu(sg_elem->token)) {
                   ^
   sound/soc/qcom/qdsp6/topology.c:336:18: note: Access to field 'perf_mode=
' results in a dereference of an undefined pointer value (loaded from varia=
ble 'sg')
                           sg->perf_mode =3D le32_to_cpu(sg_elem->value);
                           ~~            ^
>> sound/soc/qcom/qdsp6/topology.c:339:18: warning: Access to field 'direct=
ion' results in a dereference of an undefined pointer value (loaded from va=
riable 'sg') [clang-analyzer-core.NullDereference]
                           sg->direction =3D le32_to_cpu(sg_elem->value);
                                         ^
   sound/soc/qcom/qdsp6/topology.c:781:2: note: Control jumps to 'case snd_=
soc_dapm_pga:'  at line 796
           switch (w->id) {
           ^
   sound/soc/qcom/qdsp6/topology.c:797:10: note: Calling 'audioreach_widget=
_load_pga'
                   return audioreach_widget_load_pga(component, index, w, t=
plg_w);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   sound/soc/qcom/qdsp6/topology.c:757:8: note: Calling 'audioreach_widget_=
load_module_common'
           ret =3D audioreach_widget_load_module_common(component, index, w=
, tplg_w);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   sound/soc/qcom/qdsp6/topology.c:498:7: note: Calling 'audioreach_parse_s=
g_tokens'
           sg =3D audioreach_parse_sg_tokens(apm, &tplg_w->priv);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/qcom/qdsp6/topology.c:310:2: note: 'sg' declared without an in=
itial value
           struct audioreach_sub_graph *sg;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/qcom/qdsp6/topology.c:316:2: note: Loop condition is true.  En=
tering loop body
           while (tkn_count <=3D (le32_to_cpu(sg_array->num_elems) - 1)) {
           ^
   sound/soc/qcom/qdsp6/topology.c:317:3: note: Control jumps to 'case 4:' =
 at line 338
                   switch (le32_to_cpu(sg_elem->token)) {
                   ^
   sound/soc/qcom/qdsp6/topology.c:339:18: note: Access to field 'direction=
' results in a dereference of an undefined pointer value (loaded from varia=
ble 'sg')
                           sg->direction =3D le32_to_cpu(sg_elem->value);
                           ~~            ^
>> sound/soc/qcom/qdsp6/topology.c:342:20: warning: Access to field 'scenar=
io_id' results in a dereference of an undefined pointer value (loaded from =
variable 'sg') [clang-analyzer-core.NullDereference]
                           sg->scenario_id =3D le32_to_cpu(sg_elem->value);
                                           ^
   sound/soc/qcom/qdsp6/topology.c:781:2: note: Control jumps to 'case snd_=
soc_dapm_pga:'  at line 796
           switch (w->id) {
           ^
   sound/soc/qcom/qdsp6/topology.c:797:10: note: Calling 'audioreach_widget=
_load_pga'
                   return audioreach_widget_load_pga(component, index, w, t=
plg_w);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   sound/soc/qcom/qdsp6/topology.c:757:8: note: Calling 'audioreach_widget_=
load_module_common'
           ret =3D audioreach_widget_load_module_common(component, index, w=
, tplg_w);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   sound/soc/qcom/qdsp6/topology.c:498:7: note: Calling 'audioreach_parse_s=
g_tokens'
           sg =3D audioreach_parse_sg_tokens(apm, &tplg_w->priv);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/qcom/qdsp6/topology.c:310:2: note: 'sg' declared without an in=
itial value
           struct audioreach_sub_graph *sg;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/qcom/qdsp6/topology.c:316:2: note: Loop condition is true.  En=
tering loop body
           while (tkn_count <=3D (le32_to_cpu(sg_array->num_elems) - 1)) {
           ^
   sound/soc/qcom/qdsp6/topology.c:317:3: note: Control jumps to 'case 5:' =
 at line 341
                   switch (le32_to_cpu(sg_elem->token)) {
                   ^
   sound/soc/qcom/qdsp6/topology.c:342:20: note: Access to field 'scenario_=
id' results in a dereference of an undefined pointer value (loaded from var=
iable 'sg')
                           sg->scenario_id =3D le32_to_cpu(sg_elem->value);
                           ~~              ^
>> sound/soc/qcom/qdsp6/topology.c:382:24: warning: Access to field 'capabi=
lity_id' results in a dereference of an undefined pointer value (loaded fro=
m variable 'cont') [clang-analyzer-core.NullDereference]
                           cont->capability_id =3D le32_to_cpu(cont_elem->v=
alue);
                                               ^
   sound/soc/qcom/qdsp6/topology.c:781:2: note: Control jumps to 'case snd_=
soc_dapm_pga:'  at line 796
           switch (w->id) {
           ^
   sound/soc/qcom/qdsp6/topology.c:797:10: note: Calling 'audioreach_widget=
_load_pga'
                   return audioreach_widget_load_pga(component, index, w, t=
plg_w);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   sound/soc/qcom/qdsp6/topology.c:757:8: note: Calling 'audioreach_widget_=
load_module_common'
           ret =3D audioreach_widget_load_module_common(component, index, w=
, tplg_w);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   sound/soc/qcom/qdsp6/topology.c:499:2: note: Taking false branch
           if (IS_ERR(sg))
           ^
   sound/soc/qcom/qdsp6/topology.c:502:9: note: Calling 'audioreach_parse_c=
ont_tokens'
           cont =3D audioreach_parse_cont_tokens(apm, sg, &tplg_w->priv);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/qcom/qdsp6/topology.c:366:2: note: 'cont' declared without an =
initial value
           struct audioreach_container *cont;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/qcom/qdsp6/topology.c:373:2: note: Loop condition is true.  En=
tering loop body
           while (tkn_count <=3D (le32_to_cpu(cont_array->num_elems) - 1)) {
           ^
   sound/soc/qcom/qdsp6/topology.c:374:3: note: Control jumps to 'case 101:=
'  at line 381
                   switch (le32_to_cpu(cont_elem->token)) {
                   ^
   sound/soc/qcom/qdsp6/topology.c:382:24: note: Access to field 'capabilit=
y_id' results in a dereference of an undefined pointer value (loaded from v=
ariable 'cont')
                           cont->capability_id =3D le32_to_cpu(cont_elem->v=
alue);
                           ~~~~                ^
>> sound/soc/qcom/qdsp6/topology.c:385:21: warning: Access to field 'stack_=
size' results in a dereference of an undefined pointer value (loaded from v=
ariable 'cont') [clang-analyzer-core.NullDereference]
                           cont->stack_size =3D le32_to_cpu(cont_elem->valu=
e);
                                            ^
   sound/soc/qcom/qdsp6/topology.c:781:2: note: Control jumps to 'case snd_=
soc_dapm_pga:'  at line 796
           switch (w->id) {
           ^
   sound/soc/qcom/qdsp6/topology.c:797:10: note: Calling 'audioreach_widget=
_load_pga'
                   return audioreach_widget_load_pga(component, index, w, t=
plg_w);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   sound/soc/qcom/qdsp6/topology.c:757:8: note: Calling 'audioreach_widget_=
load_module_common'
           ret =3D audioreach_widget_load_module_common(component, index, w=
, tplg_w);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   sound/soc/qcom/qdsp6/topology.c:499:2: note: Taking false branch
           if (IS_ERR(sg))
           ^
   sound/soc/qcom/qdsp6/topology.c:502:9: note: Calling 'audioreach_parse_c=
ont_tokens'
           cont =3D audioreach_parse_cont_tokens(apm, sg, &tplg_w->priv);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/qcom/qdsp6/topology.c:366:2: note: 'cont' declared without an =
initial value
           struct audioreach_container *cont;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/qcom/qdsp6/topology.c:373:2: note: Loop condition is true.  En=
tering loop body
           while (tkn_count <=3D (le32_to_cpu(cont_array->num_elems) - 1)) {
           ^
   sound/soc/qcom/qdsp6/topology.c:374:3: note: Control jumps to 'case 102:=
'  at line 384
                   switch (le32_to_cpu(cont_elem->token)) {
                   ^
   sound/soc/qcom/qdsp6/topology.c:385:21: note: Access to field 'stack_siz=
e' results in a dereference of an undefined pointer value (loaded from vari=
able 'cont')
                           cont->stack_size =3D le32_to_cpu(cont_elem->valu=
e);
                           ~~~~             ^
>> sound/soc/qcom/qdsp6/topology.c:388:20: warning: Access to field 'graph_=
pos' results in a dereference of an undefined pointer value (loaded from va=
riable 'cont') [clang-analyzer-core.NullDereference]
                           cont->graph_pos =3D le32_to_cpu(cont_elem->value=
);
                                           ^
   sound/soc/qcom/qdsp6/topology.c:781:2: note: Control jumps to 'case snd_=
soc_dapm_pga:'  at line 796
           switch (w->id) {
           ^
   sound/soc/qcom/qdsp6/topology.c:797:10: note: Calling 'audioreach_widget=
_load_pga'
                   return audioreach_widget_load_pga(component, index, w, t=
plg_w);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   sound/soc/qcom/qdsp6/topology.c:757:8: note: Calling 'audioreach_widget_=
load_module_common'
           ret =3D audioreach_widget_load_module_common(component, index, w=
, tplg_w);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   sound/soc/qcom/qdsp6/topology.c:499:2: note: Taking false branch
           if (IS_ERR(sg))
           ^
   sound/soc/qcom/qdsp6/topology.c:502:9: note: Calling 'audioreach_parse_c=
ont_tokens'
           cont =3D audioreach_parse_cont_tokens(apm, sg, &tplg_w->priv);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/qcom/qdsp6/topology.c:366:2: note: 'cont' declared without an =
initial value
           struct audioreach_container *cont;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/qcom/qdsp6/topology.c:373:2: note: Loop condition is true.  En=
tering loop body
           while (tkn_count <=3D (le32_to_cpu(cont_array->num_elems) - 1)) {
           ^
   sound/soc/qcom/qdsp6/topology.c:374:3: note: Control jumps to 'case 103:=
'  at line 387
                   switch (le32_to_cpu(cont_elem->token)) {
                   ^
   sound/soc/qcom/qdsp6/topology.c:388:20: note: Access to field 'graph_pos=
' results in a dereference of an undefined pointer value (loaded from varia=
ble 'cont')
                           cont->graph_pos =3D le32_to_cpu(cont_elem->value=
);
                           ~~~~            ^
>> sound/soc/qcom/qdsp6/topology.c:391:22: warning: Access to field 'proc_d=
omain' results in a dereference of an undefined pointer value (loaded from =
variable 'cont') [clang-analyzer-core.NullDereference]
                           cont->proc_domain =3D le32_to_cpu(cont_elem->val=
ue);
                                             ^
   sound/soc/qcom/qdsp6/topology.c:781:2: note: Control jumps to 'case snd_=
soc_dapm_pga:'  at line 796
           switch (w->id) {
           ^
   sound/soc/qcom/qdsp6/topology.c:797:10: note: Calling 'audioreach_widget=
_load_pga'
                   return audioreach_widget_load_pga(component, index, w, t=
plg_w);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   sound/soc/qcom/qdsp6/topology.c:757:8: note: Calling 'audioreach_widget_=
load_module_common'
           ret =3D audioreach_widget_load_module_common(component, index, w=
, tplg_w);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   sound/soc/qcom/qdsp6/topology.c:499:2: note: Taking false branch
           if (IS_ERR(sg))
           ^
   sound/soc/qcom/qdsp6/topology.c:502:9: note: Calling 'audioreach_parse_c=
ont_tokens'
           cont =3D audioreach_parse_cont_tokens(apm, sg, &tplg_w->priv);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/qcom/qdsp6/topology.c:366:2: note: 'cont' declared without an =
initial value
           struct audioreach_container *cont;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/qcom/qdsp6/topology.c:373:2: note: Loop condition is true.  En=
tering loop body
           while (tkn_count <=3D (le32_to_cpu(cont_array->num_elems) - 1)) {
           ^
   sound/soc/qcom/qdsp6/topology.c:374:3: note: Control jumps to 'case 104:=
'  at line 390
                   switch (le32_to_cpu(cont_elem->token)) {
                   ^
   sound/soc/qcom/qdsp6/topology.c:391:22: note: Access to field 'proc_doma=
in' results in a dereference of an undefined pointer value (loaded from var=
iable 'cont')
                           cont->proc_domain =3D le32_to_cpu(cont_elem->val=
ue);
                           ~~~~              ^
   3 warnings generated.
   drivers/mtd/chips/cfi_cmdset_0020.c:714:29: warning: The right operand o=
f '+' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                           memcpy(buffer, elem_base + thislen, buflen);
                                                    ^ ~~~~~~~
   drivers/mtd/chips/cfi_cmdset_0020.c:667:22: note: 'thislen' declared wit=
hout an initial value
           size_t   totlen =3D 0, thislen;
                                ^~~~~~~
   drivers/mtd/chips/cfi_cmdset_0020.c:672:6: note: Assuming field 'writesi=
ze' is not equal to 0
           if (!ECCBUF_SIZE) {
               ^~~~~~~~~~~~
   drivers/mtd/chips/cfi_cmdset_0020.c:672:2: note: Taking false branch
           if (!ECCBUF_SIZE) {
           ^
   drivers/mtd/chips/cfi_cmdset_0020.c:678:11: note: Calling 'kmalloc'
           buffer =3D kmalloc(ECCBUF_SIZE, GFP_KERNEL);
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:579:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/linux/slab.h:596:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/chips/cfi_cmdset_0020.c:678:11: note: Returning from 'kmallo=
c'
           buffer =3D kmalloc(ECCBUF_SIZE, GFP_KERNEL);
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/chips/cfi_cmdset_0020.c:679:6: note: Assuming 'buffer' is no=
n-null
           if (!buffer)
               ^~~~~~~
   drivers/mtd/chips/cfi_cmdset_0020.c:679:2: note: Taking false branch
           if (!buffer)
           ^
   drivers/mtd/chips/cfi_cmdset_0020.c:682:12: note: Assuming 'i' is < 'cou=
nt'
           for (i=3D0; i<count; i++) {
                     ^~~~~~~
   drivers/mtd/chips/cfi_cmdset_0020.c:682:2: note: Loop condition is true.=
  Entering loop body
           for (i=3D0; i<count; i++) {
           ^
   drivers/mtd/chips/cfi_cmdset_0020.c:685:7: note: Assuming 'elem_len' is =
not equal to 0
                   if (!elem_len) /* FIXME: Might be unnecessary. Check tha=
t */
                       ^~~~~~~~~
   drivers/mtd/chips/cfi_cmdset_0020.c:685:3: note: Taking false branch
                   if (!elem_len) /* FIXME: Might be unnecessary. Check tha=
t */
                   ^
   drivers/mtd/chips/cfi_cmdset_0020.c:687:7: note: 'buflen' is 0
                   if (buflen) { /* cut off head */
                       ^~~~~~
   drivers/mtd/chips/cfi_cmdset_0020.c:687:3: note: Taking false branch
                   if (buflen) { /* cut off head */
                   ^
   drivers/mtd/chips/cfi_cmdset_0020.c:703:7: note: Assuming the condition =
is false
                   if (ECCBUF_DIV(elem_len)) { /* write clean aligned data =
*/
                       ^
   drivers/mtd/chips/cfi_cmdset_0020.c:660:24: note: expanded from macro 'E=
CCBUF_DIV'
   #define ECCBUF_DIV(x) ((x) & ~(ECCBUF_SIZE - 1))
                          ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/chips/cfi_cmdset_0020.c:703:3: note: Taking false branch
                   if (ECCBUF_DIV(elem_len)) { /* write clean aligned data =
*/
                   ^
   drivers/mtd/chips/cfi_cmdset_0020.c:712:7: note: Assuming 'buflen' is no=
t equal to 0
                   if (buflen) {
                       ^~~~~~
   drivers/mtd/chips/cfi_cmdset_0020.c:712:3: note: Taking true branch
                   if (buflen) {
                   ^
   drivers/mtd/chips/cfi_cmdset_0020.c:714:29: note: The right operand of '=
+' is a garbage value
                           memcpy(buffer, elem_base + thislen, buflen);
                                                    ^ ~~~~~~~
   drivers/mtd/chips/cfi_cmdset_0020.c:1035:16: warning: Value stored to 't=
imeo' during its initialization is never read [clang-analyzer-deadcode.Dead=
Stores]
           unsigned long timeo =3D jiffies + HZ;
                         ^~~~~   ~~~~~~~~~~~~
   drivers/mtd/chips/cfi_cmdset_0020.c:1035:16: note: Value stored to 'time=
o' during its initialization is never read
--
                                ^
   sound/soc/codecs/pcm512x.c:993:6: note: Assuming 'bclk_div' is <=3D 128
           if (bclk_div > 128) {
               ^~~~~~~~~~~~~~
   sound/soc/codecs/pcm512x.c:993:2: note: Taking false branch
           if (bclk_div > 128) {
           ^
   sound/soc/codecs/pcm512x.c:1003:12: note: Assuming the condition is false
           dsp_div =3D mck_rate > pcm512x_dsp_max(pcm512x) ? 2 : 1;
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/pcm512x.c:1003:12: note: '?' condition is false
   sound/soc/codecs/pcm512x.c:1006:6: note: Assuming 'dac_rate' is not equa=
l to 0
           if (dac_rate) {
               ^~~~~~~~
   sound/soc/codecs/pcm512x.c:1006:2: note: Taking true branch
           if (dac_rate) {
           ^
   sound/soc/codecs/pcm512x.c:1012:3: note: Taking false branch
                   dev_dbg(dev, "using pll input as dac input\n");
                   ^
   include/linux/dev_printk.h:155:2: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:166:2: note: expanded from macro 'dynamic_=
dev_dbg'
           _dynamic_func_call(fmt,__dynamic_dev_dbg,               \
           ^
   include/linux/dynamic_debug.h:152:2: note: expanded from macro '_dynamic=
_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS_=
_)
           ^
   include/linux/dynamic_debug.h:133:2: note: expanded from macro '__dynami=
c_func_call'
           if (DYNAMIC_DEBUG_BRANCH(id))                   \
           ^
   sound/soc/codecs/pcm512x.c:1012:3: note: Loop condition is false.  Exiti=
ng loop
                   dev_dbg(dev, "using pll input as dac input\n");
                   ^
   include/linux/dev_printk.h:155:2: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:166:2: note: expanded from macro 'dynamic_=
dev_dbg'
           _dynamic_func_call(fmt,__dynamic_dev_dbg,               \
           ^
   include/linux/dynamic_debug.h:152:2: note: expanded from macro '_dynamic=
_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS_=
_)
           ^
   include/linux/dynamic_debug.h:131:49: note: expanded from macro '__dynam=
ic_func_call'
   #define __dynamic_func_call(id, fmt, func, ...) do {    \
                                                   ^
   sound/soc/codecs/pcm512x.c:1015:7: note: Assuming 'ret' is equal to 0
                   if (ret !=3D 0) {
                       ^~~~~~~~
   sound/soc/codecs/pcm512x.c:1015:3: note: Taking false branch
                   if (ret !=3D 0) {
                   ^
   sound/soc/codecs/pcm512x.c:1024:7: note: Assuming 'ret' is equal to 0
                   if (ret !=3D 0) {
                       ^~~~~~~~
   sound/soc/codecs/pcm512x.c:1024:3: note: Taking false branch
                   if (ret !=3D 0) {
                   ^
   sound/soc/codecs/pcm512x.c:1062:12: note: Left side of '||' is true
           osr_div =3D DIV_ROUND_CLOSEST(dac_rate, osr_rate);
                     ^
   include/linux/math.h:89:23: note: expanded from macro 'DIV_ROUND_CLOSEST'
           (((typeof(x))-1) > 0 ||                         \
                                ^
   sound/soc/codecs/pcm512x.c:1063:6: note: Assuming 'osr_div' is <=3D 128
           if (osr_div > 128) {
               ^~~~~~~~~~~~~
   sound/soc/codecs/pcm512x.c:1063:2: note: Taking false branch
           if (osr_div > 128) {
           ^
   sound/soc/codecs/pcm512x.c:1068:12: note: Left side of '||' is true
           dac_div =3D DIV_ROUND_CLOSEST(dacsrc_rate, dac_rate);
                     ^
   include/linux/math.h:89:23: note: expanded from macro 'DIV_ROUND_CLOSEST'
           (((typeof(x))-1) > 0 ||                         \
                                ^
   sound/soc/codecs/pcm512x.c:1069:6: note: Assuming 'dac_div' is <=3D 128
           if (dac_div > 128) {
               ^~~~~~~~~~~~~
   sound/soc/codecs/pcm512x.c:1069:2: note: Taking false branch
           if (dac_div > 128) {
           ^
   sound/soc/codecs/pcm512x.c:1075:12: note: Left side of '||' is true
           ncp_div =3D DIV_ROUND_CLOSEST(dac_rate,
                     ^
   include/linux/math.h:89:23: note: expanded from macro 'DIV_ROUND_CLOSEST'
           (((typeof(x))-1) > 0 ||                         \
                                ^
   sound/soc/codecs/pcm512x.c:1075:2: note: The value 0 is assigned to 'ncp=
_div'
           ncp_div =3D DIV_ROUND_CLOSEST(dac_rate,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/pcm512x.c:1077:6: note: 'ncp_div' is <=3D 128
           if (ncp_div > 128 || dac_rate / ncp_div > 2048000) {
               ^~~~~~~
   sound/soc/codecs/pcm512x.c:1077:6: note: Left side of '||' is false
   sound/soc/codecs/pcm512x.c:1077:32: note: Division by zero
           if (ncp_div > 128 || dac_rate / ncp_div > 2048000) {
                                ~~~~~~~~~^~~~~~~~~
   7 warnings generated.
>> sound/soc/qcom/qdsp6/topology.c:336:18: warning: Access to field 'perf_m=
ode' results in a dereference of an undefined pointer value (loaded from va=
riable 'sg') [clang-analyzer-core.NullDereference]
                           sg->perf_mode =3D le32_to_cpu(sg_elem->value);
                                         ^
   sound/soc/qcom/qdsp6/topology.c:781:2: note: Control jumps to 'case snd_=
soc_dapm_pga:'  at line 796
           switch (w->id) {
           ^
   sound/soc/qcom/qdsp6/topology.c:797:10: note: Calling 'audioreach_widget=
_load_pga'
                   return audioreach_widget_load_pga(component, index, w, t=
plg_w);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   sound/soc/qcom/qdsp6/topology.c:757:8: note: Calling 'audioreach_widget_=
load_module_common'
           ret =3D audioreach_widget_load_module_common(component, index, w=
, tplg_w);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   sound/soc/qcom/qdsp6/topology.c:498:7: note: Calling 'audioreach_parse_s=
g_tokens'
           sg =3D audioreach_parse_sg_tokens(apm, &tplg_w->priv);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/qcom/qdsp6/topology.c:310:2: note: 'sg' declared without an in=
itial value
           struct audioreach_sub_graph *sg;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/qcom/qdsp6/topology.c:316:2: note: Loop condition is true.  En=
tering loop body
           while (tkn_count <=3D (le32_to_cpu(sg_array->num_elems) - 1)) {
           ^
   sound/soc/qcom/qdsp6/topology.c:317:3: note: Control jumps to 'case 3:' =
 at line 335
                   switch (le32_to_cpu(sg_elem->token)) {
                   ^
   sound/soc/qcom/qdsp6/topology.c:336:18: note: Access to field 'perf_mode=
' results in a dereference of an undefined pointer value (loaded from varia=
ble 'sg')
                           sg->perf_mode =3D le32_to_cpu(sg_elem->value);
                           ~~            ^
>> sound/soc/qcom/qdsp6/topology.c:339:18: warning: Access to field 'direct=
ion' results in a dereference of an undefined pointer value (loaded from va=
riable 'sg') [clang-analyzer-core.NullDereference]
                           sg->direction =3D le32_to_cpu(sg_elem->value);
                                         ^
   sound/soc/qcom/qdsp6/topology.c:781:2: note: Control jumps to 'case snd_=
soc_dapm_pga:'  at line 796
           switch (w->id) {
           ^
   sound/soc/qcom/qdsp6/topology.c:797:10: note: Calling 'audioreach_widget=
_load_pga'
                   return audioreach_widget_load_pga(component, index, w, t=
plg_w);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   sound/soc/qcom/qdsp6/topology.c:757:8: note: Calling 'audioreach_widget_=
load_module_common'
           ret =3D audioreach_widget_load_module_common(component, index, w=
, tplg_w);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   sound/soc/qcom/qdsp6/topology.c:498:7: note: Calling 'audioreach_parse_s=
g_tokens'
           sg =3D audioreach_parse_sg_tokens(apm, &tplg_w->priv);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/qcom/qdsp6/topology.c:310:2: note: 'sg' declared without an in=
itial value
           struct audioreach_sub_graph *sg;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/qcom/qdsp6/topology.c:316:2: note: Loop condition is true.  En=
tering loop body
           while (tkn_count <=3D (le32_to_cpu(sg_array->num_elems) - 1)) {
           ^
   sound/soc/qcom/qdsp6/topology.c:317:3: note: Control jumps to 'case 4:' =
 at line 338
                   switch (le32_to_cpu(sg_elem->token)) {
                   ^
   sound/soc/qcom/qdsp6/topology.c:339:18: note: Access to field 'direction=
' results in a dereference of an undefined pointer value (loaded from varia=
ble 'sg')
                           sg->direction =3D le32_to_cpu(sg_elem->value);
                           ~~            ^
>> sound/soc/qcom/qdsp6/topology.c:342:20: warning: Access to field 'scenar=
io_id' results in a dereference of an undefined pointer value (loaded from =
variable 'sg') [clang-analyzer-core.NullDereference]
                           sg->scenario_id =3D le32_to_cpu(sg_elem->value);
                                           ^
   sound/soc/qcom/qdsp6/topology.c:781:2: note: Control jumps to 'case snd_=
soc_dapm_pga:'  at line 796
           switch (w->id) {
           ^
   sound/soc/qcom/qdsp6/topology.c:797:10: note: Calling 'audioreach_widget=
_load_pga'
                   return audioreach_widget_load_pga(component, index, w, t=
plg_w);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   sound/soc/qcom/qdsp6/topology.c:757:8: note: Calling 'audioreach_widget_=
load_module_common'
           ret =3D audioreach_widget_load_module_common(component, index, w=
, tplg_w);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   sound/soc/qcom/qdsp6/topology.c:498:7: note: Calling 'audioreach_parse_s=
g_tokens'
           sg =3D audioreach_parse_sg_tokens(apm, &tplg_w->priv);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/qcom/qdsp6/topology.c:310:2: note: 'sg' declared without an in=
itial value
           struct audioreach_sub_graph *sg;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/qcom/qdsp6/topology.c:316:2: note: Loop condition is true.  En=
tering loop body
           while (tkn_count <=3D (le32_to_cpu(sg_array->num_elems) - 1)) {
           ^
   sound/soc/qcom/qdsp6/topology.c:317:3: note: Control jumps to 'case 5:' =
 at line 341
                   switch (le32_to_cpu(sg_elem->token)) {
                   ^
   sound/soc/qcom/qdsp6/topology.c:342:20: note: Access to field 'scenario_=
id' results in a dereference of an undefined pointer value (loaded from var=
iable 'sg')
                           sg->scenario_id =3D le32_to_cpu(sg_elem->value);
                           ~~              ^
>> sound/soc/qcom/qdsp6/topology.c:382:24: warning: Access to field 'capabi=
lity_id' results in a dereference of an undefined pointer value (loaded fro=
m variable 'cont') [clang-analyzer-core.NullDereference]
                           cont->capability_id =3D le32_to_cpu(cont_elem->v=
alue);
                                               ^
   sound/soc/qcom/qdsp6/topology.c:781:2: note: Control jumps to 'case snd_=
soc_dapm_pga:'  at line 796
           switch (w->id) {
           ^
   sound/soc/qcom/qdsp6/topology.c:797:10: note: Calling 'audioreach_widget=
_load_pga'
                   return audioreach_widget_load_pga(component, index, w, t=
plg_w);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   sound/soc/qcom/qdsp6/topology.c:757:8: note: Calling 'audioreach_widget_=
load_module_common'
           ret =3D audioreach_widget_load_module_common(component, index, w=
, tplg_w);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   sound/soc/qcom/qdsp6/topology.c:499:2: note: Taking false branch
           if (IS_ERR(sg))
           ^
   sound/soc/qcom/qdsp6/topology.c:502:9: note: Calling 'audioreach_parse_c=
ont_tokens'
           cont =3D audioreach_parse_cont_tokens(apm, sg, &tplg_w->priv);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/qcom/qdsp6/topology.c:366:2: note: 'cont' declared without an =
initial value
           struct audioreach_container *cont;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/qcom/qdsp6/topology.c:373:2: note: Loop condition is true.  En=
tering loop body
           while (tkn_count <=3D (le32_to_cpu(cont_array->num_elems) - 1)) {
           ^
   sound/soc/qcom/qdsp6/topology.c:374:3: note: Control jumps to 'case 101:=
'  at line 381
                   switch (le32_to_cpu(cont_elem->token)) {
                   ^
   sound/soc/qcom/qdsp6/topology.c:382:24: note: Access to field 'capabilit=
y_id' results in a dereference of an undefined pointer value (loaded from v=
ariable 'cont')
                           cont->capability_id =3D le32_to_cpu(cont_elem->v=
alue);
                           ~~~~                ^
>> sound/soc/qcom/qdsp6/topology.c:385:21: warning: Access to field 'stack_=
size' results in a dereference of an undefined pointer value (loaded from v=
ariable 'cont') [clang-analyzer-core.NullDereference]
                           cont->stack_size =3D le32_to_cpu(cont_elem->valu=
e);
                                            ^
   sound/soc/qcom/qdsp6/topology.c:781:2: note: Control jumps to 'case snd_=
soc_dapm_pga:'  at line 796
           switch (w->id) {
           ^
   sound/soc/qcom/qdsp6/topology.c:797:10: note: Calling 'audioreach_widget=
_load_pga'
                   return audioreach_widget_load_pga(component, index, w, t=
plg_w);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   sound/soc/qcom/qdsp6/topology.c:757:8: note: Calling 'audioreach_widget_=
load_module_common'
           ret =3D audioreach_widget_load_module_common(component, index, w=
, tplg_w);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   sound/soc/qcom/qdsp6/topology.c:499:2: note: Taking false branch
           if (IS_ERR(sg))
           ^
   sound/soc/qcom/qdsp6/topology.c:502:9: note: Calling 'audioreach_parse_c=
ont_tokens'
           cont =3D audioreach_parse_cont_tokens(apm, sg, &tplg_w->priv);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/qcom/qdsp6/topology.c:366:2: note: 'cont' declared without an =
initial value
           struct audioreach_container *cont;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/qcom/qdsp6/topology.c:373:2: note: Loop condition is true.  En=
tering loop body
           while (tkn_count <=3D (le32_to_cpu(cont_array->num_elems) - 1)) {
           ^
   sound/soc/qcom/qdsp6/topology.c:374:3: note: Control jumps to 'case 102:=
'  at line 384
                   switch (le32_to_cpu(cont_elem->token)) {
                   ^
   sound/soc/qcom/qdsp6/topology.c:385:21: note: Access to field 'stack_siz=
e' results in a dereference of an undefined pointer value (loaded from vari=
able 'cont')
                           cont->stack_size =3D le32_to_cpu(cont_elem->valu=
e);
                           ~~~~             ^
>> sound/soc/qcom/qdsp6/topology.c:388:20: warning: Access to field 'graph_=
pos' results in a dereference of an undefined pointer value (loaded from va=
riable 'cont') [clang-analyzer-core.NullDereference]
                           cont->graph_pos =3D le32_to_cpu(cont_elem->value=
);
                                           ^
   sound/soc/qcom/qdsp6/topology.c:781:2: note: Control jumps to 'case snd_=
soc_dapm_pga:'  at line 796
           switch (w->id) {
           ^
   sound/soc/qcom/qdsp6/topology.c:797:10: note: Calling 'audioreach_widget=
_load_pga'
                   return audioreach_widget_load_pga(component, index, w, t=
plg_w);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   sound/soc/qcom/qdsp6/topology.c:757:8: note: Calling 'audioreach_widget_=
load_module_common'
           ret =3D audioreach_widget_load_module_common(component, index, w=
, tplg_w);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   sound/soc/qcom/qdsp6/topology.c:499:2: note: Taking false branch
           if (IS_ERR(sg))
           ^
   sound/soc/qcom/qdsp6/topology.c:502:9: note: Calling 'audioreach_parse_c=
ont_tokens'
           cont =3D audioreach_parse_cont_tokens(apm, sg, &tplg_w->priv);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/qcom/qdsp6/topology.c:366:2: note: 'cont' declared without an =
initial value
           struct audioreach_container *cont;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/qcom/qdsp6/topology.c:373:2: note: Loop condition is true.  En=
tering loop body
           while (tkn_count <=3D (le32_to_cpu(cont_array->num_elems) - 1)) {
           ^
   sound/soc/qcom/qdsp6/topology.c:374:3: note: Control jumps to 'case 103:=
'  at line 387
                   switch (le32_to_cpu(cont_elem->token)) {
                   ^
   sound/soc/qcom/qdsp6/topology.c:388:20: note: Access to field 'graph_pos=
' results in a dereference of an undefined pointer value (loaded from varia=
ble 'cont')
                           cont->graph_pos =3D le32_to_cpu(cont_elem->value=
);
                           ~~~~            ^
>> sound/soc/qcom/qdsp6/topology.c:391:22: warning: Access to field 'proc_d=
omain' results in a dereference of an undefined pointer value (loaded from =
variable 'cont') [clang-analyzer-core.NullDereference]
                           cont->proc_domain =3D le32_to_cpu(cont_elem->val=
ue);
                                             ^
   sound/soc/qcom/qdsp6/topology.c:781:2: note: Control jumps to 'case snd_=
soc_dapm_pga:'  at line 796
           switch (w->id) {
           ^
   sound/soc/qcom/qdsp6/topology.c:797:10: note: Calling 'audioreach_widget=
_load_pga'
                   return audioreach_widget_load_pga(component, index, w, t=
plg_w);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   sound/soc/qcom/qdsp6/topology.c:757:8: note: Calling 'audioreach_widget_=
load_module_common'
           ret =3D audioreach_widget_load_module_common(component, index, w=
, tplg_w);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   sound/soc/qcom/qdsp6/topology.c:499:2: note: Taking false branch
           if (IS_ERR(sg))
           ^
   sound/soc/qcom/qdsp6/topology.c:502:9: note: Calling 'audioreach_parse_c=
ont_tokens'
           cont =3D audioreach_parse_cont_tokens(apm, sg, &tplg_w->priv);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/qcom/qdsp6/topology.c:366:2: note: 'cont' declared without an =
initial value
           struct audioreach_container *cont;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/qcom/qdsp6/topology.c:373:2: note: Loop condition is true.  En=
tering loop body
           while (tkn_count <=3D (le32_to_cpu(cont_array->num_elems) - 1)) {
           ^
   sound/soc/qcom/qdsp6/topology.c:374:3: note: Control jumps to 'case 104:=
'  at line 390
                   switch (le32_to_cpu(cont_elem->token)) {
                   ^
   sound/soc/qcom/qdsp6/topology.c:391:22: note: Access to field 'proc_doma=
in' results in a dereference of an undefined pointer value (loaded from var=
iable 'cont')
                           cont->proc_domain =3D le32_to_cpu(cont_elem->val=
ue);
                           ~~~~              ^
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   drivers/iio/adc/ad7266.c:157:3: warning: Value stored to 'ret' is never =
read [clang-analyzer-deadcode.DeadStores]
                   ret =3D ad7266_read_single(st, val, chan->address);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/ad7266.c:157:3: note: Value stored to 'ret' is never read
                   ret =3D ad7266_read_single(st, val, chan->address);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
   drivers/iio/adc/ad7766.c:35:8: warning: Excessive padding in 'struct ad7=
766' (32 padding bytes, where 0 is optimal). =

   Optimal fields order: =

   data, =

   chip_info, =

   spi, =

   mclk, =

   pd_gpio, =

   trig, =

   reg, =

   msg, =

   xfer, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ad7766 {
   ~~~~~~~^~~~~~~~
   drivers/iio/adc/ad7766.c:35:8: note: Excessive padding in 'struct ad7766=
' (32 padding bytes, where 0 is optimal). Optimal fields order: data, chip_=
info, spi, mclk, pd_gpio, trig, reg, msg, xfer, consider reordering the fie=
lds or adding explicit padding members
   struct ad7766 {
   ~~~~~~~^~~~~~~~
   1 warning generated.
   drivers/input/misc/atmel_captouch.c:68:8: warning: Excessive padding in =
'struct atmel_captouch_device' (43 padding bytes, where 11 is optimal). =

   Optimal fields order: =

   xfer_buf, =

   client, =

   input, =

   num_btn, =

   keycodes, =

   prev_btn, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct atmel_captouch_device {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/misc/atmel_captouch.c:68:8: note: Excessive padding in 'st=
ruct atmel_captouch_device' (43 padding bytes, where 11 is optimal). Optima=
l fields order: xfer_buf, client, input, num_btn, keycodes, prev_btn, consi=
der reordering the fields or adding explicit padding members
   struct atmel_captouch_device {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.
   net/can/j1939/main.c:211:17: warning: Use of memory after it is freed [c=
lang-analyzer-unix.Malloc]
           j1939_priv_set(priv->ndev, NULL);
                          ^
   net/can/j1939/main.c:297:2: note: Calling 'kref_put_lock'
           kref_put_lock(&priv->rx_kref, __j1939_rx_release, &j1939_netdev_=
lock);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   include/linux/kref.h:86:6: note: Assuming the condition is true
           if (refcount_dec_and_lock(&kref->refcount, lock)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kref.h:86:2: note: Taking true branch
           if (refcount_dec_and_lock(&kref->refcount, lock)) {
           ^
   include/linux/kref.h:87:3: note: Calling '__j1939_rx_release'
                   release(kref);
                   ^~~~~~~~~~~~~
   net/can/j1939/main.c:206:28: note: Left side of '&&' is false
           struct j1939_priv *priv =3D container_of(kref, struct j1939_priv,
                                     ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   net/can/j1939/main.c:206:28: note: Taking false branch
           struct j1939_priv *priv =3D container_of(kref, struct j1939_priv,
                                     ^

vim +336 sound/soc/qcom/qdsp6/topology.c

36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  302  =

36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  303  static struct audiorea=
ch_sub_graph *audioreach_parse_sg_tokens(struct q6apm *apm,
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  304  						       struct sn=
d_soc_tplg_private *private)
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  305  {
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  306  	struct snd_soc_tplg_v=
endor_value_elem *sg_elem;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  307  	struct snd_soc_tplg_v=
endor_array *sg_array;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  308  	struct audioreach_gra=
ph_info *info =3D NULL;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  309  	int graph_id, sub_gra=
ph_id, tkn_count =3D 0;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  310  	struct audioreach_sub=
_graph *sg;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  311  	bool found;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  312  =

36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  313  	sg_array =3D audiorea=
ch_get_sg_array(private);
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  314  	sg_elem =3D sg_array-=
>value;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  315  =

36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  316  	while (tkn_count <=3D=
 (le32_to_cpu(sg_array->num_elems) - 1)) {
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  317  		switch (le32_to_cpu(=
sg_elem->token)) {
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  318  		case AR_TKN_U32_SUB_=
GRAPH_INSTANCE_ID:
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  319  			sub_graph_id =3D le=
32_to_cpu(sg_elem->value);
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  320  			sg =3D audioreach_t=
plg_alloc_sub_graph(apm, sub_graph_id, &found);
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  321  			if (IS_ERR(sg)) {
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  322  				return sg;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  323  			} else if (found) {
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  324  				/* Already parsed =
data for this sub-graph */
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  325  				return sg;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  326  			}
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  327  			break;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  328  		case AR_TKN_DAI_INDE=
X:
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  329  			/* Sub graph is ass=
ociated with predefined graph */
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  330  			graph_id =3D le32_t=
o_cpu(sg_elem->value);
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  331  			info =3D audioreach=
_tplg_alloc_graph_info(apm, graph_id, &found);
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  332  			if (IS_ERR(info))
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  333  				return ERR_CAST(in=
fo);
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  334  			break;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  335  		case AR_TKN_U32_SUB_=
GRAPH_PERF_MODE:
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26 @336  			sg->perf_mode =3D l=
e32_to_cpu(sg_elem->value);
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  337  			break;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  338  		case AR_TKN_U32_SUB_=
GRAPH_DIRECTION:
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26 @339  			sg->direction =3D l=
e32_to_cpu(sg_elem->value);
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  340  			break;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  341  		case AR_TKN_U32_SUB_=
GRAPH_SCENARIO_ID:
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26 @342  			sg->scenario_id =3D=
 le32_to_cpu(sg_elem->value);
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  343  			break;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  344  		default:
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  345  			dev_err(apm->dev, "=
Not a valid token %d for graph\n", sg_elem->token);
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  346  			break;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  347  =

36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  348  		}
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  349  		tkn_count++;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  350  		sg_elem++;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  351  	}
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  352  =

36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  353  	/* Sub graph is assoc=
iated with predefined graph */
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  354  	if (info)
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  355  		audioreach_tplg_add_=
sub_graph(sg, info);
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  356  =

36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  357  	return sg;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  358  }
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  359  =

36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  360  static struct audiorea=
ch_container *audioreach_parse_cont_tokens(struct q6apm *apm,
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  361  							 struct audiore=
ach_sub_graph *sg,
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  362  							 struct snd_soc=
_tplg_private *private)
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  363  {
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  364  	struct snd_soc_tplg_v=
endor_value_elem *cont_elem;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  365  	struct snd_soc_tplg_v=
endor_array *cont_array;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  366  	struct audioreach_con=
tainer *cont;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  367  	int container_id, tkn=
_count =3D 0;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  368  	bool found =3D false;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  369  =

36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  370  	cont_array =3D audior=
each_get_cont_array(private);
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  371  	cont_elem =3D cont_ar=
ray->value;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  372  =

36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  373  	while (tkn_count <=3D=
 (le32_to_cpu(cont_array->num_elems) - 1)) {
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  374  		switch (le32_to_cpu(=
cont_elem->token)) {
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  375  		case AR_TKN_U32_CONT=
AINER_INSTANCE_ID:
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  376  			container_id =3D le=
32_to_cpu(cont_elem->value);
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  377  			cont =3D audioreach=
_tplg_alloc_container(apm, sg, container_id, &found);
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  378  			if (IS_ERR(cont) ||=
 found)/* Error or Already parsed container data */
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  379  				return cont;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  380  			break;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  381  		case AR_TKN_U32_CONT=
AINER_CAPABILITY_ID:
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26 @382  			cont->capability_id=
 =3D le32_to_cpu(cont_elem->value);
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  383  			break;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  384  		case AR_TKN_U32_CONT=
AINER_STACK_SIZE:
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26 @385  			cont->stack_size =
=3D le32_to_cpu(cont_elem->value);
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  386  			break;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  387  		case AR_TKN_U32_CONT=
AINER_GRAPH_POS:
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26 @388  			cont->graph_pos =3D=
 le32_to_cpu(cont_elem->value);
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  389  			break;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  390  		case AR_TKN_U32_CONT=
AINER_PROC_DOMAIN:
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26 @391  			cont->proc_domain =
=3D le32_to_cpu(cont_elem->value);
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  392  			break;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  393  		default:
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  394  			dev_err(apm->dev, "=
Not a valid token %d for graph\n", cont_elem->token);
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  395  			break;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  396  =

36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  397  		}
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  398  		tkn_count++;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  399  		cont_elem++;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  400  	}
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  401  =

36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  402  	return cont;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  403  }
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  404  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7132679400212046359==--


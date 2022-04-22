Content-Type: multipart/mixed; boundary="===============8135707306136003517=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/platform/chips-media/coda-common.c:478:38: warning: Array access (from variable 'formats') results in a null pointer dereference [clang-analyzer-core.NullDereference]
Date: Fri, 22 Apr 2022 14:33:37 +0800
Message-ID: <202204221400.Zv3VY1r0-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8135707306136003517==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d569e86915b7f2f9795588591c8d5ea0b66481cb
commit: 64441979bda6c2d17fa40c022f7debec6c328793 media: platform: rename co=
da/ to chips-media/
date:   5 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 5 weeks ago
config: riscv-randconfig-c006-20220421 (https://download.01.org/0day-ci/arc=
hive/20220422/202204221400.Zv3VY1r0-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5bd873=
50a5ae429baf8f373cb226a57b62f87280)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D64441979bda6c2d17fa40c022f7debec6c328793
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 64441979bda6c2d17fa40c022f7debec6c328793
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
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
   11 warnings generated.
   drivers/media/dvb-frontends/cxd2820r_c.c:14:21: warning: Value stored to=
 'client' during its initialization is never read [clang-analyzer-deadcode.=
DeadStores]
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_c.c:14:21: note: Value stored to 'c=
lient' during its initialization is never read
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_c.c:15:34: warning: Value stored to=
 'c' during its initialization is never read [clang-analyzer-deadcode.DeadS=
tores]
           struct dtv_frontend_properties *c =3D &fe->dtv_property_cache;
                                           ^   ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_c.c:15:34: note: Value stored to 'c=
' during its initialization is never read
           struct dtv_frontend_properties *c =3D &fe->dtv_property_cache;
                                           ^   ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_c.c:92:21: warning: Value stored to=
 'client' during its initialization is never read [clang-analyzer-deadcode.=
DeadStores]
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_c.c:92:21: note: Value stored to 'c=
lient' during its initialization is never read
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_c.c:145:21: warning: Value stored t=
o 'client' during its initialization is never read [clang-analyzer-deadcode=
.DeadStores]
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_c.c:145:21: note: Value stored to '=
client' during its initialization is never read
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_c.c:281:21: warning: Value stored t=
o 'client' during its initialization is never read [clang-analyzer-deadcode=
.DeadStores]
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_c.c:281:21: note: Value stored to '=
client' during its initialization is never read
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_c.c:299:21: warning: Value stored t=
o 'client' during its initialization is never read [clang-analyzer-deadcode=
.DeadStores]
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_c.c:299:21: note: Value stored to '=
client' during its initialization is never read
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/gpu/drm/bridge/adv7511/adv7511_drv.c:508:3: warning: Value store=
d to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D wait_event_interruptible_timeout(adv7511->wq,
                   ^
   drivers/gpu/drm/bridge/adv7511/adv7511_drv.c:508:3: note: Value stored t=
o 'ret' is never read
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
   drivers/gpu/drm/bridge/analogix/analogix-anx6345.c:387:2: warning: Value=
 stored to 'err' is never read [clang-analyzer-deadcode.DeadStores]
           err =3D anx6345_clear_bits(anx6345->map[I2C_IDX_TXCOM],
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/analogix/analogix-anx6345.c:387:2: note: Value st=
ored to 'err' is never read
           err =3D anx6345_clear_bits(anx6345->map[I2C_IDX_TXCOM],
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c:536:2: warning: Value=
 stored to 'err' is never read [clang-analyzer-deadcode.DeadStores]
           err =3D anx78xx_clear_bits(anx78xx->map[I2C_IDX_TX_P2],
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c:536:2: note: Value st=
ored to 'err' is never read
           err =3D anx78xx_clear_bits(anx78xx->map[I2C_IDX_TX_P2],
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
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
   8 warnings generated.
>> drivers/media/platform/chips-media/coda-common.c:478:38: warning: Array =
access (from variable 'formats') results in a null pointer dereference [cla=
ng-analyzer-core.NullDereference]
           if (f->index >=3D CODA_MAX_FORMATS || formats[f->index] =3D=3D 0)
                                               ^~~~~~~
   drivers/media/platform/chips-media/coda-common.c:448:6: note: Assuming f=
ield 'type' is equal to V4L2_BUF_TYPE_VIDEO_OUTPUT
           if (f->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/chips-media/coda-common.c:448:2: note: Taking tru=
e branch
           if (f->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT)
           ^
   drivers/media/platform/chips-media/coda-common.c:449:3: note: Null point=
er value stored to 'formats'
                   formats =3D cvd->src_formats;
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/chips-media/coda-common.c:478:6: note: Assuming f=
ield 'index' is < CODA_MAX_FORMATS
           if (f->index >=3D CODA_MAX_FORMATS || formats[f->index] =3D=3D 0)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/chips-media/coda-common.c:478:6: note: Left side =
of '||' is false
   drivers/media/platform/chips-media/coda-common.c:478:38: note: Array acc=
ess (from variable 'formats') results in a null pointer dereference
           if (f->index >=3D CODA_MAX_FORMATS || formats[f->index] =3D=3D 0)
                                               ^~~~~~~
   include/linux/list.h:137:13: warning: Use of memory after it is freed [c=
lang-analyzer-unix.Malloc]
           __list_del(entry->prev, entry->next);
                      ^
   drivers/media/platform/chips-media/coda-common.c:2117:9: note: Assuming =
field 'streamon_out' is not equal to 0
           stop =3D ctx->streamon_out && ctx->streamon_cap;
                  ^~~~~~~~~~~~~~~~~
   drivers/media/platform/chips-media/coda-common.c:2117:9: note: Left side=
 of '&&' is true
   drivers/media/platform/chips-media/coda-common.c:2119:2: note: Assuming =
'coda_debug' is < 1
           coda_dbg(1, ctx, "stop streaming %s\n", v4l2_type_names[q->type]=
);
           ^
   drivers/media/platform/chips-media/coda.h:300:7: note: expanded from mac=
ro 'coda_dbg'
                   if (coda_debug >=3D (level))                            =
  \
                       ^~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/chips-media/coda-common.c:2119:2: note: Taking fa=
lse branch
           coda_dbg(1, ctx, "stop streaming %s\n", v4l2_type_names[q->type]=
);
           ^
   drivers/media/platform/chips-media/coda.h:300:3: note: expanded from mac=
ro 'coda_dbg'
                   if (coda_debug >=3D (level))                            =
  \
                   ^
   drivers/media/platform/chips-media/coda-common.c:2119:2: note: Loop cond=
ition is false.  Exiting loop
           coda_dbg(1, ctx, "stop streaming %s\n", v4l2_type_names[q->type]=
);
           ^
   drivers/media/platform/chips-media/coda.h:299:2: note: expanded from mac=
ro 'coda_dbg'
           do {                                                            \
           ^
   drivers/media/platform/chips-media/coda-common.c:2121:6: note: Assuming =
field 'type' is equal to V4L2_BUF_TYPE_VIDEO_OUTPUT
           if (q->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/chips-media/coda-common.c:2121:2: note: Taking tr=
ue branch
           if (q->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT) {
           ^
   drivers/media/platform/chips-media/coda-common.c:2128:3: note: Loop cond=
ition is false. Execution continues on line 2140
                   while ((buf =3D v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx)=
))
                   ^
   drivers/media/platform/chips-media/coda-common.c:2140:6: note: Assuming =
'stop' is true
           if (stop) {
               ^~~~
   drivers/media/platform/chips-media/coda-common.c:2140:2: note: Taking tr=
ue branch
           if (stop) {
           ^
   drivers/media/platform/chips-media/coda-common.c:2143:7: note: Assuming =
field 'seq_end_work' is null
                   if (ctx->ops->seq_end_work) {
                       ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/chips-media/coda-common.c:2143:3: note: Taking fa=
lse branch
                   if (ctx->ops->seq_end_work) {
                   ^
   drivers/media/platform/chips-media/coda-common.c:2148:3: note: Loop cond=
ition is true.  Entering loop body
                   while (!list_empty(&ctx->buffer_meta_list)) {
                   ^
   drivers/media/platform/chips-media/coda-common.c:2152:4: note: Memory is=
 released
                           kfree(meta);
                           ^~~~~~~~~~~
   drivers/media/platform/chips-media/coda-common.c:2148:3: note: Loop cond=
ition is true.  Entering loop body
                   while (!list_empty(&ctx->buffer_meta_list)) {
                   ^
   drivers/media/platform/chips-media/coda-common.c:2151:4: note: Calling '=
list_del'
                           list_del(&meta->list);
                           ^~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:148:2: note: Calling '__list_del_entry'
           __list_del_entry(entry);
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:134:6: note: Assuming the condition is false
           if (!__list_del_entry_valid(entry))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:134:2: note: Taking false branch
           if (!__list_del_entry_valid(entry))
           ^
   include/linux/list.h:137:13: note: Use of memory after it is freed
           __list_del(entry->prev, entry->next);
                      ^~~~~~~~~~~
   include/linux/list.h:149:14: warning: Use of memory after it is freed [c=
lang-analyzer-unix.Malloc]
           entry->next =3D LIST_POISON1;
                       ^
   drivers/media/platform/chips-media/coda-common.c:2117:9: note: Assuming =
field 'streamon_out' is not equal to 0
           stop =3D ctx->streamon_out && ctx->streamon_cap;
                  ^~~~~~~~~~~~~~~~~
   drivers/media/platform/chips-media/coda-common.c:2117:9: note: Left side=
 of '&&' is true
   drivers/media/platform/chips-media/coda-common.c:2119:2: note: Assuming =
'coda_debug' is < 1
           coda_dbg(1, ctx, "stop streaming %s\n", v4l2_type_names[q->type]=
);
           ^
   drivers/media/platform/chips-media/coda.h:300:7: note: expanded from mac=
ro 'coda_dbg'
                   if (coda_debug >=3D (level))                            =
  \
--
                 ^~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   kernel/cgroup/cgroup-v1.c:1087:3: warning: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(root->release_agent_path, ctx->release_agent);
                   ^~~~~~
   kernel/cgroup/cgroup-v1.c:1087:3: note: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119
                   strcpy(root->release_agent_path, ctx->release_agent);
                   ^~~~~~
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
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
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
   9 warnings generated.
   drivers/media/dvb-frontends/cxd2820r_t2.c:14:21: warning: Value stored t=
o 'client' during its initialization is never read [clang-analyzer-deadcode=
.DeadStores]
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_t2.c:14:21: note: Value stored to '=
client' during its initialization is never read
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_t2.c:160:21: warning: Value stored =
to 'client' during its initialization is never read [clang-analyzer-deadcod=
e.DeadStores]
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_t2.c:160:21: note: Value stored to =
'client' during its initialization is never read
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_t2.c:279:21: warning: Value stored =
to 'client' during its initialization is never read [clang-analyzer-deadcod=
e.DeadStores]
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_t2.c:279:21: note: Value stored to =
'client' during its initialization is never read
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_t2.c:387:21: warning: Value stored =
to 'client' during its initialization is never read [clang-analyzer-deadcod=
e.DeadStores]
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_t2.c:387:21: note: Value stored to =
'client' during its initialization is never read
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
>> drivers/media/platform/chips-media/coda-bit.c:1127:2: warning: Value sto=
red to 'value' is never read [clang-analyzer-deadcode.DeadStores]
           value =3D 0;
           ^       ~
   drivers/media/platform/chips-media/coda-bit.c:1127:2: note: Value stored=
 to 'value' is never read
           value =3D 0;
           ^       ~
   include/linux/log2.h:57:13: warning: The result of the left shift is und=
efined due to shifting by '32', which is greater or equal to the width of t=
ype 'unsigned long' [clang-analyzer-core.UndefinedBinaryOperatorResult]
           return 1UL << fls_long(n - 1);
                      ^
   drivers/media/platform/chips-media/coda-bit.c:1794:6: note: Assuming fie=
ld 'type' is equal to V4L2_BUF_TYPE_VIDEO_OUTPUT
           if (rb->type !=3D V4L2_BUF_TYPE_VIDEO_OUTPUT)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/chips-media/coda-bit.c:1794:2: note: Taking false=
 branch
           if (rb->type !=3D V4L2_BUF_TYPE_VIDEO_OUTPUT)
           ^
   drivers/media/platform/chips-media/coda-bit.c:1797:6: note: Assuming fie=
ld 'count' is not equal to 0
           if (rb->count) {
               ^~~~~~~~~
   drivers/media/platform/chips-media/coda-bit.c:1797:2: note: Taking true =
branch
           if (rb->count) {
           ^
   drivers/media/platform/chips-media/coda-bit.c:1800:7: note: 'ret' is >=
=3D 0
                   if (ret < 0)
                       ^~~
   drivers/media/platform/chips-media/coda-bit.c:1800:3: note: Taking false=
 branch
                   if (ret < 0)
                   ^
   drivers/media/platform/chips-media/coda-bit.c:1802:9: note: Calling 'cod=
a_alloc_bitstream_buffer'
                   ret =3D coda_alloc_bitstream_buffer(ctx, q_data_src);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/chips-media/coda-bit.c:1760:6: note: Assuming fie=
ld 'vaddr' is null
           if (ctx->bitstream.vaddr)
               ^~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/chips-media/coda-bit.c:1760:2: note: Taking false=
 branch
           if (ctx->bitstream.vaddr)
           ^
   drivers/media/platform/chips-media/coda-bit.c:1763:24: note: '?' conditi=
on is false
           ctx->bitstream.size =3D roundup_pow_of_two(q_data->sizeimage * 2=
);
                                 ^
   include/linux/log2.h:176:2: note: expanded from macro 'roundup_pow_of_tw=
o'
           __builtin_constant_p(n) ? (             \
           ^
   drivers/media/platform/chips-media/coda-bit.c:1763:24: note: Calling '__=
roundup_pow_of_two'
           ctx->bitstream.size =3D roundup_pow_of_two(q_data->sizeimage * 2=
);
                                 ^
   include/linux/log2.h:180:2: note: expanded from macro 'roundup_pow_of_tw=
o'
           __roundup_pow_of_two(n)                 \
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/log2.h:57:16: note: Calling 'fls_long'
           return 1UL << fls_long(n - 1);
                         ^~~~~~~~~~~~~~~
   include/linux/bitops.h:154:2: note: Taking true branch
           if (sizeof(l) =3D=3D 4)
           ^
   include/linux/bitops.h:155:10: note: Calling 'fls'
                   return fls(l);
                          ^~~~~~
   include/asm-generic/bitops/fls.h:15:2: note: 'r' initialized to 32
           int r =3D 32;
           ^~~~~
   include/asm-generic/bitops/fls.h:17:6: note: Assuming 'x' is not equal t=
o 0, which participates in a condition later
           if (!x)
               ^~
   include/asm-generic/bitops/fls.h:17:2: note: Taking false branch
           if (!x)
           ^
   include/asm-generic/bitops/fls.h:19:6: note: Assuming the condition is f=
alse
           if (!(x & 0xffff0000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:19:2: note: Taking false branch
           if (!(x & 0xffff0000u)) {
           ^
   include/asm-generic/bitops/fls.h:23:6: note: Assuming the condition is f=
alse
           if (!(x & 0xff000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:23:2: note: Taking false branch
           if (!(x & 0xff000000u)) {
           ^
   include/asm-generic/bitops/fls.h:27:6: note: Assuming the condition is f=
alse
           if (!(x & 0xf0000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:27:2: note: Taking false branch
           if (!(x & 0xf0000000u)) {
           ^
   include/asm-generic/bitops/fls.h:31:6: note: Assuming the condition is f=
alse
           if (!(x & 0xc0000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:31:2: note: Taking false branch
           if (!(x & 0xc0000000u)) {
           ^
   include/asm-generic/bitops/fls.h:35:6: note: Assuming the condition is f=
alse
           if (!(x & 0x80000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:35:2: note: Taking false branch
           if (!(x & 0x80000000u)) {
           ^
   include/asm-generic/bitops/fls.h:39:2: note: Returning the value 32 (loa=
ded from 'r')
           return r;
           ^~~~~~~~
   include/linux/bitops.h:155:10: note: Returning from 'fls'
                   return fls(l);

vim +/formats +478 drivers/media/platform/chips-media/coda-common.c

12310819a26aa5 drivers/media/platform/coda/coda-common.c Philipp Zabel 2020=
-03-18  439  =

22e244b813ddd9 drivers/media/platform/coda.c             Philipp Zabel 2014=
-07-18  440  static int coda_enum_fmt(struct file *file, void *priv,
22e244b813ddd9 drivers/media/platform/coda.c             Philipp Zabel 2014=
-07-18  441  			 struct v4l2_fmtdesc *f)
186b250a072537 drivers/media/video/coda.c                Javier Martin 2012=
-07-26  442  {
2c11d1bdfc7175 drivers/media/platform/coda/coda-common.c Philipp Zabel 2014=
-10-02  443  	struct video_device *vdev =3D video_devdata(file);
2c11d1bdfc7175 drivers/media/platform/coda/coda-common.c Philipp Zabel 2014=
-10-02  444  	const struct coda_video_device *cvd =3D to_coda_video_device(=
vdev);
9d826ce8122fc6 drivers/media/platform/coda/coda-common.c Philipp Zabel 2017=
-04-06  445  	struct coda_ctx *ctx =3D fh_to_ctx(priv);
2c11d1bdfc7175 drivers/media/platform/coda/coda-common.c Philipp Zabel 2014=
-10-02  446  	const u32 *formats;
2c11d1bdfc7175 drivers/media/platform/coda/coda-common.c Philipp Zabel 2014=
-10-02  447  =

2c11d1bdfc7175 drivers/media/platform/coda/coda-common.c Philipp Zabel 2014=
-10-02  448  	if (f->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT)
2c11d1bdfc7175 drivers/media/platform/coda/coda-common.c Philipp Zabel 2014=
-10-02  449  		formats =3D cvd->src_formats;
12310819a26aa5 drivers/media/platform/coda/coda-common.c Philipp Zabel 2020=
-03-18  450  	else if (f->type =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE) {
12310819a26aa5 drivers/media/platform/coda/coda-common.c Philipp Zabel 2020=
-03-18  451  		struct coda_q_data *q_data_src;
12310819a26aa5 drivers/media/platform/coda/coda-common.c Philipp Zabel 2020=
-03-18  452  		struct vb2_queue *src_vq;
12310819a26aa5 drivers/media/platform/coda/coda-common.c Philipp Zabel 2020=
-03-18  453  =

2c11d1bdfc7175 drivers/media/platform/coda/coda-common.c Philipp Zabel 2014=
-10-02  454  		formats =3D cvd->dst_formats;
12310819a26aa5 drivers/media/platform/coda/coda-common.c Philipp Zabel 2020=
-03-18  455  =

12310819a26aa5 drivers/media/platform/coda/coda-common.c Philipp Zabel 2020=
-03-18  456  		/*
12310819a26aa5 drivers/media/platform/coda/coda-common.c Philipp Zabel 2020=
-03-18  457  		 * If the source format is already fixed, only allow the same
12310819a26aa5 drivers/media/platform/coda/coda-common.c Philipp Zabel 2020=
-03-18  458  		 * chroma subsampling.
12310819a26aa5 drivers/media/platform/coda/coda-common.c Philipp Zabel 2020=
-03-18  459  		 */
12310819a26aa5 drivers/media/platform/coda/coda-common.c Philipp Zabel 2020=
-03-18  460  		q_data_src =3D get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT);
12310819a26aa5 drivers/media/platform/coda/coda-common.c Philipp Zabel 2020=
-03-18  461  		src_vq =3D v4l2_m2m_get_vq(ctx->fh.m2m_ctx,
12310819a26aa5 drivers/media/platform/coda/coda-common.c Philipp Zabel 2020=
-03-18  462  					 V4L2_BUF_TYPE_VIDEO_OUTPUT);
12310819a26aa5 drivers/media/platform/coda/coda-common.c Philipp Zabel 2020=
-03-18  463  		if (q_data_src->fourcc =3D=3D V4L2_PIX_FMT_JPEG &&
12310819a26aa5 drivers/media/platform/coda/coda-common.c Philipp Zabel 2020=
-03-18  464  		    vb2_is_streaming(src_vq)) {
12310819a26aa5 drivers/media/platform/coda/coda-common.c Philipp Zabel 2020=
-03-18  465  			if (ctx->params.jpeg_chroma_subsampling =3D=3D
12310819a26aa5 drivers/media/platform/coda/coda-common.c Philipp Zabel 2020=
-03-18  466  			    V4L2_JPEG_CHROMA_SUBSAMPLING_420) {
12310819a26aa5 drivers/media/platform/coda/coda-common.c Philipp Zabel 2020=
-03-18  467  				formats =3D coda_formats_420;
12310819a26aa5 drivers/media/platform/coda/coda-common.c Philipp Zabel 2020=
-03-18  468  			} else if (ctx->params.jpeg_chroma_subsampling =3D=3D
12310819a26aa5 drivers/media/platform/coda/coda-common.c Philipp Zabel 2020=
-03-18  469  				   V4L2_JPEG_CHROMA_SUBSAMPLING_422) {
12310819a26aa5 drivers/media/platform/coda/coda-common.c Philipp Zabel 2020=
-03-18  470  				f->pixelformat =3D V4L2_PIX_FMT_YUV422P;
12310819a26aa5 drivers/media/platform/coda/coda-common.c Philipp Zabel 2020=
-03-18  471  				return f->index ? -EINVAL : 0;
12310819a26aa5 drivers/media/platform/coda/coda-common.c Philipp Zabel 2020=
-03-18  472  			}
12310819a26aa5 drivers/media/platform/coda/coda-common.c Philipp Zabel 2020=
-03-18  473  		}
12310819a26aa5 drivers/media/platform/coda/coda-common.c Philipp Zabel 2020=
-03-18  474  	} else {
2c11d1bdfc7175 drivers/media/platform/coda/coda-common.c Philipp Zabel 2014=
-10-02  475  		return -EINVAL;
12310819a26aa5 drivers/media/platform/coda/coda-common.c Philipp Zabel 2020=
-03-18  476  	}
2c11d1bdfc7175 drivers/media/platform/coda/coda-common.c Philipp Zabel 2014=
-10-02  477  =

2c11d1bdfc7175 drivers/media/platform/coda/coda-common.c Philipp Zabel 2014=
-10-02 @478  	if (f->index >=3D CODA_MAX_FORMATS || formats[f->index] =3D=
=3D 0)
2c11d1bdfc7175 drivers/media/platform/coda/coda-common.c Philipp Zabel 2014=
-10-02  479  		return -EINVAL;
186b250a072537 drivers/media/video/coda.c                Javier Martin 2012=
-07-26  480  =

9d826ce8122fc6 drivers/media/platform/coda/coda-common.c Philipp Zabel 2017=
-04-06  481  	/* Skip YUYV if the vdoa is not available */
9d826ce8122fc6 drivers/media/platform/coda/coda-common.c Philipp Zabel 2017=
-04-06  482  	if (!ctx->vdoa && f->type =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE =
&&
9d826ce8122fc6 drivers/media/platform/coda/coda-common.c Philipp Zabel 2017=
-04-06  483  	    formats[f->index] =3D=3D V4L2_PIX_FMT_YUYV)
9d826ce8122fc6 drivers/media/platform/coda/coda-common.c Philipp Zabel 2017=
-04-06  484  		return -EINVAL;
9d826ce8122fc6 drivers/media/platform/coda/coda-common.c Philipp Zabel 2017=
-04-06  485  =

2c11d1bdfc7175 drivers/media/platform/coda/coda-common.c Philipp Zabel 2014=
-10-02  486  	f->pixelformat =3D formats[f->index];
186b250a072537 drivers/media/video/coda.c                Javier Martin 2012=
-07-26  487  =

2c11d1bdfc7175 drivers/media/platform/coda/coda-common.c Philipp Zabel 2014=
-10-02  488  	return 0;
186b250a072537 drivers/media/video/coda.c                Javier Martin 2012=
-07-26  489  }
186b250a072537 drivers/media/video/coda.c                Javier Martin 2012=
-07-26  490  =


:::::: The code at line 478 was first introduced by commit
:::::: 2c11d1bdfc7175cc75a603e433367caaf038ab69 [media] coda: add coda_vide=
o_device descriptors

:::::: TO: Philipp Zabel <p.zabel@pengutronix.de>
:::::: CC: Mauro Carvalho Chehab <mchehab@osg.samsung.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8135707306136003517==--


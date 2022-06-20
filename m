Content-Type: multipart/mixed; boundary="===============4961691850802859715=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [dgc-xfs:xfs-cil-scale-3 13/14] fs/xfs/xfs_log_cil.c:1334:2: warning: Value stored to 'ticket' is never read [clang-analyzer-deadcode.DeadStores]
Date: Mon, 20 Jun 2022 21:37:02 +0800
Message-ID: <202206202149.8pTmnF4U-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4961691850802859715==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: fs/xfs/xf=
s_log_cil.c:1334:2: warning: Value stored to 'ticket' is never read [clang-=
analyzer-deadcode.DeadStores]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Dave Chinner <david@fromorbit.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dgc/linux-xfs.git x=
fs-cil-scale-3
head:   ad73ee47aee4c062c9b18a401fb3a57445afef62
commit: 764cba47b511f8e16c2c2d6b2365e55935eaa2fd [13/14] xfs: xlog_sync() m=
anually adjusts grant head space
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: arm-randconfig-c002-20220619 (https://download.01.org/0day-ci/archi=
ve/20220620/202206202149.8pTmnF4U-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 916887=
16ba49942051dccdf7b9c4f81a7ec8feaf)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/dgc/linux-xfs.git=
/commit/?id=3D764cba47b511f8e16c2c2d6b2365e55935eaa2fd
        git remote add dgc-xfs https://git.kernel.org/pub/scm/linux/kernel/=
git/dgc/linux-xfs.git
        git fetch --no-tags dgc-xfs xfs-cil-scale-3
        git checkout 764cba47b511f8e16c2c2d6b2365e55935eaa2fd
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hid.h:1031:2: note: Control jumps to 'case 1:'  at line 10=
40
           switch (type) {
           ^
   include/linux/hid.h:1043:3: note:  Execution continues on line 1054
                   break;
                   ^
   include/linux/hid.h:1054:15: note: 'c' is <=3D 'limit'
           if (unlikely(c > limit || !bmap)) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/hid.h:1054:15: note: Left side of '||' is false
           if (unlikely(c > limit || !bmap)) {
                        ^
   include/linux/hid.h:1054:28: note: Assuming 'bmap' is null
           if (unlikely(c > limit || !bmap)) {
                                     ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/hid.h:1054:28: note: Assuming pointer value is null
           if (unlikely(c > limit || !bmap)) {
                                     ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/hid.h:1054:2: note: Taking true branch
           if (unlikely(c > limit || !bmap)) {
           ^
   include/linux/hid.h:1055:3: note: Assuming the condition is true
                   pr_warn_ratelimited("%s: Invalid code %d type %d\n",
                   ^
   include/linux/printk.h:685:2: note: expanded from macro 'pr_warn_ratelim=
ited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:668:6: note: expanded from macro 'printk_ratelimi=
ted'
           if (__ratelimit(&_rs))                                          \
               ^~~~~~~~~~~~~~~~~
   include/linux/ratelimit_types.h:41:28: note: expanded from macro '__rate=
limit'
   #define __ratelimit(state) ___ratelimit(state, __func__)
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hid.h:1055:3: note: Taking true branch
                   pr_warn_ratelimited("%s: Invalid code %d type %d\n",
                   ^
   include/linux/printk.h:685:2: note: expanded from macro 'pr_warn_ratelim=
ited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:668:2: note: expanded from macro 'printk_ratelimi=
ted'
           if (__ratelimit(&_rs))                                          \
           ^
   include/linux/hid.h:1055:3: note: Loop condition is false.  Exiting loop
                   pr_warn_ratelimited("%s: Invalid code %d type %d\n",
                   ^
   include/linux/printk.h:685:2: note: expanded from macro 'pr_warn_ratelim=
ited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:669:3: note: expanded from macro 'printk_ratelimi=
ted'
                   printk(fmt, ##__VA_ARGS__);                             \
                   ^
   include/linux/printk.h:475:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:446:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:421:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   include/linux/hid.h:1056:9: note: Access to field 'name' results in a de=
reference of a null pointer (loaded from variable 'input')
                                       input->name, c, type);
                                       ^
   include/linux/printk.h:685:49: note: expanded from macro 'pr_warn_rateli=
mited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
                                                          ^~~~~~~~~~~
   include/linux/printk.h:669:17: note: expanded from macro 'printk_ratelim=
ited'
                   printk(fmt, ##__VA_ARGS__);                             \
                                 ^~~~~~~~~~~
   include/linux/printk.h:475:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                              ^~~~~~~~~~~
   include/linux/printk.h:447:19: note: expanded from macro 'printk_index_w=
rap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                                   ^~~~~~~~~~~
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
   fs/xfs/xfs_log_cil.c:340:4: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(lv, 0, xlog_cil_iovec_space(niovecs));
                           ^~~~~~
   fs/xfs/xfs_log_cil.c:340:4: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
                           memset(lv, 0, xlog_cil_iovec_space(niovecs));
                           ^~~~~~
   fs/xfs/xfs_log_cil.c:1048:2: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(hdr, 0, sizeof(*hdr));
           ^~~~~~
   fs/xfs/xfs_log_cil.c:1048:2: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
           memset(hdr, 0, sizeof(*hdr));
           ^~~~~~
>> fs/xfs/xfs_log_cil.c:1334:2: warning: Value stored to 'ticket' is never =
read [clang-analyzer-deadcode.DeadStores]
           ticket =3D ctx->ticket;
           ^        ~~~~~~~~~~~
   fs/xfs/xfs_log_cil.c:1334:2: note: Value stored to 'ticket' is never read
           ticket =3D ctx->ticket;
           ^        ~~~~~~~~~~~
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   fs/xfs/xfs_bmap_item.c:593:2: warning: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buip->bui_format.bui_extents, extp, count * sizeof(*extp)=
);
           ^~~~~~
   fs/xfs/xfs_bmap_item.c:593:2: note: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11
           memcpy(buip->bui_format.bui_extents, extp, count * sizeof(*extp)=
);
           ^~~~~~
   fs/xfs/xfs_bmap_item.c:628:3: warning: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(dst_bui_fmt, src_bui_fmt, len);
                   ^~~~~~
   fs/xfs/xfs_bmap_item.c:628:3: note: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11
                   memcpy(dst_bui_fmt, src_bui_fmt, len);
                   ^~~~~~
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   drivers/gpu/drm/drm_crtc.c:289:2: warning: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(crtc->timeline_name, sizeof(crtc->timeline_name),
           ^~~~~~~~
   drivers/gpu/drm/drm_crtc.c:289:2: note: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11
           snprintf(crtc->timeline_name, sizeof(crtc->timeline_name),
           ^~~~~~~~
   drivers/gpu/drm/drm_crtc.c:450:2: warning: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(crtc, 0, sizeof(*crtc));
           ^~~~~~
   drivers/gpu/drm/drm_crtc.c:450:2: note: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11
           memset(crtc, 0, sizeof(*crtc));
           ^~~~~~
   drivers/gpu/drm/drm_crtc.c:611:29: warning: Access to field 'rotation' r=
esults in a dereference of a null pointer (loaded from field 'state') [clan=
g-analyzer-core.NullDereference]
               drm_rotation_90_or_270(crtc->primary->state->rotation))
                                      ^
   drivers/gpu/drm/drm_crtc.c:649:2: note: Taking false branch
           if (!drm_core_check_feature(dev, DRIVER_MODESET))
           ^
   drivers/gpu/drm/drm_crtc.c:656:6: note: Assuming the condition is false
           if (crtc_req->x & 0xffff0000 || crtc_req->y & 0xffff0000)
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_crtc.c:656:6: note: Left side of '||' is false
   drivers/gpu/drm/drm_crtc.c:656:34: note: Assuming the condition is false
           if (crtc_req->x & 0xffff0000 || crtc_req->y & 0xffff0000)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_crtc.c:656:2: note: Taking false branch
           if (crtc_req->x & 0xffff0000 || crtc_req->y & 0xffff0000)
           ^
   drivers/gpu/drm/drm_crtc.c:660:7: note: 'crtc' is non-null
           if (!crtc) {
                ^~~~
   drivers/gpu/drm/drm_crtc.c:660:2: note: Taking false branch
           if (!crtc) {
           ^
   drivers/gpu/drm/drm_crtc.c:669:6: note: Assuming field 'mode_valid' is n=
ot equal to 0
           if (crtc_req->mode_valid && !drm_lease_held(file_priv, plane->ba=
se.id))
               ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_crtc.c:669:6: note: Left side of '&&' is true
   drivers/gpu/drm/drm_crtc.c:669:30: note: Assuming the condition is false
           if (crtc_req->mode_valid && !drm_lease_held(file_priv, plane->ba=
se.id))
                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/gpu/drm/drm_crtc.c:669:2: note: Taking false branch
           if (crtc_req->mode_valid && !drm_lease_held(file_priv, plane->ba=
se.id))
           ^
   drivers/gpu/drm/drm_crtc.c:672:2: note: Taking false branch
           DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx,
           ^
   include/drm/drm_modeset_lock.h:176:2: note: expanded from macro 'DRM_MOD=
ESET_LOCK_ALL_BEGIN'
           if (!drm_drv_uses_atomic_modeset(dev))                          \
           ^
   drivers/gpu/drm/drm_crtc.c:673:43: note: Assuming 'ret' is 0
                                      DRM_MODESET_ACQUIRE_INTERRUPTIBLE, re=
t);
                                                                         ^
   include/drm/drm_modeset_lock.h:181:6: note: expanded from macro 'DRM_MOD=
ESET_LOCK_ALL_BEGIN'
           if (ret)                                                        \
               ^~~
   drivers/gpu/drm/drm_crtc.c:672:2: note: Taking false branch
           DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx,
           ^
   include/drm/drm_modeset_lock.h:181:2: note: expanded from macro 'DRM_MOD=
ESET_LOCK_ALL_BEGIN'
           if (ret)                                                        \
           ^
   drivers/gpu/drm/drm_crtc.c:675:16: note: Field 'mode_valid' is not equal=
 to 0
           if (crtc_req->mode_valid) {
                         ^
   drivers/gpu/drm/drm_crtc.c:675:2: note: Taking true branch
           if (crtc_req->mode_valid) {
           ^
   drivers/gpu/drm/drm_crtc.c:678:7: note: Assuming the condition is true
                   if (crtc_req->fb_id =3D=3D -1) {
                       ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_crtc.c:678:3: note: Taking true branch
                   if (crtc_req->fb_id =3D=3D -1) {
                   ^
   drivers/gpu/drm/drm_crtc.c:681:8: note: Assuming field 'state' is null
                           if (plane->state)
                               ^~~~~~~~~~~~

vim +/ticket +1334 fs/xfs/xfs_log_cil.c

0d227466be8433 Dave Chinner      2022-05-04  1160  =

71e330b593905e Dave Chinner      2010-05-21  1161  /*
c7cc296ddd1f6d Christoph Hellwig 2020-03-20  1162   * Push the Committed It=
em List to the log.
c7cc296ddd1f6d Christoph Hellwig 2020-03-20  1163   *
c7cc296ddd1f6d Christoph Hellwig 2020-03-20  1164   * If the current sequen=
ce is the same as xc_push_seq we need to do a flush. If
c7cc296ddd1f6d Christoph Hellwig 2020-03-20  1165   * xc_push_seq is less t=
han the current sequence, then it has already been
a44f13edf0ebb4 Dave Chinner      2010-08-24  1166   * flushed and we don't =
need to do anything - the caller will wait for it to
a44f13edf0ebb4 Dave Chinner      2010-08-24  1167   * complete if necessary.
a44f13edf0ebb4 Dave Chinner      2010-08-24  1168   *
c7cc296ddd1f6d Christoph Hellwig 2020-03-20  1169   * xc_push_seq is checke=
d unlocked against the sequence number for a match.
c7cc296ddd1f6d Christoph Hellwig 2020-03-20  1170   * Hence we can allow lo=
g forces to run racily and not issue pushes for the
c7cc296ddd1f6d Christoph Hellwig 2020-03-20  1171   * same sequence twice. =
 If we get a race between multiple pushes for the same
c7cc296ddd1f6d Christoph Hellwig 2020-03-20  1172   * sequence they will bl=
ock on the first one and then abort, hence avoiding
c7cc296ddd1f6d Christoph Hellwig 2020-03-20  1173   * needless pushes.
c7cc296ddd1f6d Christoph Hellwig 2020-03-20  1174   */
c7cc296ddd1f6d Christoph Hellwig 2020-03-20  1175  static void
c7cc296ddd1f6d Christoph Hellwig 2020-03-20  1176  xlog_cil_push_work(
c7cc296ddd1f6d Christoph Hellwig 2020-03-20  1177  	struct work_struct	*wor=
k)
71e330b593905e Dave Chinner      2010-05-21  1178  {
39823d0fac9416 Dave Chinner      2021-08-10  1179  	struct xfs_cil_ctx	*ctx=
 =3D
39823d0fac9416 Dave Chinner      2021-08-10  1180  		container_of(work, str=
uct xfs_cil_ctx, push_work);
39823d0fac9416 Dave Chinner      2021-08-10  1181  	struct xfs_cil		*cil =
=3D ctx->cil;
c7cc296ddd1f6d Christoph Hellwig 2020-03-20  1182  	struct xlog		*log =3D c=
il->xc_log;
71e330b593905e Dave Chinner      2010-05-21  1183  	struct xfs_cil_ctx	*new=
_ctx;
d80fc2914f9125 Dave Chinner      2022-04-21  1184  	int			num_iovecs =3D 0;
d80fc2914f9125 Dave Chinner      2022-04-21  1185  	int			num_bytes =3D 0;
71e330b593905e Dave Chinner      2010-05-21  1186  	int			error =3D 0;
735fbf67df56f4 Dave Chinner      2022-04-21  1187  	struct xlog_cil_trans_h=
dr thdr;
f0bb9aa8fa53b5 Dave Chinner      2022-06-13  1188  	struct xfs_log_vec	lvhd=
r =3D {};
0dc8f7f139f07a Dave Chinner      2021-07-27  1189  	xfs_csn_t		push_seq;
0020a190cf3eac Dave Chinner      2021-08-10  1190  	bool			push_commit_stab=
le;
0d227466be8433 Dave Chinner      2022-05-04  1191  	LIST_HEAD		(whiteouts);
764cba47b511f8 Dave Chinner      2022-06-13  1192  	struct xlog_ticket	*tic=
ket;
71e330b593905e Dave Chinner      2010-05-21  1193  =

39823d0fac9416 Dave Chinner      2021-08-10  1194  	new_ctx =3D xlog_cil_ct=
x_alloc();
71e330b593905e Dave Chinner      2010-05-21  1195  	new_ctx->ticket =3D xlo=
g_cil_ticket_alloc(log);
71e330b593905e Dave Chinner      2010-05-21  1196  =

71e330b593905e Dave Chinner      2010-05-21  1197  	down_write(&cil->xc_ctx=
_lock);
71e330b593905e Dave Chinner      2010-05-21  1198  =

4bb928cdb900d0 Dave Chinner      2013-08-12  1199  	spin_lock(&cil->xc_push=
_lock);
4c2d542f2e7865 Dave Chinner      2012-04-23  1200  	push_seq =3D cil->xc_pu=
sh_seq;
4c2d542f2e7865 Dave Chinner      2012-04-23  1201  	ASSERT(push_seq <=3D ct=
x->sequence);
0020a190cf3eac Dave Chinner      2021-08-10  1202  	push_commit_stable =3D =
cil->xc_push_commit_stable;
0020a190cf3eac Dave Chinner      2021-08-10  1203  	cil->xc_push_commit_sta=
ble =3D false;
71e330b593905e Dave Chinner      2010-05-21  1204  =

0e7ab7efe77451 Dave Chinner      2020-03-24  1205  	/*
19f4e7cc819771 Dave Chinner      2021-06-18  1206  	 * As we are about to s=
witch to a new, empty CIL context, we no longer
19f4e7cc819771 Dave Chinner      2021-06-18  1207  	 * need to throttle tas=
ks on CIL space overruns. Wake any waiters that
19f4e7cc819771 Dave Chinner      2021-06-18  1208  	 * the hard push thrott=
le may have caught so they can start committing
19f4e7cc819771 Dave Chinner      2021-06-18  1209  	 * to the new context. =
The ctx->xc_push_lock provides the serialisation
19f4e7cc819771 Dave Chinner      2021-06-18  1210  	 * necessary for safely=
 using the lockless waitqueue_active() check in
19f4e7cc819771 Dave Chinner      2021-06-18  1211  	 * this context.
19f4e7cc819771 Dave Chinner      2021-06-18  1212  	 */
19f4e7cc819771 Dave Chinner      2021-06-18  1213  	if (waitqueue_active(&c=
il->xc_push_wait))
c7f87f3984cfa1 Dave Chinner      2020-06-16  1214  		wake_up_all(&cil->xc_p=
ush_wait);
0e7ab7efe77451 Dave Chinner      2020-03-24  1215  =

d82e96ea2e5764 Dave Chinner      2022-06-13  1216  	xlog_cil_push_pcp_aggre=
gate(cil, ctx);
d82e96ea2e5764 Dave Chinner      2022-06-13  1217  =

4c2d542f2e7865 Dave Chinner      2012-04-23  1218  	/*
4c2d542f2e7865 Dave Chinner      2012-04-23  1219  	 * Check if we've anyth=
ing to push. If there is nothing, then we don't
4c2d542f2e7865 Dave Chinner      2012-04-23  1220  	 * move on to a new seq=
uence number and so we have to be able to push
4c2d542f2e7865 Dave Chinner      2012-04-23  1221  	 * this sequence again =
later.
4c2d542f2e7865 Dave Chinner      2012-04-23  1222  	 */
bb850b5bcf8dba Dave Chinner      2022-06-13  1223  	if (test_bit(XLOG_CIL_E=
MPTY, &cil->xc_flags)) {
4c2d542f2e7865 Dave Chinner      2012-04-23  1224  		cil->xc_push_seq =3D 0;
4bb928cdb900d0 Dave Chinner      2013-08-12  1225  		spin_unlock(&cil->xc_p=
ush_lock);
a44f13edf0ebb4 Dave Chinner      2010-08-24  1226  		goto out_skip;
4c2d542f2e7865 Dave Chinner      2012-04-23  1227  	}
4c2d542f2e7865 Dave Chinner      2012-04-23  1228  =

a44f13edf0ebb4 Dave Chinner      2010-08-24  1229  =

cf085a1b5d2214 Joe Perches       2019-11-07  1230  	/* check for a previous=
ly pushed sequence */
39823d0fac9416 Dave Chinner      2021-08-10  1231  	if (push_seq < ctx->seq=
uence) {
8af3dcd3c89aef Dave Chinner      2014-09-23  1232  		spin_unlock(&cil->xc_p=
ush_lock);
df806158b0f6eb Dave Chinner      2010-05-17  1233  		goto out_skip;
8af3dcd3c89aef Dave Chinner      2014-09-23  1234  	}
8af3dcd3c89aef Dave Chinner      2014-09-23  1235  =

8af3dcd3c89aef Dave Chinner      2014-09-23  1236  	/*
8af3dcd3c89aef Dave Chinner      2014-09-23  1237  	 * We are now going to =
push this context, so add it to the committing
8af3dcd3c89aef Dave Chinner      2014-09-23  1238  	 * list before we do an=
ything else. This ensures that anyone waiting on
8af3dcd3c89aef Dave Chinner      2014-09-23  1239  	 * this push can easily=
 detect the difference between a "push in
8af3dcd3c89aef Dave Chinner      2014-09-23  1240  	 * progress" and "CIL i=
s empty, nothing to do".
8af3dcd3c89aef Dave Chinner      2014-09-23  1241  	 *
8af3dcd3c89aef Dave Chinner      2014-09-23  1242  	 * IOWs, a wait loop ca=
n now check for:
8af3dcd3c89aef Dave Chinner      2014-09-23  1243  	 *	the current sequence=
 not being found on the committing list;
8af3dcd3c89aef Dave Chinner      2014-09-23  1244  	 *	an empty CIL; and
8af3dcd3c89aef Dave Chinner      2014-09-23  1245  	 *	an unchanged sequenc=
e number
8af3dcd3c89aef Dave Chinner      2014-09-23  1246  	 * to detect a push tha=
t had nothing to do and therefore does not need
8af3dcd3c89aef Dave Chinner      2014-09-23  1247  	 * waiting on. If the C=
IL is not empty, we get put on the committing
8af3dcd3c89aef Dave Chinner      2014-09-23  1248  	 * list before emptying=
 the CIL and bumping the sequence number. Hence
8af3dcd3c89aef Dave Chinner      2014-09-23  1249  	 * an empty CIL and an =
unchanged sequence number means we jumped out
8af3dcd3c89aef Dave Chinner      2014-09-23  1250  	 * above after doing no=
thing.
8af3dcd3c89aef Dave Chinner      2014-09-23  1251  	 *
8af3dcd3c89aef Dave Chinner      2014-09-23  1252  	 * Hence the waiter wil=
l either find the commit sequence on the
8af3dcd3c89aef Dave Chinner      2014-09-23  1253  	 * committing list or t=
he sequence number will be unchanged and the CIL
8af3dcd3c89aef Dave Chinner      2014-09-23  1254  	 * still dirty. In that=
 latter case, the push has not yet started, and
8af3dcd3c89aef Dave Chinner      2014-09-23  1255  	 * so the waiter will h=
ave to continue trying to check the CIL
8af3dcd3c89aef Dave Chinner      2014-09-23  1256  	 * committing list unti=
l it is found. In extreme cases of delay, the
8af3dcd3c89aef Dave Chinner      2014-09-23  1257  	 * sequence may fully c=
ommit between the attempts the wait makes to wait
8af3dcd3c89aef Dave Chinner      2014-09-23  1258  	 * on the commit sequen=
ce.
8af3dcd3c89aef Dave Chinner      2014-09-23  1259  	 */
8af3dcd3c89aef Dave Chinner      2014-09-23  1260  	list_add(&ctx->committi=
ng, &cil->xc_committing);
8af3dcd3c89aef Dave Chinner      2014-09-23  1261  	spin_unlock(&cil->xc_pu=
sh_lock);
df806158b0f6eb Dave Chinner      2010-05-17  1262  =

586764484631ac Dave Chinner      2022-06-13  1263  	xlog_cil_build_lv_chain=
(ctx, &whiteouts, &num_iovecs, &num_bytes);
71e330b593905e Dave Chinner      2010-05-21  1264  =

71e330b593905e Dave Chinner      2010-05-21  1265  	/*
39823d0fac9416 Dave Chinner      2021-08-10  1266  	 * Switch the contexts =
so we can drop the context lock and move out
71e330b593905e Dave Chinner      2010-05-21  1267  	 * of a shared context.=
 We can't just go straight to the commit record,
71e330b593905e Dave Chinner      2010-05-21  1268  	 * though - we need to =
synchronise with previous and future commits so
71e330b593905e Dave Chinner      2010-05-21  1269  	 * that the commit reco=
rds are correctly ordered in the log to ensure
71e330b593905e Dave Chinner      2010-05-21  1270  	 * that we process item=
s during log IO completion in the correct order.
71e330b593905e Dave Chinner      2010-05-21  1271  	 *
71e330b593905e Dave Chinner      2010-05-21  1272  	 * For example, if we g=
et an EFI in one checkpoint and the EFD in the
71e330b593905e Dave Chinner      2010-05-21  1273  	 * next (e.g. due to lo=
g forces), we do not want the checkpoint with
71e330b593905e Dave Chinner      2010-05-21  1274  	 * the EFD to be commit=
ted before the checkpoint with the EFI.  Hence
71e330b593905e Dave Chinner      2010-05-21  1275  	 * we must strictly ord=
er the commit records of the checkpoints so
71e330b593905e Dave Chinner      2010-05-21  1276  	 * that: a) the checkpo=
int callbacks are attached to the iclogs in the
71e330b593905e Dave Chinner      2010-05-21  1277  	 * correct order; and b=
) the checkpoints are replayed in correct order
71e330b593905e Dave Chinner      2010-05-21  1278  	 * in log recovery.
71e330b593905e Dave Chinner      2010-05-21  1279  	 *
71e330b593905e Dave Chinner      2010-05-21  1280  	 * Hence we need to add=
 this context to the committing context list so
71e330b593905e Dave Chinner      2010-05-21  1281  	 * that higher sequence=
s will wait for us to write out a commit record
71e330b593905e Dave Chinner      2010-05-21  1282  	 * before they do.
f876e44603ad09 Dave Chinner      2014-02-27  1283  	 *
5f9b4b0de8dc2f Dave Chinner      2021-06-18  1284  	 * xfs_log_force_seq re=
quires us to mirror the new sequence into the cil
f876e44603ad09 Dave Chinner      2014-02-27  1285  	 * structure atomically=
 with the addition of this sequence to the
f876e44603ad09 Dave Chinner      2014-02-27  1286  	 * committing list. Thi=
s also ensures that we can do unlocked checks
f876e44603ad09 Dave Chinner      2014-02-27  1287  	 * against the current =
sequence in log forces without risking
f876e44603ad09 Dave Chinner      2014-02-27  1288  	 * deferencing a freed =
context pointer.
71e330b593905e Dave Chinner      2010-05-21  1289  	 */
4bb928cdb900d0 Dave Chinner      2013-08-12  1290  	spin_lock(&cil->xc_push=
_lock);
39823d0fac9416 Dave Chinner      2021-08-10  1291  	xlog_cil_ctx_switch(cil=
, new_ctx);
4bb928cdb900d0 Dave Chinner      2013-08-12  1292  	spin_unlock(&cil->xc_pu=
sh_lock);
71e330b593905e Dave Chinner      2010-05-21  1293  	up_write(&cil->xc_ctx_l=
ock);
71e330b593905e Dave Chinner      2010-05-21  1294  =

aa8c50b5c48e59 Dave Chinner      2022-06-13  1295  	/*
aa8c50b5c48e59 Dave Chinner      2022-06-13  1296  	 * Sort the log vector =
chain before we add the transaction headers.
aa8c50b5c48e59 Dave Chinner      2022-06-13  1297  	 * This ensures we alwa=
ys have the transaction headers at the start
aa8c50b5c48e59 Dave Chinner      2022-06-13  1298  	 * of the chain.
aa8c50b5c48e59 Dave Chinner      2022-06-13  1299  	 */
aa8c50b5c48e59 Dave Chinner      2022-06-13  1300  	list_sort(NULL, &ctx->l=
v_chain, xlog_cil_order_cmp);
aa8c50b5c48e59 Dave Chinner      2022-06-13  1301  =

71e330b593905e Dave Chinner      2010-05-21  1302  	/*
71e330b593905e Dave Chinner      2010-05-21  1303  	 * Build a checkpoint t=
ransaction header and write it to the log to
71e330b593905e Dave Chinner      2010-05-21  1304  	 * begin the transactio=
n. We need to account for the space used by the
71e330b593905e Dave Chinner      2010-05-21  1305  	 * transaction header h=
ere as it is not accounted for in xlog_write().
f0bb9aa8fa53b5 Dave Chinner      2022-06-13  1306  	 * Add the lvhdr to the=
 head of the lv chain we pass to xlog_write() so
f0bb9aa8fa53b5 Dave Chinner      2022-06-13  1307  	 * it gets written into=
 the iclog first.
71e330b593905e Dave Chinner      2010-05-21  1308  	 */
735fbf67df56f4 Dave Chinner      2022-04-21  1309  	xlog_cil_build_trans_hd=
r(ctx, &thdr, &lvhdr, num_iovecs);
d80fc2914f9125 Dave Chinner      2022-04-21  1310  	num_bytes +=3D lvhdr.lv=
_bytes;
f0bb9aa8fa53b5 Dave Chinner      2022-06-13  1311  	list_add(&lvhdr.lv_list=
, &ctx->lv_chain);
71e330b593905e Dave Chinner      2010-05-21  1312  =

f0bb9aa8fa53b5 Dave Chinner      2022-06-13  1313  	/*
f0bb9aa8fa53b5 Dave Chinner      2022-06-13  1314  	 * Take the lvhdr back =
off the lv_chain immediately after calling
f0bb9aa8fa53b5 Dave Chinner      2022-06-13  1315  	 * xlog_cil_write_chain=
() as it should not be passed to log IO
f0bb9aa8fa53b5 Dave Chinner      2022-06-13  1316  	 * completion.
f0bb9aa8fa53b5 Dave Chinner      2022-06-13  1317  	 */
f0bb9aa8fa53b5 Dave Chinner      2022-06-13  1318  	error =3D xlog_cil_writ=
e_chain(ctx, num_bytes);
f0bb9aa8fa53b5 Dave Chinner      2022-06-13  1319  	list_del(&lvhdr.lv_list=
);
bf034bc827807a Dave Chinner      2021-08-10  1320  	if (error)
ac983517ec5941 Dave Chinner      2014-05-07  1321  		goto out_abort_free_ti=
cket;
71e330b593905e Dave Chinner      2010-05-21  1322  =

caa80090d17c89 Dave Chinner      2021-08-10  1323  	error =3D xlog_cil_writ=
e_commit_record(ctx);
dd401770b0ff68 Dave Chinner      2020-03-25  1324  	if (error)
dd401770b0ff68 Dave Chinner      2020-03-25  1325  		goto out_abort_free_ti=
cket;
dd401770b0ff68 Dave Chinner      2020-03-25  1326  =

764cba47b511f8 Dave Chinner      2022-06-13  1327  	/*
764cba47b511f8 Dave Chinner      2022-06-13  1328  	 * Grab the ticket from=
 the ctx so we can ungrant it after releasing the
764cba47b511f8 Dave Chinner      2022-06-13  1329  	 * commit_iclog. The ct=
x may be freed by the time we return from
764cba47b511f8 Dave Chinner      2022-06-13  1330  	 * releasing the commit=
_iclog (i.e. checkpoint has been completed and
764cba47b511f8 Dave Chinner      2022-06-13  1331  	 * callback run) so we =
can't reference the ctx after the call to
764cba47b511f8 Dave Chinner      2022-06-13  1332  	 * xlog_state_release_i=
clog().
764cba47b511f8 Dave Chinner      2022-06-13  1333  	 */
764cba47b511f8 Dave Chinner      2022-06-13 @1334  	ticket =3D ctx->ticket;
71e330b593905e Dave Chinner      2010-05-21  1335  =

a79b28c284fd91 Dave Chinner      2021-06-18  1336  	/*
1effb72a8179a0 Dave Chinner      2021-06-25  1337  	 * If the checkpoint sp=
ans multiple iclogs, wait for all previous iclogs
1effb72a8179a0 Dave Chinner      2021-06-25  1338  	 * to complete before w=
e submit the commit_iclog. We can't use state
1effb72a8179a0 Dave Chinner      2021-06-25  1339  	 * checks for this - AC=
TIVE can be either a past completed iclog or a
1effb72a8179a0 Dave Chinner      2021-06-25  1340  	 * future iclog being f=
illed, while WANT_SYNC through SYNC_DONE can be a
1effb72a8179a0 Dave Chinner      2021-06-25  1341  	 * past or future iclog=
 awaiting IO or ordered IO completion to be run.
1effb72a8179a0 Dave Chinner      2021-06-25  1342  	 * In the latter case, =
if it's a future iclog and we wait on it, the we
1effb72a8179a0 Dave Chinner      2021-06-25  1343  	 * will hang because it=
 won't get processed through to ic_force_wait
1effb72a8179a0 Dave Chinner      2021-06-25  1344  	 * wakeup until this co=
mmit_iclog is written to disk.  Hence we use the
1effb72a8179a0 Dave Chinner      2021-06-25  1345  	 * iclog header lsn and=
 compare it to the commit lsn to determine if we
1effb72a8179a0 Dave Chinner      2021-06-25  1346  	 * need to wait on iclo=
gs or not.
a79b28c284fd91 Dave Chinner      2021-06-18  1347  	 */
caa80090d17c89 Dave Chinner      2021-08-10  1348  	spin_lock(&log->l_iclog=
lock);
c45aba40cf5b29 Dave Chinner      2021-08-10  1349  	if (ctx->start_lsn !=3D=
 ctx->commit_lsn) {
1effb72a8179a0 Dave Chinner      2021-06-25  1350  		xfs_lsn_t	plsn;
1effb72a8179a0 Dave Chinner      2021-06-25  1351  =

caa80090d17c89 Dave Chinner      2021-08-10  1352  		plsn =3D be64_to_cpu(c=
tx->commit_iclog->ic_prev->ic_header.h_lsn);
c45aba40cf5b29 Dave Chinner      2021-08-10  1353  		if (plsn && XFS_LSN_CM=
P(plsn, ctx->commit_lsn) < 0) {
1effb72a8179a0 Dave Chinner      2021-06-25  1354  			/*
1effb72a8179a0 Dave Chinner      2021-06-25  1355  			 * Waiting on ic_forc=
e_wait orders the completion of
1effb72a8179a0 Dave Chinner      2021-06-25  1356  			 * iclogs older than =
ic_prev. Hence we only need to wait
1effb72a8179a0 Dave Chinner      2021-06-25  1357  			 * on the most recent=
 older iclog here.
1effb72a8179a0 Dave Chinner      2021-06-25  1358  			 */
caa80090d17c89 Dave Chinner      2021-08-10  1359  			xlog_wait_on_iclog(ct=
x->commit_iclog->ic_prev);
eef983ffeae7a1 Dave Chinner      2021-06-18  1360  			spin_lock(&log->l_icl=
oglock);
1effb72a8179a0 Dave Chinner      2021-06-25  1361  		}
1effb72a8179a0 Dave Chinner      2021-06-25  1362  =

1effb72a8179a0 Dave Chinner      2021-06-25  1363  		/*
1effb72a8179a0 Dave Chinner      2021-06-25  1364  		 * We need to issue a =
pre-flush so that the ordering for this
1effb72a8179a0 Dave Chinner      2021-06-25  1365  		 * checkpoint is corre=
ctly preserved down to stable storage.
1effb72a8179a0 Dave Chinner      2021-06-25  1366  		 */
caa80090d17c89 Dave Chinner      2021-08-10  1367  		ctx->commit_iclog->ic_=
flags |=3D XLOG_ICL_NEED_FLUSH;
a79b28c284fd91 Dave Chinner      2021-06-18  1368  	}
a79b28c284fd91 Dave Chinner      2021-06-18  1369  =

eef983ffeae7a1 Dave Chinner      2021-06-18  1370  	/*
eef983ffeae7a1 Dave Chinner      2021-06-18  1371  	 * The commit iclog mus=
t be written to stable storage to guarantee
eef983ffeae7a1 Dave Chinner      2021-06-18  1372  	 * journal IO vs metada=
ta writeback IO is correctly ordered on stable
eef983ffeae7a1 Dave Chinner      2021-06-18  1373  	 * storage.
0020a190cf3eac Dave Chinner      2021-08-10  1374  	 *
0020a190cf3eac Dave Chinner      2021-08-10  1375  	 * If the push caller n=
eeds the commit to be immediately stable and the
0020a190cf3eac Dave Chinner      2021-08-10  1376  	 * commit_iclog is not =
yet marked as XLOG_STATE_WANT_SYNC to indicate it
0020a190cf3eac Dave Chinner      2021-08-10  1377  	 * will be written when=
 released, switch it's state to WANT_SYNC right
0020a190cf3eac Dave Chinner      2021-08-10  1378  	 * now.
eef983ffeae7a1 Dave Chinner      2021-06-18  1379  	 */
caa80090d17c89 Dave Chinner      2021-08-10  1380  	ctx->commit_iclog->ic_f=
lags |=3D XLOG_ICL_NEED_FUA;
0020a190cf3eac Dave Chinner      2021-08-10  1381  	if (push_commit_stable =
&&
0020a190cf3eac Dave Chinner      2021-08-10  1382  	    ctx->commit_iclog->=
ic_state =3D=3D XLOG_STATE_ACTIVE)
0020a190cf3eac Dave Chinner      2021-08-10  1383  		xlog_state_switch_iclo=
gs(log, ctx->commit_iclog, 0);
764cba47b511f8 Dave Chinner      2022-06-13  1384  	ticket =3D ctx->ticket;
764cba47b511f8 Dave Chinner      2022-06-13  1385  	xlog_state_release_iclo=
g(log, ctx->commit_iclog, ticket);
502a01fac09834 Dave Chinner      2021-08-10  1386  =

502a01fac09834 Dave Chinner      2021-08-10  1387  	/* Not safe to referenc=
e ctx now! */
502a01fac09834 Dave Chinner      2021-08-10  1388  =

eef983ffeae7a1 Dave Chinner      2021-06-18  1389  	spin_unlock(&log->l_icl=
oglock);
0d227466be8433 Dave Chinner      2022-05-04  1390  	xlog_cil_cleanup_whiteo=
uts(&whiteouts);
764cba47b511f8 Dave Chinner      2022-06-13  1391  	xfs_log_ticket_ungrant(=
log, ticket);
c7cc296ddd1f6d Christoph Hellwig 2020-03-20  1392  	return;
71e330b593905e Dave Chinner      2010-05-21  1393  =

71e330b593905e Dave Chinner      2010-05-21  1394  out_skip:
71e330b593905e Dave Chinner      2010-05-21  1395  	up_write(&cil->xc_ctx_l=
ock);
71e330b593905e Dave Chinner      2010-05-21  1396  	xfs_log_ticket_put(new_=
ctx->ticket);
71e330b593905e Dave Chinner      2010-05-21  1397  	kmem_free(new_ctx);
c7cc296ddd1f6d Christoph Hellwig 2020-03-20  1398  	return;
71e330b593905e Dave Chinner      2010-05-21  1399  =

7db37c5e6575b2 Dave Chinner      2011-01-27  1400  out_abort_free_ticket:
2039a272300b94 Dave Chinner      2021-08-10  1401  	ASSERT(xlog_is_shutdown=
(log));
0d227466be8433 Dave Chinner      2022-05-04  1402  	xlog_cil_cleanup_whiteo=
uts(&whiteouts);
caa80090d17c89 Dave Chinner      2021-08-10  1403  	if (!ctx->commit_iclog)=
 {
764cba47b511f8 Dave Chinner      2022-06-13  1404  		xfs_log_ticket_ungrant=
(log, ctx->ticket);
12e6a0f449d585 Christoph Hellwig 2020-03-20  1405  		xlog_cil_committed(ctx=
);
caa80090d17c89 Dave Chinner      2021-08-10  1406  		return;
caa80090d17c89 Dave Chinner      2021-08-10  1407  	}
caa80090d17c89 Dave Chinner      2021-08-10  1408  	spin_lock(&log->l_iclog=
lock);
764cba47b511f8 Dave Chinner      2022-06-13  1409  	ticket =3D ctx->ticket;
764cba47b511f8 Dave Chinner      2022-06-13  1410  	xlog_state_release_iclo=
g(log, ctx->commit_iclog, ticket);
caa80090d17c89 Dave Chinner      2021-08-10  1411  	/* Not safe to referenc=
e ctx now! */
caa80090d17c89 Dave Chinner      2021-08-10  1412  	spin_unlock(&log->l_icl=
oglock);
764cba47b511f8 Dave Chinner      2022-06-13  1413  	xfs_log_ticket_ungrant(=
log, ticket);
4c2d542f2e7865 Dave Chinner      2012-04-23  1414  }
4c2d542f2e7865 Dave Chinner      2012-04-23  1415  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4961691850802859715==--


Content-Type: multipart/mixed; boundary="===============2916683658001308726=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 1083/3040] drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c:1283 amdgpu_cs_submit() warn: ignoring unreachable code.
Date: Fri, 08 Apr 2022 19:04:10 +0800
Message-ID: <202204081836.LQGVBpM1-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2916683658001308726==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "Christian K=C3=B6nig" <christian.koenig@amd.com>
CC: Daniel Vetter <daniel.vetter@ffwll.ch>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   ff511c1c68a5a35ab0b3efb3c306fd80b10d74be
commit: 644704740b8282c9ee9483a38666ee4a4561c37c [1083/3040] drm/amdgpu: us=
e dma_resv_for_each_fence for CS workaround v2
:::::: branch date: 5 hours ago
:::::: commit date: 5 days ago
config: ia64-randconfig-m031-20220406 (https://download.01.org/0day-ci/arch=
ive/20220408/202204081836.LQGVBpM1-lkp(a)intel.com/config)
compiler: ia64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c:1283 amdgpu_cs_submit() warn: ignori=
ng unreachable code.

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c:522 amdgpu_cs_parser_bos() error: we=
 previously assumed 'p->bo_list' could be null (see line 513)
drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c:542 amdgpu_cs_parser_bos() warn: Ple=
ase consider using kvcalloc instead

vim +1283 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c

660e855813f78b Dave Airlie     2017-03-13  1206  =

cd75dc6887f1e1 Christian K=C3=B6nig 2016-01-31  1207  static int amdgpu_cs_=
submit(struct amdgpu_cs_parser *p,
cd75dc6887f1e1 Christian K=C3=B6nig 2016-01-31  1208  			    union drm_amdg=
pu_cs *cs)
cd75dc6887f1e1 Christian K=C3=B6nig 2016-01-31  1209  {
8ab19ea619aeed Christian K=C3=B6nig 2018-07-27  1210  	struct amdgpu_fpriv =
*fpriv =3D p->filp->driver_priv;
0d346a14c63412 Christian K=C3=B6nig 2018-07-19  1211  	struct drm_sched_ent=
ity *entity =3D p->entity;
4a102ad4ba0daf Christian K=C3=B6nig 2018-07-30  1212  	struct amdgpu_bo_lis=
t_entry *e;
cd75dc6887f1e1 Christian K=C3=B6nig 2016-01-31  1213  	struct amdgpu_job *j=
ob;
eb01abc7c4fd1f Monk Liu        2017-09-15  1214  	uint64_t seq;
e686941a32d31d Monk Liu        2016-03-07  1215  	int r;
cd75dc6887f1e1 Christian K=C3=B6nig 2016-01-31  1216  =

4a2de54dc1d766 Christian K=C3=B6nig 2018-08-24  1217  	job =3D p->job;
4a2de54dc1d766 Christian K=C3=B6nig 2018-08-24  1218  	p->job =3D NULL;
4a2de54dc1d766 Christian K=C3=B6nig 2018-08-24  1219  =

114fbc31952eb5 Christian K=C3=B6nig 2019-12-16  1220  	r =3D drm_sched_job_=
init(&job->base, entity, &fpriv->vm);
4a2de54dc1d766 Christian K=C3=B6nig 2018-08-24  1221  	if (r)
4a2de54dc1d766 Christian K=C3=B6nig 2018-08-24  1222  		goto error_unlock;
4a2de54dc1d766 Christian K=C3=B6nig 2018-08-24  1223  =

dbe48d030b285a Daniel Vetter   2021-08-17  1224  	drm_sched_job_arm(&job->b=
ase);
dbe48d030b285a Daniel Vetter   2021-08-17  1225  =

81fa1af31b5d79 Jason Gunthorpe 2019-11-12  1226  	/* No memory allocation i=
s allowed while holding the notifier lock.
81fa1af31b5d79 Jason Gunthorpe 2019-11-12  1227  	 * The lock is held until=
 amdgpu_cs_submit is finished and fence is
81fa1af31b5d79 Jason Gunthorpe 2019-11-12  1228  	 * added to BOs.
899fbde1464639 Philip Yang     2018-12-13  1229  	 */
81fa1af31b5d79 Jason Gunthorpe 2019-11-12  1230  	mutex_lock(&p->adev->noti=
fier_lock);
899fbde1464639 Philip Yang     2018-12-13  1231  =

899fbde1464639 Philip Yang     2018-12-13  1232  	/* If userptr are invalid=
ated after amdgpu_cs_parser_bos(), return
899fbde1464639 Philip Yang     2018-12-13  1233  	 * -EAGAIN, drmIoctl in l=
ibdrm will restart the amdgpu_cs_ioctl.
899fbde1464639 Philip Yang     2018-12-13  1234  	 */
39f7f69a6054bb Christian K=C3=B6nig 2018-07-30  1235  	amdgpu_bo_list_for_e=
ach_userptr_entry(e, p->bo_list) {
e83dfe4d869358 Christian K=C3=B6nig 2018-09-10  1236  		struct amdgpu_bo *b=
o =3D ttm_to_amdgpu_bo(e->tv.bo);
3fe89771cb0a65 Christian K=C3=B6nig 2017-09-12  1237  =

899fbde1464639 Philip Yang     2018-12-13  1238  		r |=3D !amdgpu_ttm_tt_ge=
t_user_pages_done(bo->tbo.ttm);
3fe89771cb0a65 Christian K=C3=B6nig 2017-09-12  1239  	}
899fbde1464639 Philip Yang     2018-12-13  1240  	if (r) {
899fbde1464639 Philip Yang     2018-12-13  1241  		r =3D -EAGAIN;
899fbde1464639 Philip Yang     2018-12-13  1242  		goto error_abort;
3fe89771cb0a65 Christian K=C3=B6nig 2017-09-12  1243  	}
3fe89771cb0a65 Christian K=C3=B6nig 2017-09-12  1244  =

f54d1867005c33 Chris Wilson    2016-10-25  1245  	p->fence =3D dma_fence_ge=
t(&job->base.s_fence->finished);
660e855813f78b Dave Airlie     2017-03-13  1246  =

85eff20020a656 Christian K=C3=B6nig 2018-08-24  1247  	amdgpu_ctx_add_fence=
(p->ctx, entity, p->fence, &seq);
660e855813f78b Dave Airlie     2017-03-13  1248  	amdgpu_cs_post_dependenci=
es(p);
660e855813f78b Dave Airlie     2017-03-13  1249  =

d98ff24e8e9be3 Christian K=C3=B6nig 2018-08-21  1250  	if ((job->preamble_s=
tatus & AMDGPU_PREAMBLE_IB_PRESENT) &&
d98ff24e8e9be3 Christian K=C3=B6nig 2018-08-21  1251  	    !p->ctx->preambl=
e_presented) {
d98ff24e8e9be3 Christian K=C3=B6nig 2018-08-21  1252  		job->preamble_statu=
s |=3D AMDGPU_PREAMBLE_IB_PRESENT_FIRST;
d98ff24e8e9be3 Christian K=C3=B6nig 2018-08-21  1253  		p->ctx->preamble_pr=
esented =3D true;
d98ff24e8e9be3 Christian K=C3=B6nig 2018-08-21  1254  	}
d98ff24e8e9be3 Christian K=C3=B6nig 2018-08-21  1255  =

eb01abc7c4fd1f Monk Liu        2017-09-15  1256  	cs->out.handle =3D seq;
eb01abc7c4fd1f Monk Liu        2017-09-15  1257  	job->uf_sequence =3D seq;
eb01abc7c4fd1f Monk Liu        2017-09-15  1258  =

a5fb4ec29c74a1 Christian K=C3=B6nig 2016-06-29  1259  	amdgpu_job_free_reso=
urces(job);
cd75dc6887f1e1 Christian K=C3=B6nig 2016-01-31  1260  =

cd75dc6887f1e1 Christian K=C3=B6nig 2016-01-31  1261  	trace_amdgpu_cs_ioct=
l(job);
8ab19ea619aeed Christian K=C3=B6nig 2018-07-27  1262  	amdgpu_vm_bo_trace_c=
s(&fpriv->vm, &p->ticket);
0e10e9a1db230a Daniel Vetter   2021-08-05  1263  	drm_sched_entity_push_job=
(&job->base);
3fe89771cb0a65 Christian K=C3=B6nig 2017-09-12  1264  =

b995795bf09b6b Christian K=C3=B6nig 2018-08-30  1265  	amdgpu_vm_move_to_lr=
u_tail(p->adev, &fpriv->vm);
b995795bf09b6b Christian K=C3=B6nig 2018-08-30  1266  =

8c505bdc9c8b95 Christian K=C3=B6nig 2021-06-09  1267  	amdgpu_bo_list_for_e=
ach_entry(e, p->bo_list) {
8c505bdc9c8b95 Christian K=C3=B6nig 2021-06-09  1268  		struct dma_resv *re=
sv =3D e->tv.bo->base.resv;
8c505bdc9c8b95 Christian K=C3=B6nig 2021-06-09  1269  		struct dma_fence_ch=
ain *chain =3D e->chain;
644704740b8282 Christian K=C3=B6nig 2021-11-03  1270  		struct dma_resv_ite=
r cursor;
644704740b8282 Christian K=C3=B6nig 2021-11-03  1271  		struct dma_fence *f=
ence;
8c505bdc9c8b95 Christian K=C3=B6nig 2021-06-09  1272  =

8c505bdc9c8b95 Christian K=C3=B6nig 2021-06-09  1273  		if (!chain)
8c505bdc9c8b95 Christian K=C3=B6nig 2021-06-09  1274  			continue;
8c505bdc9c8b95 Christian K=C3=B6nig 2021-06-09  1275  =

8c505bdc9c8b95 Christian K=C3=B6nig 2021-06-09  1276  		/*
644704740b8282 Christian K=C3=B6nig 2021-11-03  1277  		 * Temporary workar=
ound dma_resv shortcommings by wrapping up
644704740b8282 Christian K=C3=B6nig 2021-11-03  1278  		 * the submission i=
n a dma_fence_chain and add it as exclusive
acde6234f65bad Christian K=C3=B6nig 2021-11-03  1279  		 * fence.
644704740b8282 Christian K=C3=B6nig 2021-11-03  1280  		 *
644704740b8282 Christian K=C3=B6nig 2021-11-03  1281  		 * TODO: Remove tog=
ether with dma_resv rework.
8c505bdc9c8b95 Christian K=C3=B6nig 2021-06-09  1282  		 */
644704740b8282 Christian K=C3=B6nig 2021-11-03 @1283  		dma_resv_for_each_f=
ence(&cursor, resv, false, fence) {
644704740b8282 Christian K=C3=B6nig 2021-11-03  1284  			break;
644704740b8282 Christian K=C3=B6nig 2021-11-03  1285  		}
644704740b8282 Christian K=C3=B6nig 2021-11-03  1286  		dma_fence_chain_ini=
t(chain, fence, dma_fence_get(p->fence), 1);
8c505bdc9c8b95 Christian K=C3=B6nig 2021-06-09  1287  		rcu_assign_pointer(=
resv->fence_excl, &chain->base);
8c505bdc9c8b95 Christian K=C3=B6nig 2021-06-09  1288  		e->chain =3D NULL;
8c505bdc9c8b95 Christian K=C3=B6nig 2021-06-09  1289  	}
8c505bdc9c8b95 Christian K=C3=B6nig 2021-06-09  1290  =

3fe89771cb0a65 Christian K=C3=B6nig 2017-09-12  1291  	ttm_eu_fence_buffer_=
objects(&p->ticket, &p->validated, p->fence);
81fa1af31b5d79 Jason Gunthorpe 2019-11-12  1292  	mutex_unlock(&p->adev->no=
tifier_lock);
3fe89771cb0a65 Christian K=C3=B6nig 2017-09-12  1293  =

cd75dc6887f1e1 Christian K=C3=B6nig 2016-01-31  1294  	return 0;
4a2de54dc1d766 Christian K=C3=B6nig 2018-08-24  1295  =

4a2de54dc1d766 Christian K=C3=B6nig 2018-08-24  1296  error_abort:
26efecf9558895 Sharat Masetty  2018-10-29  1297  	drm_sched_job_cleanup(&jo=
b->base);
81fa1af31b5d79 Jason Gunthorpe 2019-11-12  1298  	mutex_unlock(&p->adev->no=
tifier_lock);
4a2de54dc1d766 Christian K=C3=B6nig 2018-08-24  1299  =

4a2de54dc1d766 Christian K=C3=B6nig 2018-08-24  1300  error_unlock:
4a2de54dc1d766 Christian K=C3=B6nig 2018-08-24  1301  	amdgpu_job_free(job);
4a2de54dc1d766 Christian K=C3=B6nig 2018-08-24  1302  	return r;
cd75dc6887f1e1 Christian K=C3=B6nig 2016-01-31  1303  }
cd75dc6887f1e1 Christian K=C3=B6nig 2016-01-31  1304  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2916683658001308726==--


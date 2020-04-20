Content-Type: multipart/mixed; boundary="===============8135137343799604442=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [android-common:android-4.14-stable 22/22] drivers/gpu/drm/virtio/virtgpu_ioctl.c:661:50: warning: Either the condition 'rc_blob->cmd_size&&vfpriv' is redundant or there is possible null pointer dereference: vfpriv. [nullPointerRedundantCheck]
Date: Mon, 20 Apr 2020 18:42:07 +0800
Message-ID: <202004201859.OOshoZEc%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8135137343799604442==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: cros-kernel-buildreports(a)googlegroups.com

tree:   https://android.googlesource.com/kernel/common android-4.14-stable
head:   4d701a3899580b291122ab7b147bc20981afd349
commit: 4d701a3899580b291122ab7b147bc20981afd349 [22/22] CHROMIUM: drm/virt=
io: rebase zero-copy patches to virgl/drm-misc-next
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/gpu/drm/virtio/virtgpu_ioctl.c:661:50: warning: Either the condi=
tion 'rc_blob->cmd_size&&vfpriv' is redundant or there is possible null poi=
nter dereference: vfpriv. [nullPointerRedundantCheck]
    virtio_gpu_cmd_resource_create_blob(vgdev, obj, vfpriv->ctx_id,
                                                    ^
   drivers/gpu/drm/virtio/virtgpu_ioctl.c:606:24: note: Assuming that condi=
tion 'rc_blob->cmd_size&&vfpriv' is not redundant
    if (rc_blob->cmd_size && vfpriv) {
                          ^
   drivers/gpu/drm/virtio/virtgpu_ioctl.c:597:40: note: Assignment 'vfpriv=
=3Dfile->driver_priv', assigned value is 0
    struct virtio_gpu_fpriv *vfpriv =3D file->driver_priv;
                                          ^
   drivers/gpu/drm/virtio/virtgpu_ioctl.c:661:50: note: Null pointer derefe=
rence
    virtio_gpu_cmd_resource_create_blob(vgdev, obj, vfpriv->ctx_id,
                                                    ^
>> drivers/gpu/drm/virtio/virtgpu_ioctl.c:607:9: warning: Local variable 'b=
uf' shadows outer variable [shadowVariable]
     void *buf;
           ^
   drivers/gpu/drm/virtio/virtgpu_ioctl.c:587:8: note: Shadowed declaration
    void *buf;
          ^
   drivers/gpu/drm/virtio/virtgpu_ioctl.c:607:9: note: Shadow variable
     void *buf;
           ^
>> drivers/gpu/drm/virtio/virtgpu_ioctl.c:587:8: warning: Variable 'buf' is=
 not assigned a value. [unassignedVariable]
    void *buf;
          ^

git remote add android-common https://android.googlesource.com/kernel/common
git remote update android-common
git checkout 4d701a3899580b291122ab7b147bc20981afd349
vim +661 drivers/gpu/drm/virtio/virtgpu_ioctl.c

62fb7a5e10962a Gerd Hoffmann 2014-10-28  583  =

4d701a3899580b Lingfeng Yang 2020-04-16  584  static int virtio_gpu_resourc=
e_create_blob_ioctl(struct drm_device *dev,
73738beaa7074c Lingfeng Yang 2020-04-16  585  				void *data, struct drm_fi=
le *file)
73738beaa7074c Lingfeng Yang 2020-04-16  586  {
dc92d4ac179f5e Lingfeng Yang 2020-04-16 @587  	void *buf;
dc92d4ac179f5e Lingfeng Yang 2020-04-16  588  	int ret, si, nents;
dc92d4ac179f5e Lingfeng Yang 2020-04-16  589  	uint32_t handle =3D 0;
dc92d4ac179f5e Lingfeng Yang 2020-04-16  590  	struct scatterlist *sg;
dc92d4ac179f5e Lingfeng Yang 2020-04-16  591  	struct virtio_gpu_object *ob=
j;
dc92d4ac179f5e Lingfeng Yang 2020-04-16  592  	struct virtio_gpu_fence *fen=
ce;
dc92d4ac179f5e Lingfeng Yang 2020-04-16  593  	struct virtio_gpu_mem_entry =
*ents;
4d701a3899580b Lingfeng Yang 2020-04-16  594  	struct drm_virtgpu_resource_=
create_blob *rc_blob =3D data;
dc92d4ac179f5e Lingfeng Yang 2020-04-16  595  	struct virtio_gpu_object_par=
ams params =3D { 0 };
dc92d4ac179f5e Lingfeng Yang 2020-04-16  596  	struct virtio_gpu_device *vg=
dev =3D dev->dev_private;
4d701a3899580b Lingfeng Yang 2020-04-16  597  	struct virtio_gpu_fpriv *vfp=
riv =3D file->driver_priv;
dc92d4ac179f5e Lingfeng Yang 2020-04-16  598  	bool use_dma_api =3D !virtio=
_has_iommu_quirk(vgdev->vdev);
4d701a3899580b Lingfeng Yang 2020-04-16  599  	bool mappable =3D rc_blob->f=
lags & VIRTGPU_RES_BLOB_USE_MAPPABLE;
4d701a3899580b Lingfeng Yang 2020-04-16  600  	bool guest =3D rc_blob->flag=
s & VIRTGPU_RES_BLOB_GUEST_MASK;
4d701a3899580b Lingfeng Yang 2020-04-16  601  =

4d701a3899580b Lingfeng Yang 2020-04-16  602  	params.size =3D rc_blob->siz=
e;
4d701a3899580b Lingfeng Yang 2020-04-16  603  	params.blob_flags =3D rc_blo=
b->flags;
4d701a3899580b Lingfeng Yang 2020-04-16  604  	params.blob =3D true;
4d701a3899580b Lingfeng Yang 2020-04-16  605  =

4d701a3899580b Lingfeng Yang 2020-04-16  606  	if (rc_blob->cmd_size && vfp=
riv) {
4d701a3899580b Lingfeng Yang 2020-04-16 @607  		void *buf;
4d701a3899580b Lingfeng Yang 2020-04-16  608  		void __user *cmd =3D u64_to=
_user_ptr(rc_blob->cmd);
4d701a3899580b Lingfeng Yang 2020-04-16  609  =

4d701a3899580b Lingfeng Yang 2020-04-16  610  		buf =3D kzalloc(rc_blob->cm=
d_size, GFP_KERNEL);
4d701a3899580b Lingfeng Yang 2020-04-16  611  		if (!buf)
4d701a3899580b Lingfeng Yang 2020-04-16  612  			return -ENOMEM;
4d701a3899580b Lingfeng Yang 2020-04-16  613  =

4d701a3899580b Lingfeng Yang 2020-04-16  614  		if (copy_from_user(buf, cmd=
, rc_blob->cmd_size)) {
4d701a3899580b Lingfeng Yang 2020-04-16  615  			kfree(buf);
4d701a3899580b Lingfeng Yang 2020-04-16  616  			return -EFAULT;
4d701a3899580b Lingfeng Yang 2020-04-16  617  		}
dc92d4ac179f5e Lingfeng Yang 2020-04-16  618  =

4d701a3899580b Lingfeng Yang 2020-04-16  619  		virtio_gpu_cmd_submit(vgdev=
, buf, rc_blob->cmd_size,
4d701a3899580b Lingfeng Yang 2020-04-16  620  				      vfpriv->ctx_id, NUL=
L);
4d701a3899580b Lingfeng Yang 2020-04-16  621  	}
dc92d4ac179f5e Lingfeng Yang 2020-04-16  622  =

dc92d4ac179f5e Lingfeng Yang 2020-04-16  623  	obj =3D virtio_gpu_alloc_obj=
ect(dev, &params, NULL);
dc92d4ac179f5e Lingfeng Yang 2020-04-16  624  	if (IS_ERR(obj))
dc92d4ac179f5e Lingfeng Yang 2020-04-16  625  		return PTR_ERR(obj);
dc92d4ac179f5e Lingfeng Yang 2020-04-16  626  =

dc92d4ac179f5e Lingfeng Yang 2020-04-16  627  	if (!obj->pages) {
dc92d4ac179f5e Lingfeng Yang 2020-04-16  628                  ret =3D virti=
o_gpu_object_get_sg_table(vgdev, obj);
dc92d4ac179f5e Lingfeng Yang 2020-04-16  629                  if (ret)
dc92d4ac179f5e Lingfeng Yang 2020-04-16  630  			goto err_free_obj;
dc92d4ac179f5e Lingfeng Yang 2020-04-16  631          }
dc92d4ac179f5e Lingfeng Yang 2020-04-16  632  =

4d701a3899580b Lingfeng Yang 2020-04-16  633  	if (!guest) {
dc92d4ac179f5e Lingfeng Yang 2020-04-16  634  		nents =3D 0;
dc92d4ac179f5e Lingfeng Yang 2020-04-16  635  	} else if (use_dma_api) {
dc92d4ac179f5e Lingfeng Yang 2020-04-16  636                  obj->mapped =
=3D dma_map_sg(vgdev->vdev->dev.parent,
dc92d4ac179f5e Lingfeng Yang 2020-04-16  637                               =
            obj->pages->sgl, obj->pages->nents,
dc92d4ac179f5e Lingfeng Yang 2020-04-16  638                               =
            DMA_TO_DEVICE);
dc92d4ac179f5e Lingfeng Yang 2020-04-16  639                  nents =3D obj=
->mapped;
dc92d4ac179f5e Lingfeng Yang 2020-04-16  640          } else {
dc92d4ac179f5e Lingfeng Yang 2020-04-16  641                  nents =3D obj=
->pages->nents;
dc92d4ac179f5e Lingfeng Yang 2020-04-16  642          }
dc92d4ac179f5e Lingfeng Yang 2020-04-16  643  =

4d701a3899580b Lingfeng Yang 2020-04-16  644  	ents =3D kzalloc(nents * siz=
eof(struct virtio_gpu_mem_entry), GFP_KERNEL);
4d701a3899580b Lingfeng Yang 2020-04-16  645  	if (guest) {
dc92d4ac179f5e Lingfeng Yang 2020-04-16  646  		for_each_sg(obj->pages->sgl=
, sg, nents, si) {
dc92d4ac179f5e Lingfeng Yang 2020-04-16  647  			ents[si].addr =3D cpu_to_l=
e64(use_dma_api
dc92d4ac179f5e Lingfeng Yang 2020-04-16  648  						    ? sg_dma_address(sg)
dc92d4ac179f5e Lingfeng Yang 2020-04-16  649  						    : sg_phys(sg));
dc92d4ac179f5e Lingfeng Yang 2020-04-16  650  			ents[si].length =3D cpu_to=
_le32(sg->length);
dc92d4ac179f5e Lingfeng Yang 2020-04-16  651  			ents[si].padding =3D 0;
dc92d4ac179f5e Lingfeng Yang 2020-04-16  652  		}
dc92d4ac179f5e Lingfeng Yang 2020-04-16  653  	}
dc92d4ac179f5e Lingfeng Yang 2020-04-16  654  =

dc92d4ac179f5e Lingfeng Yang 2020-04-16  655  	fence =3D virtio_gpu_fence_a=
lloc(vgdev);
dc92d4ac179f5e Lingfeng Yang 2020-04-16  656  	if (!fence) {
dc92d4ac179f5e Lingfeng Yang 2020-04-16  657  		ret =3D -ENOMEM;
dc92d4ac179f5e Lingfeng Yang 2020-04-16  658  		goto err_free_buf;
dc92d4ac179f5e Lingfeng Yang 2020-04-16  659  	}
dc92d4ac179f5e Lingfeng Yang 2020-04-16  660  =

4d701a3899580b Lingfeng Yang 2020-04-16 @661  	virtio_gpu_cmd_resource_crea=
te_blob(vgdev, obj, vfpriv->ctx_id,
4d701a3899580b Lingfeng Yang 2020-04-16  662  					    rc_blob->flags, rc_b=
lob->size,
4d701a3899580b Lingfeng Yang 2020-04-16  663  					    rc_blob->memory_id, =
nents,
4d701a3899580b Lingfeng Yang 2020-04-16  664  					    ents);
4d701a3899580b Lingfeng Yang 2020-04-16  665  =

dc92d4ac179f5e Lingfeng Yang 2020-04-16  666  	ret =3D drm_gem_handle_creat=
e(file, &obj->gem_base, &handle);
dc92d4ac179f5e Lingfeng Yang 2020-04-16  667  	if (ret)
dc92d4ac179f5e Lingfeng Yang 2020-04-16  668  		goto err_fence_put;
dc92d4ac179f5e Lingfeng Yang 2020-04-16  669  =

4d701a3899580b Lingfeng Yang 2020-04-16  670  	if (!guest && mappable) {
4d701a3899580b Lingfeng Yang 2020-04-16  671  		virtio_gpu_cmd_map(vgdev, o=
bj, obj->tbo.offset, fence);
4d701a3899580b Lingfeng Yang 2020-04-16  672  	}
dc92d4ac179f5e Lingfeng Yang 2020-04-16  673  =

dc92d4ac179f5e Lingfeng Yang 2020-04-16  674  	/*
dc92d4ac179f5e Lingfeng Yang 2020-04-16  675  	 * No need to call virtio_gp=
u_object_reserve since the buffer is not
dc92d4ac179f5e Lingfeng Yang 2020-04-16  676  	 * being used for ttm valida=
tion and no other processes can access
dc92d4ac179f5e Lingfeng Yang 2020-04-16  677  	 * the reservation object at=
 this point.
dc92d4ac179f5e Lingfeng Yang 2020-04-16  678  	 */
dc92d4ac179f5e Lingfeng Yang 2020-04-16  679  	reservation_object_add_excl_=
fence(obj->tbo.resv, &fence->f);
dc92d4ac179f5e Lingfeng Yang 2020-04-16  680  =

dc92d4ac179f5e Lingfeng Yang 2020-04-16  681  	dma_fence_put(&fence->f);
dc92d4ac179f5e Lingfeng Yang 2020-04-16  682  	drm_gem_object_put_unlocked(=
&obj->gem_base);
dc92d4ac179f5e Lingfeng Yang 2020-04-16  683  =

4d701a3899580b Lingfeng Yang 2020-04-16  684  	rc_blob->res_handle =3D obj-=
>hw_res_handle;
4d701a3899580b Lingfeng Yang 2020-04-16  685  	rc_blob->bo_handle =3D handl=
e;
73738beaa7074c Lingfeng Yang 2020-04-16  686  	return 0;
dc92d4ac179f5e Lingfeng Yang 2020-04-16  687  =

dc92d4ac179f5e Lingfeng Yang 2020-04-16  688  err_fence_put:
dc92d4ac179f5e Lingfeng Yang 2020-04-16  689  	dma_fence_put(&fence->f);
dc92d4ac179f5e Lingfeng Yang 2020-04-16  690  err_free_buf:
dc92d4ac179f5e Lingfeng Yang 2020-04-16  691  	kfree(buf);
dc92d4ac179f5e Lingfeng Yang 2020-04-16  692  err_free_obj:
dc92d4ac179f5e Lingfeng Yang 2020-04-16  693  	drm_gem_object_release(&obj-=
>gem_base);
dc92d4ac179f5e Lingfeng Yang 2020-04-16  694  	return ret;
73738beaa7074c Lingfeng Yang 2020-04-16  695  }
73738beaa7074c Lingfeng Yang 2020-04-16  696  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8135137343799604442==--


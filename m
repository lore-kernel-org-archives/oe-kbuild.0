Received: from mgamail.intel.com (unknown [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7016F17747
	for <oe-kbuild@lists.linux.dev>; Sat, 29 Jul 2023 23:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690674992; x=1722210992;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZMeSIgeE0zKxLfBqsVJGFM0ZiAjEntlcl3zhEG2zjws=;
  b=gaKVkIos2v1Zlk42esLHVCBHi5N/+d9QL+jZC2i3S643QGWTQZKX0gIi
   rFSHySO9zbgvYwanw+Y9gAF8ibwyHTDvXAralk/hiKiuJLANrNqYFSCt3
   4Vkf/t4zXEaAUBEeUe761UOdosUMZUVNemrAAhM8FwbJpZnyAMPH+S6B9
   toKP56RQ3yqYfvZCFjc/cAGW+7cBYGkGn3RLd3QggLeqBPrkJP/3KBaSZ
   OrL182oNpM8XIMslzmqqFvMvRsoGRGWYDwQ1g5F+u15jmr1f8z/liA8L/
   zAVIP0uO+J9vUm6mIM2lG9SfezH59KKcCEvmEelG/rvKRYjAbhrnGKcGr
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="353705999"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="353705999"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2023 16:56:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="974474715"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="974474715"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 29 Jul 2023 16:56:29 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPtnR-0004LL-0s;
	Sat, 29 Jul 2023 23:56:29 +0000
Date: Sun, 30 Jul 2023 07:55:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [android-common:arcvm12-5.10-gki-base 4/12]
 drivers/virtio/virtio_wl.c:892:31-32: WARNING opportunity for kvmalloc
Message-ID: <202307300746.EDkNLJDL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common arcvm12-5.10-gki-base
head:   493b9ea1b1db17b6eccedcd2a4cb54b6d10f7a71
commit: 25cf89572247d2cc441b0bd849a038fb4981720a [4/12] CHROMIUM: virtio-wl: Use vmalloc for larger messages in virtwl_vfd_send().
:::::: branch date: 2 days ago
:::::: commit date: 7 weeks ago
config: i386-randconfig-i052-20230730 (https://download.01.org/0day-ci/archive/20230730/202307300746.EDkNLJDL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230730/202307300746.EDkNLJDL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202307300746.EDkNLJDL-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/virtio/virtio_wl.c:892:31-32: WARNING opportunity for kvmalloc

vim +892 drivers/virtio/virtio_wl.c

c57ccf06374bd0 Zach Reizner     2017-08-14  792  
c57ccf06374bd0 Zach Reizner     2017-08-14  793  static int virtwl_vfd_send(struct file *filp, const char __user *buffer,
c57ccf06374bd0 Zach Reizner     2017-08-14  794  					       u32 len, int *vfd_fds)
c57ccf06374bd0 Zach Reizner     2017-08-14  795  {
c57ccf06374bd0 Zach Reizner     2017-08-14  796  	struct virtwl_vfd *vfd = filp->private_data;
c57ccf06374bd0 Zach Reizner     2017-08-14  797  	struct virtwl_info *vi = vfd->vi;
c57ccf06374bd0 Zach Reizner     2017-08-14  798  	struct fd vfd_files[VIRTWL_SEND_MAX_ALLOCS] = { { 0 } };
c57ccf06374bd0 Zach Reizner     2017-08-14  799  	struct virtwl_vfd *vfds[VIRTWL_SEND_MAX_ALLOCS] = { 0 };
c57ccf06374bd0 Zach Reizner     2017-08-14  800  #ifdef SEND_VIRTGPU_RESOURCES
c57ccf06374bd0 Zach Reizner     2017-08-14  801  	struct dma_buf *virtgpu_dma_bufs[VIRTWL_SEND_MAX_ALLOCS] = { 0 };
84f65ea7620d8a David Stevens    2020-04-22  802  	struct dma_fence *virtgpu_dma_fence[VIRTWL_SEND_MAX_ALLOCS] = { 0 };
c57ccf06374bd0 Zach Reizner     2017-08-14  803  	bool foreign_id = false;
c57ccf06374bd0 Zach Reizner     2017-08-14  804  #endif
c57ccf06374bd0 Zach Reizner     2017-08-14  805  	size_t vfd_count = 0;
c57ccf06374bd0 Zach Reizner     2017-08-14  806  	size_t vfd_ids_size;
c57ccf06374bd0 Zach Reizner     2017-08-14  807  	size_t ctrl_send_size;
c57ccf06374bd0 Zach Reizner     2017-08-14  808  	struct virtio_wl_ctrl_vfd_send *ctrl_send;
c57ccf06374bd0 Zach Reizner     2017-08-14  809  	u8 *vfd_ids;
c57ccf06374bd0 Zach Reizner     2017-08-14  810  	u8 *out_buffer;
c57ccf06374bd0 Zach Reizner     2017-08-14  811  	struct completion finish_completion;
c57ccf06374bd0 Zach Reizner     2017-08-14  812  	struct scatterlist out_sg;
c57ccf06374bd0 Zach Reizner     2017-08-14  813  	struct scatterlist in_sg;
25cf89572247d2 Suleiman Souhlal 2021-06-08  814  	struct sg_table sgt;
25cf89572247d2 Suleiman Souhlal 2021-06-08  815  	struct vm_struct *area;
25cf89572247d2 Suleiman Souhlal 2021-06-08  816  	bool vmalloced;
c57ccf06374bd0 Zach Reizner     2017-08-14  817  	int ret;
c57ccf06374bd0 Zach Reizner     2017-08-14  818  	int i;
c57ccf06374bd0 Zach Reizner     2017-08-14  819  
c57ccf06374bd0 Zach Reizner     2017-08-14  820  	if (vfd_fds) {
c57ccf06374bd0 Zach Reizner     2017-08-14  821  		for (i = 0; i < VIRTWL_SEND_MAX_ALLOCS; i++) {
c57ccf06374bd0 Zach Reizner     2017-08-14  822  			struct fd vfd_file;
c57ccf06374bd0 Zach Reizner     2017-08-14  823  			int fd = vfd_fds[i];
c57ccf06374bd0 Zach Reizner     2017-08-14  824  
c57ccf06374bd0 Zach Reizner     2017-08-14  825  			if (fd < 0)
c57ccf06374bd0 Zach Reizner     2017-08-14  826  				break;
c57ccf06374bd0 Zach Reizner     2017-08-14  827  
c57ccf06374bd0 Zach Reizner     2017-08-14  828  			vfd_file = fdget(vfd_fds[i]);
c57ccf06374bd0 Zach Reizner     2017-08-14  829  			if (!vfd_file.file) {
c57ccf06374bd0 Zach Reizner     2017-08-14  830  				ret = -EBADFD;
c57ccf06374bd0 Zach Reizner     2017-08-14  831  				goto put_files;
c57ccf06374bd0 Zach Reizner     2017-08-14  832  			}
c57ccf06374bd0 Zach Reizner     2017-08-14  833  
c57ccf06374bd0 Zach Reizner     2017-08-14  834  			if (vfd_file.file->f_op == &virtwl_vfd_fops) {
c57ccf06374bd0 Zach Reizner     2017-08-14  835  				vfd_files[i] = vfd_file;
c57ccf06374bd0 Zach Reizner     2017-08-14  836  
c57ccf06374bd0 Zach Reizner     2017-08-14  837  				vfds[i] = vfd_file.file->private_data;
c57ccf06374bd0 Zach Reizner     2017-08-14  838  				if (vfds[i] && vfds[i]->id) {
c57ccf06374bd0 Zach Reizner     2017-08-14  839  					vfd_count++;
c57ccf06374bd0 Zach Reizner     2017-08-14  840  					continue;
c57ccf06374bd0 Zach Reizner     2017-08-14  841  				}
c57ccf06374bd0 Zach Reizner     2017-08-14  842  
c57ccf06374bd0 Zach Reizner     2017-08-14  843  				ret = -EINVAL;
c57ccf06374bd0 Zach Reizner     2017-08-14  844  				goto put_files;
c57ccf06374bd0 Zach Reizner     2017-08-14  845  			} else {
c57ccf06374bd0 Zach Reizner     2017-08-14  846  				struct dma_buf *dma_buf = ERR_PTR(-EINVAL);
84f65ea7620d8a David Stevens    2020-04-22  847  				struct dma_fence *dma_fence = ERR_PTR(-EINVAL);
84f65ea7620d8a David Stevens    2020-04-22  848  				bool handled = false;
84f65ea7620d8a David Stevens    2020-04-22  849  
c57ccf06374bd0 Zach Reizner     2017-08-14  850  #ifdef SEND_VIRTGPU_RESOURCES
c57ccf06374bd0 Zach Reizner     2017-08-14  851  				dma_buf = dma_buf_get(vfd_fds[i]);
84f65ea7620d8a David Stevens    2020-04-22  852  				dma_fence = vi->use_send_vfd_v2
84f65ea7620d8a David Stevens    2020-04-22  853  					? sync_file_get_fence(vfd_fds[i])
84f65ea7620d8a David Stevens    2020-04-22  854  					: ERR_PTR(-EINVAL);
84f65ea7620d8a David Stevens    2020-04-22  855  				handled = !IS_ERR(dma_buf) ||
84f65ea7620d8a David Stevens    2020-04-22  856  					  !IS_ERR(dma_fence);
84f65ea7620d8a David Stevens    2020-04-22  857  
c57ccf06374bd0 Zach Reizner     2017-08-14  858  				if (!IS_ERR(dma_buf)) {
c57ccf06374bd0 Zach Reizner     2017-08-14  859  					virtgpu_dma_bufs[i] = dma_buf;
84f65ea7620d8a David Stevens    2020-04-22  860  				} else {
84f65ea7620d8a David Stevens    2020-04-22  861  					virtgpu_dma_fence[i] = dma_fence;
84f65ea7620d8a David Stevens    2020-04-22  862  				}
84f65ea7620d8a David Stevens    2020-04-22  863  
c57ccf06374bd0 Zach Reizner     2017-08-14  864  				foreign_id = true;
c57ccf06374bd0 Zach Reizner     2017-08-14  865  				vfd_count++;
c57ccf06374bd0 Zach Reizner     2017-08-14  866  #endif
c57ccf06374bd0 Zach Reizner     2017-08-14  867  				fdput(vfd_file);
84f65ea7620d8a David Stevens    2020-04-22  868  				if (!handled) {
84f65ea7620d8a David Stevens    2020-04-22  869  					ret = IS_ERR(dma_buf) ?
84f65ea7620d8a David Stevens    2020-04-22  870  						PTR_ERR(dma_buf) :
84f65ea7620d8a David Stevens    2020-04-22  871  						PTR_ERR(dma_fence);
c57ccf06374bd0 Zach Reizner     2017-08-14  872  					goto put_files;
c57ccf06374bd0 Zach Reizner     2017-08-14  873  				}
c57ccf06374bd0 Zach Reizner     2017-08-14  874  			}
c57ccf06374bd0 Zach Reizner     2017-08-14  875  		}
84f65ea7620d8a David Stevens    2020-04-22  876  	}
c57ccf06374bd0 Zach Reizner     2017-08-14  877  
c57ccf06374bd0 Zach Reizner     2017-08-14  878  	/* Empty writes always succeed. */
c57ccf06374bd0 Zach Reizner     2017-08-14  879  	if (len == 0 && vfd_count == 0)
c57ccf06374bd0 Zach Reizner     2017-08-14  880  		return 0;
c57ccf06374bd0 Zach Reizner     2017-08-14  881  
c57ccf06374bd0 Zach Reizner     2017-08-14  882  	vfd_ids_size = vfd_count * sizeof(__le32);
c57ccf06374bd0 Zach Reizner     2017-08-14  883  #ifdef SEND_VIRTGPU_RESOURCES
c57ccf06374bd0 Zach Reizner     2017-08-14  884  	if (foreign_id) {
84f65ea7620d8a David Stevens    2020-04-22  885  		vfd_ids_size = vfd_count * (vi->use_send_vfd_v2
84f65ea7620d8a David Stevens    2020-04-22  886  			? sizeof(struct virtio_wl_ctrl_vfd_send_vfd_v2)
84f65ea7620d8a David Stevens    2020-04-22  887  			: sizeof(struct virtio_wl_ctrl_vfd_send_vfd));
c57ccf06374bd0 Zach Reizner     2017-08-14  888  	}
c57ccf06374bd0 Zach Reizner     2017-08-14  889  #endif
c57ccf06374bd0 Zach Reizner     2017-08-14  890  	ctrl_send_size = sizeof(*ctrl_send) + vfd_ids_size + len;
25cf89572247d2 Suleiman Souhlal 2021-06-08  891  	vmalloced = false;
25cf89572247d2 Suleiman Souhlal 2021-06-08 @892  	if (ctrl_send_size < PAGE_SIZE)
c57ccf06374bd0 Zach Reizner     2017-08-14  893  		ctrl_send = kzalloc(ctrl_send_size, GFP_KERNEL);
25cf89572247d2 Suleiman Souhlal 2021-06-08  894  	else {
25cf89572247d2 Suleiman Souhlal 2021-06-08  895  		vmalloced = true;
25cf89572247d2 Suleiman Souhlal 2021-06-08  896  		ctrl_send = vzalloc(ctrl_send_size);
25cf89572247d2 Suleiman Souhlal 2021-06-08  897  	}
c57ccf06374bd0 Zach Reizner     2017-08-14  898  	if (!ctrl_send) {
c57ccf06374bd0 Zach Reizner     2017-08-14  899  		ret = -ENOMEM;
c57ccf06374bd0 Zach Reizner     2017-08-14  900  		goto put_files;
c57ccf06374bd0 Zach Reizner     2017-08-14  901  	}
c57ccf06374bd0 Zach Reizner     2017-08-14  902  
c57ccf06374bd0 Zach Reizner     2017-08-14  903  	vfd_ids = (u8 *)ctrl_send + sizeof(*ctrl_send);
c57ccf06374bd0 Zach Reizner     2017-08-14  904  	out_buffer = (u8 *)ctrl_send + ctrl_send_size - len;
c57ccf06374bd0 Zach Reizner     2017-08-14  905  
c57ccf06374bd0 Zach Reizner     2017-08-14  906  	ctrl_send->hdr.type = VIRTIO_WL_CMD_VFD_SEND;
c57ccf06374bd0 Zach Reizner     2017-08-14  907  #ifdef SEND_VIRTGPU_RESOURCES
c57ccf06374bd0 Zach Reizner     2017-08-14  908  	if (foreign_id) {
84f65ea7620d8a David Stevens    2020-04-22  909  		struct virtio_wl_ctrl_vfd_send_vfd *v1 = NULL;
84f65ea7620d8a David Stevens    2020-04-22  910  		struct virtio_wl_ctrl_vfd_send_vfd_v2 *v2 = NULL;
84f65ea7620d8a David Stevens    2020-04-22  911  
84f65ea7620d8a David Stevens    2020-04-22  912  		if (vi->use_send_vfd_v2)
84f65ea7620d8a David Stevens    2020-04-22  913  			v2 = (struct virtio_wl_ctrl_vfd_send_vfd_v2 *) vfd_ids;
84f65ea7620d8a David Stevens    2020-04-22  914  		else
84f65ea7620d8a David Stevens    2020-04-22  915  			v1 = (struct virtio_wl_ctrl_vfd_send_vfd *) vfd_ids;
84f65ea7620d8a David Stevens    2020-04-22  916  
c57ccf06374bd0 Zach Reizner     2017-08-14  917  		ctrl_send->hdr.type = VIRTIO_WL_CMD_VFD_SEND_FOREIGN_ID;
84f65ea7620d8a David Stevens    2020-04-22  918  		ret = encode_vfd_ids_foreign(vfds,
84f65ea7620d8a David Stevens    2020-04-22  919  			virtgpu_dma_bufs, virtgpu_dma_fence, vfd_count,
84f65ea7620d8a David Stevens    2020-04-22  920  			v1, v2);
c57ccf06374bd0 Zach Reizner     2017-08-14  921  	} else {
c57ccf06374bd0 Zach Reizner     2017-08-14  922  		ret = encode_vfd_ids(vfds, vfd_count, (__le32 *)vfd_ids);
c57ccf06374bd0 Zach Reizner     2017-08-14  923  	}
c57ccf06374bd0 Zach Reizner     2017-08-14  924  #else
c57ccf06374bd0 Zach Reizner     2017-08-14  925  	ret = encode_vfd_ids(vfds, vfd_count, (__le32 *)vfd_ids);
c57ccf06374bd0 Zach Reizner     2017-08-14  926  #endif
c57ccf06374bd0 Zach Reizner     2017-08-14  927  	if (ret)
c57ccf06374bd0 Zach Reizner     2017-08-14  928  		goto free_ctrl_send;
c57ccf06374bd0 Zach Reizner     2017-08-14  929  	ctrl_send->vfd_id = vfd->id;
c57ccf06374bd0 Zach Reizner     2017-08-14  930  	ctrl_send->vfd_count = vfd_count;
c57ccf06374bd0 Zach Reizner     2017-08-14  931  
c57ccf06374bd0 Zach Reizner     2017-08-14  932  	if (copy_from_user(out_buffer, buffer, len)) {
c57ccf06374bd0 Zach Reizner     2017-08-14  933  		ret = -EFAULT;
c57ccf06374bd0 Zach Reizner     2017-08-14  934  		goto free_ctrl_send;
c57ccf06374bd0 Zach Reizner     2017-08-14  935  	}
c57ccf06374bd0 Zach Reizner     2017-08-14  936  
c57ccf06374bd0 Zach Reizner     2017-08-14  937  	init_completion(&finish_completion);
25cf89572247d2 Suleiman Souhlal 2021-06-08  938  	if (!vmalloced) {
c57ccf06374bd0 Zach Reizner     2017-08-14  939  		sg_init_one(&out_sg, ctrl_send, ctrl_send_size);
25cf89572247d2 Suleiman Souhlal 2021-06-08  940  		sg_init_one(&in_sg, ctrl_send,
25cf89572247d2 Suleiman Souhlal 2021-06-08  941  		    sizeof(struct virtio_wl_ctrl_hdr));
c57ccf06374bd0 Zach Reizner     2017-08-14  942  		ret = vq_queue_out(vi, &out_sg, &in_sg, &finish_completion,
c57ccf06374bd0 Zach Reizner     2017-08-14  943  		    filp->f_flags & O_NONBLOCK);
25cf89572247d2 Suleiman Souhlal 2021-06-08  944  	} else {
25cf89572247d2 Suleiman Souhlal 2021-06-08  945  		area = find_vm_area(ctrl_send);
25cf89572247d2 Suleiman Souhlal 2021-06-08  946  		ret = sg_alloc_table_from_pages(&sgt, area->pages,
25cf89572247d2 Suleiman Souhlal 2021-06-08  947  		    area->nr_pages, 0, ctrl_send_size, GFP_KERNEL);
c57ccf06374bd0 Zach Reizner     2017-08-14  948  		if (ret)
c57ccf06374bd0 Zach Reizner     2017-08-14  949  			goto free_ctrl_send;
c57ccf06374bd0 Zach Reizner     2017-08-14  950  
25cf89572247d2 Suleiman Souhlal 2021-06-08  951  		sg_init_table(&in_sg, 1);
25cf89572247d2 Suleiman Souhlal 2021-06-08  952  		sg_set_page(&in_sg, area->pages[0],
25cf89572247d2 Suleiman Souhlal 2021-06-08  953  		    sizeof(struct virtio_wl_ctrl_hdr), 0);
25cf89572247d2 Suleiman Souhlal 2021-06-08  954  
25cf89572247d2 Suleiman Souhlal 2021-06-08  955  		ret = vq_queue_out(vi, sgt.sgl, &in_sg, &finish_completion,
25cf89572247d2 Suleiman Souhlal 2021-06-08  956  		    filp->f_flags & O_NONBLOCK);
25cf89572247d2 Suleiman Souhlal 2021-06-08  957  	}
25cf89572247d2 Suleiman Souhlal 2021-06-08  958  	if (ret)
25cf89572247d2 Suleiman Souhlal 2021-06-08  959  		goto free_sgt;
25cf89572247d2 Suleiman Souhlal 2021-06-08  960  
c57ccf06374bd0 Zach Reizner     2017-08-14  961  	wait_for_completion(&finish_completion);
c57ccf06374bd0 Zach Reizner     2017-08-14  962  
c57ccf06374bd0 Zach Reizner     2017-08-14  963  	ret = virtwl_resp_err(ctrl_send->hdr.type);
c57ccf06374bd0 Zach Reizner     2017-08-14  964  
25cf89572247d2 Suleiman Souhlal 2021-06-08  965  free_sgt:
25cf89572247d2 Suleiman Souhlal 2021-06-08  966  	if (vmalloced)
25cf89572247d2 Suleiman Souhlal 2021-06-08  967  		sg_free_table(&sgt);
c57ccf06374bd0 Zach Reizner     2017-08-14  968  free_ctrl_send:
25cf89572247d2 Suleiman Souhlal 2021-06-08  969  	kvfree(ctrl_send);
c57ccf06374bd0 Zach Reizner     2017-08-14  970  put_files:
c57ccf06374bd0 Zach Reizner     2017-08-14  971  	for (i = 0; i < VIRTWL_SEND_MAX_ALLOCS; i++) {
c57ccf06374bd0 Zach Reizner     2017-08-14  972  		if (vfd_files[i].file)
c57ccf06374bd0 Zach Reizner     2017-08-14  973  			fdput(vfd_files[i]);
c57ccf06374bd0 Zach Reizner     2017-08-14  974  #ifdef SEND_VIRTGPU_RESOURCES
c57ccf06374bd0 Zach Reizner     2017-08-14  975  		if (virtgpu_dma_bufs[i])
c57ccf06374bd0 Zach Reizner     2017-08-14  976  			dma_buf_put(virtgpu_dma_bufs[i]);
84f65ea7620d8a David Stevens    2020-04-22  977  		if (virtgpu_dma_fence[i])
84f65ea7620d8a David Stevens    2020-04-22  978  			dma_fence_put(virtgpu_dma_fence[i]);
c57ccf06374bd0 Zach Reizner     2017-08-14  979  #endif
c57ccf06374bd0 Zach Reizner     2017-08-14  980  	}
c57ccf06374bd0 Zach Reizner     2017-08-14  981  	return ret;
c57ccf06374bd0 Zach Reizner     2017-08-14  982  }
c57ccf06374bd0 Zach Reizner     2017-08-14  983  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8881AF0AF
	for <oe-kbuild@lists.linux.dev>; Sun, 18 Jan 2026 03:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768705361; cv=none; b=KUYoNYn4Z5ilST0e5uNWhAZ5Yt2/fHLUCICpxKgj3iz5CkhxtwxWEqVaVDNtIxfPftuijwTh0NelrnrObcCBrq6w6UxZ5R2LNBQI+nzaFEaQjPWWVY2aDIHSz5jl3gJwZ6/jBoMQVc54CEEcQEnL2ybI4Ay0x7KyWZWm3uL0gOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768705361; c=relaxed/simple;
	bh=ikGCM5YbTRVuySnmU1yzfFkIP8VwiREhuRfw9faELys=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=GAo7rBqftE3efo8x/2nFa3qYqGbuGTwJtNlmTQzn7H9vwwjK4r51ZCzrWGjNFt/Po5s/ooiiH+eTr0Odm24sPnMEXMeinxyyEao5WzpQJ56VYGZhIYSqICwG9sj2J452MSI7Vks4ybmaKeCsXYMOFlkOkjZRvEFDHh0jAHIvqew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YQjt+Ds/; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YQjt+Ds/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768705360; x=1800241360;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ikGCM5YbTRVuySnmU1yzfFkIP8VwiREhuRfw9faELys=;
  b=YQjt+Ds/K0SUje15B58aX5XmWIi0Ae5/sijYlrY7mShbC0ohEtJ0TvFI
   fPZWXfgUXfnym1OmdV7B9XSsRBU0cGlHseVz5X0dBP4ujWnTnF91360WL
   9aNmaG87NCe0YS+j+vqDOUUuw8E5Ri3xLY5c581woaS4wukCKNX4BDblW
   yuOi+iwQOviQBS+wxFx63pv8YMpuEo861I9G9DF59JzjvTldM6nI1ETS6
   QJF92MWJG+J5v3iSrLdHMwbU8hf8XloufUprGm9fiMuPDOBj/NeSpKGVy
   c+sLSEWT4BMzGwK906X2FRhqi0GxuVca90zglJJzKzy0PiQQn6RdjqDug
   A==;
X-CSE-ConnectionGUID: dm4UsH45SgCDGtD4mqskAg==
X-CSE-MsgGUID: ZZMd1iuxQSeUuf/FLsNoeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11674"; a="70049425"
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="70049425"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 19:02:39 -0800
X-CSE-ConnectionGUID: TwEI1UDUQ+28kH4UKXbNNg==
X-CSE-MsgGUID: 3cBK8jNXTHaVlFG30Wd5qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="243126684"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 17 Jan 2026 19:02:37 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhJ3j-00000000Maq-0A3n;
	Sun, 18 Jan 2026 03:02:35 +0000
Date: Sun, 18 Jan 2026 11:01:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [drm-xe:drm-xe-next 7/13]
 drivers/gpu/drm/xe/xe_exec_queue.c:1210 xe_exec_queue_create_ioctl() error:
 uninitialized symbol 'vm'.
Message-ID: <202601181038.fKbOD9xa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: intel-xe@lists.freedesktop.org
TO: Matthew Brost <matthew.brost@intel.com>
CC: Stuart Summers <stuart.summers@intel.com>

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
head:   6cdaa5346d6f3f6116e607e49c92c2401390c267
commit: a3866ce7b1221353b795603bb8d0c81d81e60e65 [7/13] drm/xe: Add vm to e=
xec queues association
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago
config: parisc-randconfig-r073-20260118 (https://download.01.org/0day-ci/ar=
chive/20260118/202601181038.fKbOD9xa-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.4.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601181038.fKbOD9xa-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/xe/xe_exec_queue.c:1210 xe_exec_queue_create_ioctl() error:=
 uninitialized symbol 'vm'.

Old smatch warnings:
drivers/gpu/drm/xe/xe_exec_queue.c:1047 calc_validate_logical_mask() error:=
 uninitialized symbol 'gt_id'.
drivers/gpu/drm/xe/xe_exec_queue.c:1048 calc_validate_logical_mask() error:=
 uninitialized symbol 'class'.
drivers/gpu/drm/xe/xe_exec_queue.c:1060 calc_validate_logical_mask() error:=
 uninitialized symbol 'prev_mask'.
drivers/gpu/drm/xe/xe_exec_queue.c:1185 xe_exec_queue_create_ioctl() warn: =
missing unwind goto?
drivers/gpu/drm/xe/xe_exec_queue.c:1142 xe_exec_queue_create_ioctl() warn: =
address of NULL pointer 'q'

vim +/vm +1210 drivers/gpu/drm/xe/xe_exec_queue.c

b7fa6016a2bb67 drivers/gpu/drm/xe/xe_exec_queue.c Daniele Ceraolo Spurio   =
 2025-12-18  1079 =20
9b9529ce379a08 drivers/gpu/drm/xe/xe_exec_queue.c Francois Dugast          =
 2023-07-31  1080  int xe_exec_queue_create_ioctl(struct drm_device *dev, v=
oid *data,
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost            =
 2023-03-30  1081  			       struct drm_file *file)
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost            =
 2023-03-30  1082  {
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost            =
 2023-03-30  1083  	struct xe_device *xe =3D to_xe_device(dev);
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost            =
 2023-03-30  1084  	struct xe_file *xef =3D to_xe_file(file);
9b9529ce379a08 drivers/gpu/drm/xe/xe_exec_queue.c Francois Dugast          =
 2023-07-31  1085  	struct drm_xe_exec_queue_create *args =3D data;
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost            =
 2023-03-30  1086  	struct drm_xe_engine_class_instance eci[XE_HW_ENGINE_MA=
X_INSTANCE];
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost            =
 2023-03-30  1087  	struct drm_xe_engine_class_instance __user *user_eci =
=3D
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost            =
 2023-03-30  1088  		u64_to_user_ptr(args->instances);
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost            =
 2023-03-30  1089  	struct xe_hw_engine *hwe;
852856e3b6f679 drivers/gpu/drm/xe/xe_exec_queue.c Matthew Brost            =
 2024-08-15  1090  	struct xe_vm *vm;
852856e3b6f679 drivers/gpu/drm/xe/xe_exec_queue.c Matthew Brost            =
 2024-08-15  1091  	struct xe_tile *tile;
9b9529ce379a08 drivers/gpu/drm/xe/xe_exec_queue.c Francois Dugast          =
 2023-07-31  1092  	struct xe_exec_queue *q =3D NULL;
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost            =
 2023-03-30  1093  	u32 logical_mask;
5488bec96bccbd drivers/gpu/drm/xe/xe_exec_queue.c Tejas Upadhyay           =
 2025-02-28  1094  	u32 flags =3D 0;
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost            =
 2023-03-30  1095  	u32 id;
7f38e1e1063e1b drivers/gpu/drm/xe/xe_engine.c     Paulo Zanoni             =
 2023-06-26  1096  	u32 len;
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost            =
 2023-03-30  1097  	int err;
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost            =
 2023-03-30  1098 =20
5488bec96bccbd drivers/gpu/drm/xe/xe_exec_queue.c Tejas Upadhyay           =
 2025-02-28  1099  	if (XE_IOCTL_DBG(xe, args->flags & ~DRM_XE_EXEC_QUEUE_L=
OW_LATENCY_HINT) ||
b8c1ba831e6750 drivers/gpu/drm/xe/xe_engine.c     Francois Dugast          =
 2023-07-17  1100  	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserve=
d[1]))
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost            =
 2023-03-30  1101  		return -EINVAL;
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost            =
 2023-03-30  1102 =20
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost            =
 2023-03-30  1103  	len =3D args->width * args->num_placements;
b8c1ba831e6750 drivers/gpu/drm/xe/xe_engine.c     Francois Dugast          =
 2023-07-17  1104  	if (XE_IOCTL_DBG(xe, !len || len > XE_HW_ENGINE_MAX_INS=
TANCE))
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost            =
 2023-03-30  1105  		return -EINVAL;
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost            =
 2023-03-30  1106 =20
aef87a5fdb5117 drivers/gpu/drm/xe/xe_exec_queue.c Harish Chegondi          =
 2025-05-01  1107  	err =3D copy_from_user(eci, user_eci,
aef87a5fdb5117 drivers/gpu/drm/xe/xe_exec_queue.c Harish Chegondi          =
 2025-05-01  1108  			     sizeof(struct drm_xe_engine_class_instance) * le=
n);
b8c1ba831e6750 drivers/gpu/drm/xe/xe_engine.c     Francois Dugast          =
 2023-07-17  1109  	if (XE_IOCTL_DBG(xe, err))
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost            =
 2023-03-30  1110  		return -EFAULT;
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost            =
 2023-03-30  1111 =20
457123d5a03517 drivers/gpu/drm/xe/xe_exec_queue.c Matt Roper               =
 2025-07-01  1112  	if (XE_IOCTL_DBG(xe, !xe_device_get_gt(xe, eci[0].gt_id=
)))
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost            =
 2023-03-30  1113  		return -EINVAL;
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost            =
 2023-03-30  1114 =20
5488bec96bccbd drivers/gpu/drm/xe/xe_exec_queue.c Tejas Upadhyay           =
 2025-02-28  1115  	if (args->flags & DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT)
5488bec96bccbd drivers/gpu/drm/xe/xe_exec_queue.c Tejas Upadhyay           =
 2025-02-28  1116  		flags |=3D EXEC_QUEUE_FLAG_LOW_LATENCY;
5488bec96bccbd drivers/gpu/drm/xe/xe_exec_queue.c Tejas Upadhyay           =
 2025-02-28  1117 =20
d3d767396a02fa drivers/gpu/drm/xe/xe_exec_queue.c Matthew Brost            =
 2023-12-15  1118  	if (eci[0].engine_class =3D=3D DRM_XE_ENGINE_CLASS_VM_B=
IND) {
852856e3b6f679 drivers/gpu/drm/xe/xe_exec_queue.c Matthew Brost            =
 2024-08-15  1119  		if (XE_IOCTL_DBG(xe, args->width !=3D 1) ||
852856e3b6f679 drivers/gpu/drm/xe/xe_exec_queue.c Matthew Brost            =
 2024-08-15  1120  		    XE_IOCTL_DBG(xe, args->num_placements !=3D 1) ||
852856e3b6f679 drivers/gpu/drm/xe/xe_exec_queue.c Matthew Brost            =
 2024-08-15  1121  		    XE_IOCTL_DBG(xe, eci[0].engine_instance !=3D 0))
67f2f0d7371709 drivers/gpu/drm/xe/xe_engine.c     Matthew Brost            =
 2023-04-10  1122  			return -EINVAL;
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost            =
 2023-03-30  1123 =20
852856e3b6f679 drivers/gpu/drm/xe/xe_exec_queue.c Matthew Brost            =
 2024-08-15  1124  		for_each_tile(tile, xe, id) {
852856e3b6f679 drivers/gpu/drm/xe/xe_exec_queue.c Matthew Brost            =
 2024-08-15  1125  			struct xe_exec_queue *new;
6aa26f6eb829fb drivers/gpu/drm/xe/xe_engine.c     Matthew Auld             =
 2023-07-26  1126 =20
5488bec96bccbd drivers/gpu/drm/xe/xe_exec_queue.c Tejas Upadhyay           =
 2025-02-28  1127  			flags |=3D EXEC_QUEUE_FLAG_VM;
852856e3b6f679 drivers/gpu/drm/xe/xe_exec_queue.c Matthew Brost            =
 2024-08-15  1128  			if (id)
852856e3b6f679 drivers/gpu/drm/xe/xe_exec_queue.c Matthew Brost            =
 2024-08-15  1129  				flags |=3D EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD;
25ce7c5063b335 drivers/gpu/drm/xe/xe_exec_queue.c Brian Welty              =
 2024-01-10  1130 =20
852856e3b6f679 drivers/gpu/drm/xe/xe_exec_queue.c Matthew Brost            =
 2024-08-15  1131  			new =3D xe_exec_queue_create_bind(xe, tile, flags,
25ce7c5063b335 drivers/gpu/drm/xe/xe_exec_queue.c Brian Welty              =
 2024-01-10  1132  							args->extensions);
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost            =
 2023-03-30  1133  			if (IS_ERR(new)) {
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost            =
 2023-03-30  1134  				err =3D PTR_ERR(new);
9b9529ce379a08 drivers/gpu/drm/xe/xe_exec_queue.c Francois Dugast          =
 2023-07-31  1135  				if (q)
9b9529ce379a08 drivers/gpu/drm/xe/xe_exec_queue.c Francois Dugast          =
 2023-07-31  1136  					goto put_exec_queue;
67f2f0d7371709 drivers/gpu/drm/xe/xe_engine.c     Matthew Brost            =
 2023-04-10  1137  				return err;
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost            =
 2023-03-30  1138  			}
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost            =
 2023-03-30  1139  			if (id =3D=3D 0)
9b9529ce379a08 drivers/gpu/drm/xe/xe_exec_queue.c Francois Dugast          =
 2023-07-31  1140  				q =3D new;
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost            =
 2023-03-30  1141  			else
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost            =
 2023-03-30  1142  				list_add_tail(&new->multi_gt_list,
9b9529ce379a08 drivers/gpu/drm/xe/xe_exec_queue.c Francois Dugast          =
 2023-07-31  1143  					      &q->multi_gt_link);
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost            =
 2023-03-30  1144  		}
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost            =
 2023-03-30  1145  	} else {
a1e5b6d83e03d6 drivers/gpu/drm/xe/xe_exec_queue.c Matt Roper               =
 2025-02-18  1146  		logical_mask =3D calc_validate_logical_mask(xe, eci,
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost            =
 2023-03-30  1147  							  args->width,
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost            =
 2023-03-30  1148  							  args->num_placements);
b8c1ba831e6750 drivers/gpu/drm/xe/xe_engine.c     Francois Dugast          =
 2023-07-17  1149  		if (XE_IOCTL_DBG(xe, !logical_mask))
67f2f0d7371709 drivers/gpu/drm/xe/xe_engine.c     Matthew Brost            =
 2023-04-10  1150  			return -EINVAL;
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost            =
 2023-03-30  1151 =20
6f20fc09936e78 drivers/gpu/drm/xe/xe_exec_queue.c Dominik Grzegorzek       =
 2024-07-29  1152  		hwe =3D xe_hw_engine_lookup(xe, eci[0]);
b8c1ba831e6750 drivers/gpu/drm/xe/xe_engine.c     Francois Dugast          =
 2023-07-17  1153  		if (XE_IOCTL_DBG(xe, !hwe))
67f2f0d7371709 drivers/gpu/drm/xe/xe_engine.c     Matthew Brost            =
 2023-04-10  1154  			return -EINVAL;
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost            =
 2023-03-30  1155 =20
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost            =
 2023-03-30  1156  		vm =3D xe_vm_lookup(xef, args->vm_id);
b8c1ba831e6750 drivers/gpu/drm/xe/xe_engine.c     Francois Dugast          =
 2023-07-17  1157  		if (XE_IOCTL_DBG(xe, !vm))
67f2f0d7371709 drivers/gpu/drm/xe/xe_engine.c     Matthew Brost            =
 2023-04-10  1158  			return -ENOENT;
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost            =
 2023-03-30  1159 =20
9d858b69b0cfb5 drivers/gpu/drm/xe/xe_engine.c     Matthew Brost            =
 2023-06-22  1160  		err =3D down_read_interruptible(&vm->lock);
9d858b69b0cfb5 drivers/gpu/drm/xe/xe_engine.c     Matthew Brost            =
 2023-06-22  1161  		if (err) {
9d858b69b0cfb5 drivers/gpu/drm/xe/xe_engine.c     Matthew Brost            =
 2023-06-22  1162  			xe_vm_put(vm);
9d858b69b0cfb5 drivers/gpu/drm/xe/xe_engine.c     Matthew Brost            =
 2023-06-22  1163  			return err;
9d858b69b0cfb5 drivers/gpu/drm/xe/xe_engine.c     Matthew Brost            =
 2023-06-22  1164  		}
9d858b69b0cfb5 drivers/gpu/drm/xe/xe_engine.c     Matthew Brost            =
 2023-06-22  1165 =20
b8c1ba831e6750 drivers/gpu/drm/xe/xe_engine.c     Francois Dugast          =
 2023-07-17  1166  		if (XE_IOCTL_DBG(xe, xe_vm_is_closed_or_banned(vm))) {
9d858b69b0cfb5 drivers/gpu/drm/xe/xe_engine.c     Matthew Brost            =
 2023-06-22  1167  			up_read(&vm->lock);
9d858b69b0cfb5 drivers/gpu/drm/xe/xe_engine.c     Matthew Brost            =
 2023-06-22  1168  			xe_vm_put(vm);
9d858b69b0cfb5 drivers/gpu/drm/xe/xe_engine.c     Matthew Brost            =
 2023-06-22  1169  			return -ENOENT;
9d858b69b0cfb5 drivers/gpu/drm/xe/xe_engine.c     Matthew Brost            =
 2023-06-22  1170  		}
9d858b69b0cfb5 drivers/gpu/drm/xe/xe_engine.c     Matthew Brost            =
 2023-06-22  1171 =20
b7fa6016a2bb67 drivers/gpu/drm/xe/xe_exec_queue.c Daniele Ceraolo Spurio   =
 2025-12-18  1172  		/* SRIOV sched groups are not compatible with multi-lr=
c */
b7fa6016a2bb67 drivers/gpu/drm/xe/xe_exec_queue.c Daniele Ceraolo Spurio   =
 2025-12-18  1173  		if (XE_IOCTL_DBG(xe, args->width > 1 && has_sched_grou=
ps(hwe->gt))) {
b7fa6016a2bb67 drivers/gpu/drm/xe/xe_exec_queue.c Daniele Ceraolo Spurio   =
 2025-12-18  1174  			up_read(&vm->lock);
b7fa6016a2bb67 drivers/gpu/drm/xe/xe_exec_queue.c Daniele Ceraolo Spurio   =
 2025-12-18  1175  			xe_vm_put(vm);
b7fa6016a2bb67 drivers/gpu/drm/xe/xe_exec_queue.c Daniele Ceraolo Spurio   =
 2025-12-18  1176  			return -EINVAL;
b7fa6016a2bb67 drivers/gpu/drm/xe/xe_exec_queue.c Daniele Ceraolo Spurio   =
 2025-12-18  1177  		}
b7fa6016a2bb67 drivers/gpu/drm/xe/xe_exec_queue.c Daniele Ceraolo Spurio   =
 2025-12-18  1178 =20
9b9529ce379a08 drivers/gpu/drm/xe/xe_exec_queue.c Francois Dugast          =
 2023-07-31  1179  		q =3D xe_exec_queue_create(xe, vm, logical_mask,
5488bec96bccbd drivers/gpu/drm/xe/xe_exec_queue.c Tejas Upadhyay           =
 2025-02-28  1180  					 args->width, hwe, flags,
25ce7c5063b335 drivers/gpu/drm/xe/xe_exec_queue.c Brian Welty              =
 2024-01-10  1181  					 args->extensions);
9d858b69b0cfb5 drivers/gpu/drm/xe/xe_engine.c     Matthew Brost            =
 2023-06-22  1182  		up_read(&vm->lock);
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost            =
 2023-03-30  1183  		xe_vm_put(vm);
9b9529ce379a08 drivers/gpu/drm/xe/xe_exec_queue.c Francois Dugast          =
 2023-07-31  1184  		if (IS_ERR(q))
9b9529ce379a08 drivers/gpu/drm/xe/xe_exec_queue.c Francois Dugast          =
 2023-07-31  1185  			return PTR_ERR(q);
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost            =
 2023-03-30  1186 =20
d9ec63474648a2 drivers/gpu/drm/xe/xe_exec_queue.c Niranjana Vishwanathapura=
 2025-12-10  1187  		if (xe_exec_queue_is_multi_queue_secondary(q)) {
d9ec63474648a2 drivers/gpu/drm/xe/xe_exec_queue.c Niranjana Vishwanathapura=
 2025-12-10  1188  			err =3D xe_exec_queue_group_add(xe, q);
d9ec63474648a2 drivers/gpu/drm/xe/xe_exec_queue.c Niranjana Vishwanathapura=
 2025-12-10  1189  			if (XE_IOCTL_DBG(xe, err))
d9ec63474648a2 drivers/gpu/drm/xe/xe_exec_queue.c Niranjana Vishwanathapura=
 2025-12-10  1190  				goto put_exec_queue;
d9ec63474648a2 drivers/gpu/drm/xe/xe_exec_queue.c Niranjana Vishwanathapura=
 2025-12-10  1191  		}
d9ec63474648a2 drivers/gpu/drm/xe/xe_exec_queue.c Niranjana Vishwanathapura=
 2025-12-10  1192 =20
fdb6a05383fab3 drivers/gpu/drm/xe/xe_exec_queue.c Thomas Hellstr=C3=B6m    =
      2023-11-27  1193  		if (xe_vm_in_preempt_fence_mode(vm)) {
731e46c0322816 drivers/gpu/drm/xe/xe_exec_queue.c Francois Dugast          =
 2024-06-13  1194  			q->lr.context =3D dma_fence_context_alloc(1);
e05c6c97746307 drivers/gpu/drm/xe/xe_exec_queue.c Matthew Brost            =
 2023-09-20  1195 =20
e05c6c97746307 drivers/gpu/drm/xe/xe_exec_queue.c Matthew Brost            =
 2023-09-20  1196  			err =3D xe_vm_add_compute_exec_queue(vm, q);
b8c1ba831e6750 drivers/gpu/drm/xe/xe_engine.c     Francois Dugast          =
 2023-07-17  1197  			if (XE_IOCTL_DBG(xe, err))
d9ec63474648a2 drivers/gpu/drm/xe/xe_exec_queue.c Niranjana Vishwanathapura=
 2025-12-10  1198  				goto delete_queue_group;
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost            =
 2023-03-30  1199  		}
7970cb36966c9b drivers/gpu/drm/xe/xe_exec_queue.c Francois Dugast          =
 2024-08-09  1200 =20
7970cb36966c9b drivers/gpu/drm/xe/xe_exec_queue.c Francois Dugast          =
 2024-08-09  1201  		if (q->vm && q->hwe->hw_engine_group) {
7970cb36966c9b drivers/gpu/drm/xe/xe_exec_queue.c Francois Dugast          =
 2024-08-09  1202  			err =3D xe_hw_engine_group_add_exec_queue(q->hwe->hw_=
engine_group, q);
7970cb36966c9b drivers/gpu/drm/xe/xe_exec_queue.c Francois Dugast          =
 2024-08-09  1203  			if (err)
7970cb36966c9b drivers/gpu/drm/xe/xe_exec_queue.c Francois Dugast          =
 2024-08-09  1204  				goto put_exec_queue;
7970cb36966c9b drivers/gpu/drm/xe/xe_exec_queue.c Francois Dugast          =
 2024-08-09  1205  		}
e05c6c97746307 drivers/gpu/drm/xe/xe_exec_queue.c Matthew Brost            =
 2023-09-20  1206  	}
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost            =
 2023-03-30  1207 =20
16536582ddbebd drivers/gpu/drm/xe/xe_exec_queue.c Matthew Auld             =
 2024-09-25  1208  	q->xef =3D xe_file_get(xef);
a3866ce7b12213 drivers/gpu/drm/xe/xe_exec_queue.c Matthew Brost            =
 2026-01-16  1209  	if (eci[0].engine_class !=3D DRM_XE_ENGINE_CLASS_VM_BIN=
D)
a3866ce7b12213 drivers/gpu/drm/xe/xe_exec_queue.c Matthew Brost            =
 2026-01-16 @1210  		xe_vm_add_exec_queue(vm, q);
16536582ddbebd drivers/gpu/drm/xe/xe_exec_queue.c Matthew Auld             =
 2024-09-25  1211 =20
16536582ddbebd drivers/gpu/drm/xe/xe_exec_queue.c Matthew Auld             =
 2024-09-25  1212  	/* user id alloc must always be last in ioctl to preven=
t UAF */
9b9529ce379a08 drivers/gpu/drm/xe/xe_exec_queue.c Francois Dugast          =
 2023-07-31  1213  	err =3D xa_alloc(&xef->exec_queue.xa, &id, q, xa_limit_=
32b, GFP_KERNEL);
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost            =
 2023-03-30  1214  	if (err)
e05c6c97746307 drivers/gpu/drm/xe/xe_exec_queue.c Matthew Brost            =
 2023-09-20  1215  		goto kill_exec_queue;
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost            =
 2023-03-30  1216 =20
9b9529ce379a08 drivers/gpu/drm/xe/xe_exec_queue.c Francois Dugast          =
 2023-07-31  1217  	args->exec_queue_id =3D id;
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost            =
 2023-03-30  1218 =20
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost            =
 2023-03-30  1219  	return 0;
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost            =
 2023-03-30  1220 =20
e05c6c97746307 drivers/gpu/drm/xe/xe_exec_queue.c Matthew Brost            =
 2023-09-20  1221  kill_exec_queue:
9b9529ce379a08 drivers/gpu/drm/xe/xe_exec_queue.c Francois Dugast          =
 2023-07-31  1222  	xe_exec_queue_kill(q);
d9ec63474648a2 drivers/gpu/drm/xe/xe_exec_queue.c Niranjana Vishwanathapura=
 2025-12-10  1223  delete_queue_group:
d9ec63474648a2 drivers/gpu/drm/xe/xe_exec_queue.c Niranjana Vishwanathapura=
 2025-12-10  1224  	if (xe_exec_queue_is_multi_queue_secondary(q))
d9ec63474648a2 drivers/gpu/drm/xe/xe_exec_queue.c Niranjana Vishwanathapura=
 2025-12-10  1225  		xe_exec_queue_group_delete(xe, q);
e05c6c97746307 drivers/gpu/drm/xe/xe_exec_queue.c Matthew Brost            =
 2023-09-20  1226  put_exec_queue:
9b9529ce379a08 drivers/gpu/drm/xe/xe_exec_queue.c Francois Dugast          =
 2023-07-31  1227  	xe_exec_queue_put(q);
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost            =
 2023-03-30  1228  	return err;
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost            =
 2023-03-30  1229  }
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost            =
 2023-03-30  1230 =20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

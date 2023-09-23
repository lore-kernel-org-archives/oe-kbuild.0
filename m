Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83DB10A12
	for <oe-kbuild@lists.linux.dev>; Sat, 23 Sep 2023 14:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=HAQ4LTHO1ZgqgXeR4VZ4zPq0Xds6V2GjIpgXs6aWFrA=;
  b=CqSt43yc1OJPWVpVT45Dy+ce5F1ixdcCm4UE3eRnK7QLXQtahs4pH7LL
   IFrx3wMjOdeSlzX48xXGZiuIrV2UoKYKEacGpZlH71zJIyb/bv6pXFRo0
   tR4RVb5Q4pF1EfcZdIFqZaVQGJSpDC66mQXIlEI0OXX46txxbwDFb9svn
   I=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.03,171,1694728800"; 
   d="scan'208";a="127556165"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2023 16:56:44 +0200
Date: Sat, 23 Sep 2023 16:56:44 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Boris Burkov <boris@bur.io>, David Sterba <dsterba@suse.com>
cc: oe-kbuild@lists.linux.dev
Subject: Re: [kdave-btrfs-devel:misc-next 105/126] fs/btrfs/qgroup.c:3305:22-29:
 ERROR: reference preceded by free on line 3303
In-Reply-To: <202309230501.FnBPmnOv-lkp@intel.com>
Message-ID: <alpine.DEB.2.22.394.2309231652390.15175@hadrien>
References: <202309230501.FnBPmnOv-lkp@intel.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Please check the tests on lines 3302 and 3304 and see if they both can be
true.  If they cannot, perhaps an else code be added to make that apparent
in the code.

On Sat, 23 Sep 2023, kernel test robot wrote:

> BCC: lkp@intel.com
> CC: oe-kbuild-all@lists.linux.dev
> TO: Boris Burkov <boris@bur.io>
> CC: David Sterba <dsterba@suse.com>
>
> tree:   https://github.com/kdave/btrfs-devel.git misc-next
> head:   8e6405aa4724626637e23a02ab145b0c69edb7d7
> commit: 356d8a4649959f1cb271fbdf7052447592b1d2ec [105/126] btrfs: qgroup: simple quota auto hierarchy for nested subvolumes
> :::::: branch date: 3 hours ago
> :::::: commit date: 22 hours ago
> config: i386-randconfig-053-20230922 (https://download.01.org/0day-ci/archive/20230923/202309230501.FnBPmnOv-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20230923/202309230501.FnBPmnOv-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Julia Lawall <julia.lawall@inria.fr>
> | Closes: https://lore.kernel.org/r/202309230501.FnBPmnOv-lkp@intel.com/
>
> cocci warnings: (new ones prefixed by >>)
> >> fs/btrfs/qgroup.c:3305:22-29: ERROR: reference preceded by free on line 3303
>
> vim +3305 fs/btrfs/qgroup.c
>
> 356d8a4649959f Boris Burkov       2023-03-28  3059
> bed92eae26ccf2 Arne Jansen        2012-06-28  3060  /*
> 0132761017e012 Nicholas D Steeves 2016-05-19  3061   * Copy the accounting information between qgroups. This is necessary
> 918c2ee103cf99 Mark Fasheh        2016-03-30  3062   * when a snapshot or a subvolume is created. Throwing an error will
> 918c2ee103cf99 Mark Fasheh        2016-03-30  3063   * cause a transaction abort so we take extra care here to only error
> 918c2ee103cf99 Mark Fasheh        2016-03-30  3064   * when a readonly fs is a reasonable outcome.
> bed92eae26ccf2 Arne Jansen        2012-06-28  3065   */
> a937742250199a Lu Fengqi          2018-07-18  3066  int btrfs_qgroup_inherit(struct btrfs_trans_handle *trans, u64 srcid,
> 356d8a4649959f Boris Burkov       2023-03-28  3067  			 u64 objectid, u64 inode_rootid,
> 356d8a4649959f Boris Burkov       2023-03-28  3068  			 struct btrfs_qgroup_inherit *inherit)
> bed92eae26ccf2 Arne Jansen        2012-06-28  3069  {
> bed92eae26ccf2 Arne Jansen        2012-06-28  3070  	int ret = 0;
> bed92eae26ccf2 Arne Jansen        2012-06-28  3071  	int i;
> bed92eae26ccf2 Arne Jansen        2012-06-28  3072  	u64 *i_qgroups;
> e88439debd0a7f Qu Wenruo          2019-06-13  3073  	bool committing = false;
> a937742250199a Lu Fengqi          2018-07-18  3074  	struct btrfs_fs_info *fs_info = trans->fs_info;
> 552f0329c75b3e Filipe Manana      2018-11-19  3075  	struct btrfs_root *quota_root;
> bed92eae26ccf2 Arne Jansen        2012-06-28  3076  	struct btrfs_qgroup *srcgroup;
> bed92eae26ccf2 Arne Jansen        2012-06-28  3077  	struct btrfs_qgroup *dstgroup;
> d68c63ae6b3f6b Qu Wenruo          2023-08-29  3078  	struct btrfs_qgroup *prealloc;
> b6a91a0f7709ea Qu Wenruo          2023-09-01  3079  	struct btrfs_qgroup_list **qlist_prealloc = NULL;
> 356d8a4649959f Boris Burkov       2023-03-28  3080  	bool free_inherit = false;
> cbab8ade585a18 Qu Wenruo          2020-04-02  3081  	bool need_rescan = false;
> bed92eae26ccf2 Arne Jansen        2012-06-28  3082  	u32 level_size = 0;
> 3f5e2d3b3877d3 Wang Shilong       2013-04-07  3083  	u64 nums;
> bed92eae26ccf2 Arne Jansen        2012-06-28  3084
> d68c63ae6b3f6b Qu Wenruo          2023-08-29  3085  	prealloc = kzalloc(sizeof(*prealloc), GFP_NOFS);
> d68c63ae6b3f6b Qu Wenruo          2023-08-29  3086  	if (!prealloc)
> d68c63ae6b3f6b Qu Wenruo          2023-08-29  3087  		return -ENOMEM;
> d68c63ae6b3f6b Qu Wenruo          2023-08-29  3088
> e88439debd0a7f Qu Wenruo          2019-06-13  3089  	/*
> e88439debd0a7f Qu Wenruo          2019-06-13  3090  	 * There are only two callers of this function.
> e88439debd0a7f Qu Wenruo          2019-06-13  3091  	 *
> e88439debd0a7f Qu Wenruo          2019-06-13  3092  	 * One in create_subvol() in the ioctl context, which needs to hold
> e88439debd0a7f Qu Wenruo          2019-06-13  3093  	 * the qgroup_ioctl_lock.
> e88439debd0a7f Qu Wenruo          2019-06-13  3094  	 *
> e88439debd0a7f Qu Wenruo          2019-06-13  3095  	 * The other one in create_pending_snapshot() where no other qgroup
> e88439debd0a7f Qu Wenruo          2019-06-13  3096  	 * code can modify the fs as they all need to either start a new trans
> e88439debd0a7f Qu Wenruo          2019-06-13  3097  	 * or hold a trans handler, thus we don't need to hold
> e88439debd0a7f Qu Wenruo          2019-06-13  3098  	 * qgroup_ioctl_lock.
> e88439debd0a7f Qu Wenruo          2019-06-13  3099  	 * This would avoid long and complex lock chain and make lockdep happy.
> e88439debd0a7f Qu Wenruo          2019-06-13  3100  	 */
> e88439debd0a7f Qu Wenruo          2019-06-13  3101  	spin_lock(&fs_info->trans_lock);
> e88439debd0a7f Qu Wenruo          2019-06-13  3102  	if (trans->transaction->state == TRANS_STATE_COMMIT_DOING)
> e88439debd0a7f Qu Wenruo          2019-06-13  3103  		committing = true;
> e88439debd0a7f Qu Wenruo          2019-06-13  3104  	spin_unlock(&fs_info->trans_lock);
> e88439debd0a7f Qu Wenruo          2019-06-13  3105
> e88439debd0a7f Qu Wenruo          2019-06-13  3106  	if (!committing)
> f2f6ed3d54648e Wang Shilong       2013-04-07  3107  		mutex_lock(&fs_info->qgroup_ioctl_lock);
> ef8c33e84e64c1 Boris Burkov       2023-05-16  3108  	if (!btrfs_qgroup_enabled(fs_info))
> f2f6ed3d54648e Wang Shilong       2013-04-07  3109  		goto out;
> bed92eae26ccf2 Arne Jansen        2012-06-28  3110
> 552f0329c75b3e Filipe Manana      2018-11-19  3111  	quota_root = fs_info->quota_root;
> f2f6ed3d54648e Wang Shilong       2013-04-07  3112  	if (!quota_root) {
> f2f6ed3d54648e Wang Shilong       2013-04-07  3113  		ret = -EINVAL;
> f2f6ed3d54648e Wang Shilong       2013-04-07  3114  		goto out;
> f2f6ed3d54648e Wang Shilong       2013-04-07  3115  	}
> bed92eae26ccf2 Arne Jansen        2012-06-28  3116
> 356d8a4649959f Boris Burkov       2023-03-28  3117  	if (btrfs_qgroup_mode(fs_info) == BTRFS_QGROUP_MODE_SIMPLE && !inherit) {
> 356d8a4649959f Boris Burkov       2023-03-28  3118  		ret = qgroup_auto_inherit(fs_info, inode_rootid, &inherit);
> 356d8a4649959f Boris Burkov       2023-03-28  3119  		if (ret)
> 356d8a4649959f Boris Burkov       2023-03-28  3120  			goto out;
> 356d8a4649959f Boris Burkov       2023-03-28  3121  		free_inherit = true;
> 356d8a4649959f Boris Burkov       2023-03-28  3122  	}
> 356d8a4649959f Boris Burkov       2023-03-28  3123
> 3f5e2d3b3877d3 Wang Shilong       2013-04-07  3124  	if (inherit) {
> 3f5e2d3b3877d3 Wang Shilong       2013-04-07  3125  		i_qgroups = (u64 *)(inherit + 1);
> 3f5e2d3b3877d3 Wang Shilong       2013-04-07  3126  		nums = inherit->num_qgroups + 2 * inherit->num_ref_copies +
> 3f5e2d3b3877d3 Wang Shilong       2013-04-07  3127  		       2 * inherit->num_excl_copies;
> 3f5e2d3b3877d3 Wang Shilong       2013-04-07  3128  		for (i = 0; i < nums; ++i) {
> 3f5e2d3b3877d3 Wang Shilong       2013-04-07  3129  			srcgroup = find_qgroup_rb(fs_info, *i_qgroups);
> 09870d2772b284 Dongsheng Yang     2014-11-11  3130
> 918c2ee103cf99 Mark Fasheh        2016-03-30  3131  			/*
> 918c2ee103cf99 Mark Fasheh        2016-03-30  3132  			 * Zero out invalid groups so we can ignore
> 918c2ee103cf99 Mark Fasheh        2016-03-30  3133  			 * them later.
> 918c2ee103cf99 Mark Fasheh        2016-03-30  3134  			 */
> 918c2ee103cf99 Mark Fasheh        2016-03-30  3135  			if (!srcgroup ||
> 918c2ee103cf99 Mark Fasheh        2016-03-30  3136  			    ((srcgroup->qgroupid >> 48) <= (objectid >> 48)))
> 918c2ee103cf99 Mark Fasheh        2016-03-30  3137  				*i_qgroups = 0ULL;
> 918c2ee103cf99 Mark Fasheh        2016-03-30  3138
> 3f5e2d3b3877d3 Wang Shilong       2013-04-07  3139  			++i_qgroups;
> 3f5e2d3b3877d3 Wang Shilong       2013-04-07  3140  		}
> 3f5e2d3b3877d3 Wang Shilong       2013-04-07  3141  	}
> 3f5e2d3b3877d3 Wang Shilong       2013-04-07  3142
> bed92eae26ccf2 Arne Jansen        2012-06-28  3143  	/*
> bed92eae26ccf2 Arne Jansen        2012-06-28  3144  	 * create a tracking group for the subvol itself
> bed92eae26ccf2 Arne Jansen        2012-06-28  3145  	 */
> bed92eae26ccf2 Arne Jansen        2012-06-28  3146  	ret = add_qgroup_item(trans, quota_root, objectid);
> bed92eae26ccf2 Arne Jansen        2012-06-28  3147  	if (ret)
> bed92eae26ccf2 Arne Jansen        2012-06-28  3148  		goto out;
> bed92eae26ccf2 Arne Jansen        2012-06-28  3149
> bed92eae26ccf2 Arne Jansen        2012-06-28  3150  	/*
> bed92eae26ccf2 Arne Jansen        2012-06-28  3151  	 * add qgroup to all inherited groups
> bed92eae26ccf2 Arne Jansen        2012-06-28  3152  	 */
> bed92eae26ccf2 Arne Jansen        2012-06-28  3153  	if (inherit) {
> bed92eae26ccf2 Arne Jansen        2012-06-28  3154  		i_qgroups = (u64 *)(inherit + 1);
> 918c2ee103cf99 Mark Fasheh        2016-03-30  3155  		for (i = 0; i < inherit->num_qgroups; ++i, ++i_qgroups) {
> 918c2ee103cf99 Mark Fasheh        2016-03-30  3156  			if (*i_qgroups == 0)
> 918c2ee103cf99 Mark Fasheh        2016-03-30  3157  				continue;
> 711169c40f908d Lu Fengqi          2018-07-18  3158  			ret = add_qgroup_relation_item(trans, objectid,
> 711169c40f908d Lu Fengqi          2018-07-18  3159  						       *i_qgroups);
> 918c2ee103cf99 Mark Fasheh        2016-03-30  3160  			if (ret && ret != -EEXIST)
> bed92eae26ccf2 Arne Jansen        2012-06-28  3161  				goto out;
> 711169c40f908d Lu Fengqi          2018-07-18  3162  			ret = add_qgroup_relation_item(trans, *i_qgroups,
> 711169c40f908d Lu Fengqi          2018-07-18  3163  						       objectid);
> 918c2ee103cf99 Mark Fasheh        2016-03-30  3164  			if (ret && ret != -EEXIST)
> bed92eae26ccf2 Arne Jansen        2012-06-28  3165  				goto out;
> bed92eae26ccf2 Arne Jansen        2012-06-28  3166  		}
> 918c2ee103cf99 Mark Fasheh        2016-03-30  3167  		ret = 0;
> bed92eae26ccf2 Arne Jansen        2012-06-28  3168
> b6a91a0f7709ea Qu Wenruo          2023-09-01  3169  		qlist_prealloc = kcalloc(inherit->num_qgroups,
> b6a91a0f7709ea Qu Wenruo          2023-09-01  3170  					 sizeof(struct btrfs_qgroup_list *),
> b6a91a0f7709ea Qu Wenruo          2023-09-01  3171  					 GFP_NOFS);
> b6a91a0f7709ea Qu Wenruo          2023-09-01  3172  		if (!qlist_prealloc) {
> b6a91a0f7709ea Qu Wenruo          2023-09-01  3173  			ret = -ENOMEM;
> b6a91a0f7709ea Qu Wenruo          2023-09-01  3174  			goto out;
> b6a91a0f7709ea Qu Wenruo          2023-09-01  3175  		}
> b6a91a0f7709ea Qu Wenruo          2023-09-01  3176  		for (int i = 0; i < inherit->num_qgroups; i++) {
> b6a91a0f7709ea Qu Wenruo          2023-09-01  3177  			qlist_prealloc[i] = kzalloc(sizeof(struct btrfs_qgroup_list),
> b6a91a0f7709ea Qu Wenruo          2023-09-01  3178  						    GFP_NOFS);
> b6a91a0f7709ea Qu Wenruo          2023-09-01  3179  			if (!qlist_prealloc[i]) {
> b6a91a0f7709ea Qu Wenruo          2023-09-01  3180  				ret = -ENOMEM;
> b6a91a0f7709ea Qu Wenruo          2023-09-01  3181  				goto out;
> b6a91a0f7709ea Qu Wenruo          2023-09-01  3182  			}
> b6a91a0f7709ea Qu Wenruo          2023-09-01  3183  		}
> b6a91a0f7709ea Qu Wenruo          2023-09-01  3184  	}
> bed92eae26ccf2 Arne Jansen        2012-06-28  3185
> bed92eae26ccf2 Arne Jansen        2012-06-28  3186  	spin_lock(&fs_info->qgroup_lock);
> bed92eae26ccf2 Arne Jansen        2012-06-28  3187
> d68c63ae6b3f6b Qu Wenruo          2023-08-29  3188  	dstgroup = add_qgroup_rb(fs_info, prealloc, objectid);
> d68c63ae6b3f6b Qu Wenruo          2023-08-29  3189  	prealloc = NULL;
> bed92eae26ccf2 Arne Jansen        2012-06-28  3190
> e8c8541ac37970 Dongsheng Yang     2014-11-20  3191  	if (inherit && inherit->flags & BTRFS_QGROUP_INHERIT_SET_LIMITS) {
> e8c8541ac37970 Dongsheng Yang     2014-11-20  3192  		dstgroup->lim_flags = inherit->lim.flags;
> e8c8541ac37970 Dongsheng Yang     2014-11-20  3193  		dstgroup->max_rfer = inherit->lim.max_rfer;
> e8c8541ac37970 Dongsheng Yang     2014-11-20  3194  		dstgroup->max_excl = inherit->lim.max_excl;
> e8c8541ac37970 Dongsheng Yang     2014-11-20  3195  		dstgroup->rsv_rfer = inherit->lim.rsv_rfer;
> e8c8541ac37970 Dongsheng Yang     2014-11-20  3196  		dstgroup->rsv_excl = inherit->lim.rsv_excl;
> 1510e71c620c27 Dongsheng Yang     2014-11-20  3197
> f7e942b5bb35d8 ChenXiaoSong       2022-11-16  3198  		qgroup_dirty(fs_info, dstgroup);
> e8c8541ac37970 Dongsheng Yang     2014-11-20  3199  	}
> e8c8541ac37970 Dongsheng Yang     2014-11-20  3200
> ef8c33e84e64c1 Boris Burkov       2023-05-16  3201  	if (srcid && btrfs_qgroup_mode(fs_info) == BTRFS_QGROUP_MODE_FULL) {
> bed92eae26ccf2 Arne Jansen        2012-06-28  3202  		srcgroup = find_qgroup_rb(fs_info, srcid);
> f3a87f1b0c4086 Chris Mason        2012-09-14  3203  		if (!srcgroup)
> bed92eae26ccf2 Arne Jansen        2012-06-28  3204  			goto unlock;
> fcebe4562dec83 Josef Bacik        2014-05-13  3205
> fcebe4562dec83 Josef Bacik        2014-05-13  3206  		/*
> fcebe4562dec83 Josef Bacik        2014-05-13  3207  		 * We call inherit after we clone the root in order to make sure
> fcebe4562dec83 Josef Bacik        2014-05-13  3208  		 * our counts don't go crazy, so at this point the only
> fcebe4562dec83 Josef Bacik        2014-05-13  3209  		 * difference between the two roots should be the root node.
> fcebe4562dec83 Josef Bacik        2014-05-13  3210  		 */
> c8389d4c0d6eb7 Lu Fengqi          2018-07-17  3211  		level_size = fs_info->nodesize;
> fcebe4562dec83 Josef Bacik        2014-05-13  3212  		dstgroup->rfer = srcgroup->rfer;
> fcebe4562dec83 Josef Bacik        2014-05-13  3213  		dstgroup->rfer_cmpr = srcgroup->rfer_cmpr;
> fcebe4562dec83 Josef Bacik        2014-05-13  3214  		dstgroup->excl = level_size;
> fcebe4562dec83 Josef Bacik        2014-05-13  3215  		dstgroup->excl_cmpr = level_size;
> bed92eae26ccf2 Arne Jansen        2012-06-28  3216  		srcgroup->excl = level_size;
> bed92eae26ccf2 Arne Jansen        2012-06-28  3217  		srcgroup->excl_cmpr = level_size;
> 3eeb4d597efc9e Dongsheng Yang     2014-11-20  3218
> 3eeb4d597efc9e Dongsheng Yang     2014-11-20  3219  		/* inherit the limit info */
> 3eeb4d597efc9e Dongsheng Yang     2014-11-20  3220  		dstgroup->lim_flags = srcgroup->lim_flags;
> 3eeb4d597efc9e Dongsheng Yang     2014-11-20  3221  		dstgroup->max_rfer = srcgroup->max_rfer;
> 3eeb4d597efc9e Dongsheng Yang     2014-11-20  3222  		dstgroup->max_excl = srcgroup->max_excl;
> 3eeb4d597efc9e Dongsheng Yang     2014-11-20  3223  		dstgroup->rsv_rfer = srcgroup->rsv_rfer;
> 3eeb4d597efc9e Dongsheng Yang     2014-11-20  3224  		dstgroup->rsv_excl = srcgroup->rsv_excl;
> 3eeb4d597efc9e Dongsheng Yang     2014-11-20  3225
> bed92eae26ccf2 Arne Jansen        2012-06-28  3226  		qgroup_dirty(fs_info, dstgroup);
> bed92eae26ccf2 Arne Jansen        2012-06-28  3227  		qgroup_dirty(fs_info, srcgroup);
> bed92eae26ccf2 Arne Jansen        2012-06-28  3228  	}
> bed92eae26ccf2 Arne Jansen        2012-06-28  3229
> f3a87f1b0c4086 Chris Mason        2012-09-14  3230  	if (!inherit)
> bed92eae26ccf2 Arne Jansen        2012-06-28  3231  		goto unlock;
> bed92eae26ccf2 Arne Jansen        2012-06-28  3232
> bed92eae26ccf2 Arne Jansen        2012-06-28  3233  	i_qgroups = (u64 *)(inherit + 1);
> bed92eae26ccf2 Arne Jansen        2012-06-28  3234  	for (i = 0; i < inherit->num_qgroups; ++i) {
> 918c2ee103cf99 Mark Fasheh        2016-03-30  3235  		if (*i_qgroups) {
> b6a91a0f7709ea Qu Wenruo          2023-09-01  3236  			ret = add_relation_rb(fs_info, qlist_prealloc[i], objectid,
> b6a91a0f7709ea Qu Wenruo          2023-09-01  3237  					      *i_qgroups);
> b6a91a0f7709ea Qu Wenruo          2023-09-01  3238  			qlist_prealloc[i] = NULL;
> bed92eae26ccf2 Arne Jansen        2012-06-28  3239  			if (ret)
> bed92eae26ccf2 Arne Jansen        2012-06-28  3240  				goto unlock;
> 918c2ee103cf99 Mark Fasheh        2016-03-30  3241  		}
> bed92eae26ccf2 Arne Jansen        2012-06-28  3242  		++i_qgroups;
> cbab8ade585a18 Qu Wenruo          2020-04-02  3243
> cbab8ade585a18 Qu Wenruo          2020-04-02  3244  		/*
> cbab8ade585a18 Qu Wenruo          2020-04-02  3245  		 * If we're doing a snapshot, and adding the snapshot to a new
> cbab8ade585a18 Qu Wenruo          2020-04-02  3246  		 * qgroup, the numbers are guaranteed to be incorrect.
> cbab8ade585a18 Qu Wenruo          2020-04-02  3247  		 */
> cbab8ade585a18 Qu Wenruo          2020-04-02  3248  		if (srcid)
> cbab8ade585a18 Qu Wenruo          2020-04-02  3249  			need_rescan = true;
> bed92eae26ccf2 Arne Jansen        2012-06-28  3250  	}
> bed92eae26ccf2 Arne Jansen        2012-06-28  3251
> 918c2ee103cf99 Mark Fasheh        2016-03-30  3252  	for (i = 0; i <  inherit->num_ref_copies; ++i, i_qgroups += 2) {
> bed92eae26ccf2 Arne Jansen        2012-06-28  3253  		struct btrfs_qgroup *src;
> bed92eae26ccf2 Arne Jansen        2012-06-28  3254  		struct btrfs_qgroup *dst;
> bed92eae26ccf2 Arne Jansen        2012-06-28  3255
> 918c2ee103cf99 Mark Fasheh        2016-03-30  3256  		if (!i_qgroups[0] || !i_qgroups[1])
> 918c2ee103cf99 Mark Fasheh        2016-03-30  3257  			continue;
> 918c2ee103cf99 Mark Fasheh        2016-03-30  3258
> bed92eae26ccf2 Arne Jansen        2012-06-28  3259  		src = find_qgroup_rb(fs_info, i_qgroups[0]);
> bed92eae26ccf2 Arne Jansen        2012-06-28  3260  		dst = find_qgroup_rb(fs_info, i_qgroups[1]);
> bed92eae26ccf2 Arne Jansen        2012-06-28  3261
> bed92eae26ccf2 Arne Jansen        2012-06-28  3262  		if (!src || !dst) {
> bed92eae26ccf2 Arne Jansen        2012-06-28  3263  			ret = -EINVAL;
> bed92eae26ccf2 Arne Jansen        2012-06-28  3264  			goto unlock;
> bed92eae26ccf2 Arne Jansen        2012-06-28  3265  		}
> bed92eae26ccf2 Arne Jansen        2012-06-28  3266
> bed92eae26ccf2 Arne Jansen        2012-06-28  3267  		dst->rfer = src->rfer - level_size;
> bed92eae26ccf2 Arne Jansen        2012-06-28  3268  		dst->rfer_cmpr = src->rfer_cmpr - level_size;
> cbab8ade585a18 Qu Wenruo          2020-04-02  3269
> cbab8ade585a18 Qu Wenruo          2020-04-02  3270  		/* Manually tweaking numbers certainly needs a rescan */
> cbab8ade585a18 Qu Wenruo          2020-04-02  3271  		need_rescan = true;
> bed92eae26ccf2 Arne Jansen        2012-06-28  3272  	}
> 918c2ee103cf99 Mark Fasheh        2016-03-30  3273  	for (i = 0; i <  inherit->num_excl_copies; ++i, i_qgroups += 2) {
> bed92eae26ccf2 Arne Jansen        2012-06-28  3274  		struct btrfs_qgroup *src;
> bed92eae26ccf2 Arne Jansen        2012-06-28  3275  		struct btrfs_qgroup *dst;
> bed92eae26ccf2 Arne Jansen        2012-06-28  3276
> 918c2ee103cf99 Mark Fasheh        2016-03-30  3277  		if (!i_qgroups[0] || !i_qgroups[1])
> 918c2ee103cf99 Mark Fasheh        2016-03-30  3278  			continue;
> 918c2ee103cf99 Mark Fasheh        2016-03-30  3279
> bed92eae26ccf2 Arne Jansen        2012-06-28  3280  		src = find_qgroup_rb(fs_info, i_qgroups[0]);
> bed92eae26ccf2 Arne Jansen        2012-06-28  3281  		dst = find_qgroup_rb(fs_info, i_qgroups[1]);
> bed92eae26ccf2 Arne Jansen        2012-06-28  3282
> bed92eae26ccf2 Arne Jansen        2012-06-28  3283  		if (!src || !dst) {
> bed92eae26ccf2 Arne Jansen        2012-06-28  3284  			ret = -EINVAL;
> bed92eae26ccf2 Arne Jansen        2012-06-28  3285  			goto unlock;
> bed92eae26ccf2 Arne Jansen        2012-06-28  3286  		}
> bed92eae26ccf2 Arne Jansen        2012-06-28  3287
> bed92eae26ccf2 Arne Jansen        2012-06-28  3288  		dst->excl = src->excl + level_size;
> bed92eae26ccf2 Arne Jansen        2012-06-28  3289  		dst->excl_cmpr = src->excl_cmpr + level_size;
> cbab8ade585a18 Qu Wenruo          2020-04-02  3290  		need_rescan = true;
> bed92eae26ccf2 Arne Jansen        2012-06-28  3291  	}
> bed92eae26ccf2 Arne Jansen        2012-06-28  3292
> bed92eae26ccf2 Arne Jansen        2012-06-28  3293  unlock:
> bed92eae26ccf2 Arne Jansen        2012-06-28  3294  	spin_unlock(&fs_info->qgroup_lock);
> 49e5fb46211de0 Qu Wenruo          2020-06-28  3295  	if (!ret)
> 49e5fb46211de0 Qu Wenruo          2020-06-28  3296  		ret = btrfs_sysfs_add_one_qgroup(fs_info, dstgroup);
> bed92eae26ccf2 Arne Jansen        2012-06-28  3297  out:
> e88439debd0a7f Qu Wenruo          2019-06-13  3298  	if (!committing)
> f2f6ed3d54648e Wang Shilong       2013-04-07  3299  		mutex_unlock(&fs_info->qgroup_ioctl_lock);
> cbab8ade585a18 Qu Wenruo          2020-04-02  3300  	if (need_rescan)
> e562a8bdf652b0 Qu Wenruo          2022-08-24  3301  		qgroup_mark_inconsistent(fs_info);
> 356d8a4649959f Boris Burkov       2023-03-28  3302  	if (free_inherit)
> 356d8a4649959f Boris Burkov       2023-03-28 @3303  		kfree(inherit);
> b6a91a0f7709ea Qu Wenruo          2023-09-01  3304  	if (qlist_prealloc) {
> b6a91a0f7709ea Qu Wenruo          2023-09-01 @3305  		for (int i = 0; i < inherit->num_qgroups; i++)
> b6a91a0f7709ea Qu Wenruo          2023-09-01  3306  			kfree(qlist_prealloc[i]);
> b6a91a0f7709ea Qu Wenruo          2023-09-01  3307  		kfree(qlist_prealloc);
> b6a91a0f7709ea Qu Wenruo          2023-09-01  3308  	}
> d68c63ae6b3f6b Qu Wenruo          2023-08-29  3309  	kfree(prealloc);
> bed92eae26ccf2 Arne Jansen        2012-06-28  3310  	return ret;
> bed92eae26ccf2 Arne Jansen        2012-06-28  3311  }
> bed92eae26ccf2 Arne Jansen        2012-06-28  3312
>
> :::::: The code at line 3305 was first introduced by commit
> :::::: b6a91a0f7709eaeac32d6e39876ba42c06e09f0d btrfs: qgroup: prealloc btrfs_qgroup_list for __add_relation_rb()
>
> :::::: TO: Qu Wenruo <wqu@suse.com>
> :::::: CC: David Sterba <dsterba@suse.com>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>

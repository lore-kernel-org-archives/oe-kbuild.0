Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33EFE1F5851
	for <oe-kbuild@lists.linux.dev>; Fri,  1 Aug 2025 20:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754079410; cv=none; b=T1YggEFesE17hkdw38AQmaCvzJTX6fwzubpyw29N43sFCyTvffTaYpM2ctZzOjltkFZ+AYEqA+FjLqONseh9Q6N1NV1A7ID0UKjoh2DuClJbqPZgEmwMHPsnMDz1zcKkbArzmT3iQAP9L5WgklCaV8xQu0dQgWho2LDBlkALz74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754079410; c=relaxed/simple;
	bh=lbkV1MeWI+mTkMipEARwVxPqnHCNo6ZRa+UUZBHMuPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jsCdGixEnnv+lXVFqlZWnrKH26lEXI9sKucSXy+wA1ZC7zQj2J5YyWSWvBfmY0yxmYV9lldHaEyE5k8K/TtVj8IR4e4r/Bn4Ec8VVijHDR+bI8fIIPClHd+UNaNVzLh9RbP1wpp31VkV0yvJBr2lzwOIqBiHC4PIdbk2CNCRrA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PKFCPwbg; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PKFCPwbg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754079408; x=1785615408;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lbkV1MeWI+mTkMipEARwVxPqnHCNo6ZRa+UUZBHMuPQ=;
  b=PKFCPwbggpKJwwfL3M3pKZMg0xBS/jGUPKWZD2EYFTWPUxh3siTAiczh
   2Gx7Ku7Sg1O2Rlm9D4MU+Vfsug/72iHi+CfhFy3TauZ17IxRfJjqHOMrd
   4qBgQWsOlMiddp0wOyO+XSMIP5/P/LGWp7zoMLUudIyTDYmfuu6XGl02j
   gx+ozDQxfh2EgaAy+k9oiaAzSyj5M2gbgsW9v47yGrIwUpvzygGpgkqZS
   88K5thOKLariStc1o1D11jOiLY4BJI+oNjVj/cZaqWbDYRctz38CYVCJ0
   Anyi9C2DUVW9b0Q8FRYaY5LOF1xt8+kbiFourzmEs3IcXNXQ2CekSaEb0
   A==;
X-CSE-ConnectionGUID: YZofPgGlSjWjxS1U7QdIWw==
X-CSE-MsgGUID: SA/mreCrScmByJCGw6T3Qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="67128473"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="67128473"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2025 13:16:45 -0700
X-CSE-ConnectionGUID: fnWqAw7fQNSHMih9T9XD6w==
X-CSE-MsgGUID: X8xx8ngmQiWroh06bcaOpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="163662624"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 01 Aug 2025 13:16:44 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhwBF-0004tk-2w;
	Fri, 01 Aug 2025 20:16:41 +0000
Date: Sat, 2 Aug 2025 04:16:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 12911/13054] fs/bcachefs/snapshot.c:1149
 bch2_snapshot_node_delete() warn: missing error code? 'ret'
Message-ID: <202508020434.RgnHwchO-lkp@intel.com>
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
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b9ddaa95fd283bce7041550ddbbe7e764c477110
commit: 24c5e7ab4066da2073d1c50e82308c8bc0ec4ec3 [12911/13054] bcachefs: Convert bch2_bkey_get_mut() to CLASS(btree_iter)
:::::: branch date: 14 hours ago
:::::: commit date: 21 hours ago
config: parisc-randconfig-r071-20250801 (https://download.01.org/0day-ci/archive/20250802/202508020434.RgnHwchO-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508020434.RgnHwchO-lkp@intel.com/

smatch warnings:
fs/bcachefs/snapshot.c:1149 bch2_snapshot_node_delete() warn: missing error code? 'ret'

vim +/ret +1149 fs/bcachefs/snapshot.c

f55d6e07bc6c9b Kent Overstreet 2023-08-17  1109  
96dea3d599dbc3 Kent Overstreet 2023-09-12  1110  static int bch2_snapshot_node_delete(struct btree_trans *trans, u32 id)
8e877caaad8185 Kent Overstreet 2023-08-16  1111  {
8e877caaad8185 Kent Overstreet 2023-08-16  1112  	struct bch_fs *c = trans->c;
f55d6e07bc6c9b Kent Overstreet 2023-08-17  1113  	u32 parent_id, child_id;
8e877caaad8185 Kent Overstreet 2023-08-16  1114  	unsigned i;
8e877caaad8185 Kent Overstreet 2023-08-16  1115  
e9756dd29f33ed Kent Overstreet 2025-05-02  1116  	struct bkey_i_snapshot *s =
24c5e7ab4066da Kent Overstreet 2025-07-31  1117  		bch2_bkey_get_mut_typed(trans, BTREE_ID_snapshots, POS(0, id), 0, snapshot);
24c5e7ab4066da Kent Overstreet 2025-07-31  1118  	int ret = PTR_ERR_OR_ZERO(s);
8e877caaad8185 Kent Overstreet 2023-08-16  1119  	bch2_fs_inconsistent_on(bch2_err_matches(ret, ENOENT), c,
8e877caaad8185 Kent Overstreet 2023-08-16  1120  				"missing snapshot %u", id);
8e877caaad8185 Kent Overstreet 2023-08-16  1121  
8e877caaad8185 Kent Overstreet 2023-08-16  1122  	if (ret)
24c5e7ab4066da Kent Overstreet 2025-07-31  1123  		return ret;
8e877caaad8185 Kent Overstreet 2023-08-16  1124  
e9756dd29f33ed Kent Overstreet 2025-05-02  1125  	BUG_ON(BCH_SNAPSHOT_DELETED(&s->v));
e9756dd29f33ed Kent Overstreet 2025-05-02  1126  	BUG_ON(s->v.children[1]);
f55d6e07bc6c9b Kent Overstreet 2023-08-17  1127  
e9756dd29f33ed Kent Overstreet 2025-05-02  1128  	parent_id = le32_to_cpu(s->v.parent);
e9756dd29f33ed Kent Overstreet 2025-05-02  1129  	child_id = le32_to_cpu(s->v.children[0]);
8e877caaad8185 Kent Overstreet 2023-08-16  1130  
8e877caaad8185 Kent Overstreet 2023-08-16  1131  	if (parent_id) {
24c5e7ab4066da Kent Overstreet 2025-07-31  1132  		struct bkey_i_snapshot *parent =
24c5e7ab4066da Kent Overstreet 2025-07-31  1133  			bch2_bkey_get_mut_typed(trans, BTREE_ID_snapshots, POS(0, parent_id),
8e877caaad8185 Kent Overstreet 2023-08-16  1134  						0, snapshot);
8e877caaad8185 Kent Overstreet 2023-08-16  1135  		ret = PTR_ERR_OR_ZERO(parent);
8e877caaad8185 Kent Overstreet 2023-08-16  1136  		bch2_fs_inconsistent_on(bch2_err_matches(ret, ENOENT), c,
8e877caaad8185 Kent Overstreet 2023-08-16  1137  					"missing snapshot %u", parent_id);
f55d6e07bc6c9b Kent Overstreet 2023-08-17  1138  		if (unlikely(ret))
24c5e7ab4066da Kent Overstreet 2025-07-31  1139  			return ret;
8e877caaad8185 Kent Overstreet 2023-08-16  1140  
f55d6e07bc6c9b Kent Overstreet 2023-08-17  1141  		/* find entry in parent->children for node being deleted */
8e877caaad8185 Kent Overstreet 2023-08-16  1142  		for (i = 0; i < 2; i++)
8e877caaad8185 Kent Overstreet 2023-08-16  1143  			if (le32_to_cpu(parent->v.children[i]) == id)
8e877caaad8185 Kent Overstreet 2023-08-16  1144  				break;
8e877caaad8185 Kent Overstreet 2023-08-16  1145  
f55d6e07bc6c9b Kent Overstreet 2023-08-17  1146  		if (bch2_fs_inconsistent_on(i == 2, c,
f55d6e07bc6c9b Kent Overstreet 2023-08-17  1147  					"snapshot %u missing child pointer to %u",
f55d6e07bc6c9b Kent Overstreet 2023-08-17  1148  					parent_id, id))
24c5e7ab4066da Kent Overstreet 2025-07-31 @1149  			return ret;
8e877caaad8185 Kent Overstreet 2023-08-16  1150  
0a11adfb7aceb6 Kent Overstreet 2023-11-11  1151  		parent->v.children[i] = cpu_to_le32(child_id);
f55d6e07bc6c9b Kent Overstreet 2023-08-17  1152  
f55d6e07bc6c9b Kent Overstreet 2023-08-17  1153  		normalize_snapshot_child_pointers(&parent->v);
f55d6e07bc6c9b Kent Overstreet 2023-08-17  1154  	}
f55d6e07bc6c9b Kent Overstreet 2023-08-17  1155  
f55d6e07bc6c9b Kent Overstreet 2023-08-17  1156  	if (child_id) {
24c5e7ab4066da Kent Overstreet 2025-07-31  1157  		struct bkey_i_snapshot *child =
24c5e7ab4066da Kent Overstreet 2025-07-31  1158  			bch2_bkey_get_mut_typed(trans, BTREE_ID_snapshots, POS(0, child_id),
f55d6e07bc6c9b Kent Overstreet 2023-08-17  1159  						0, snapshot);
f55d6e07bc6c9b Kent Overstreet 2023-08-17  1160  		ret = PTR_ERR_OR_ZERO(child);
f55d6e07bc6c9b Kent Overstreet 2023-08-17  1161  		bch2_fs_inconsistent_on(bch2_err_matches(ret, ENOENT), c,
f55d6e07bc6c9b Kent Overstreet 2023-08-17  1162  					"missing snapshot %u", child_id);
f55d6e07bc6c9b Kent Overstreet 2023-08-17  1163  		if (unlikely(ret))
24c5e7ab4066da Kent Overstreet 2025-07-31  1164  			return ret;
f55d6e07bc6c9b Kent Overstreet 2023-08-17  1165  
f55d6e07bc6c9b Kent Overstreet 2023-08-17  1166  		child->v.parent = cpu_to_le32(parent_id);
f55d6e07bc6c9b Kent Overstreet 2023-08-17  1167  
f55d6e07bc6c9b Kent Overstreet 2023-08-17  1168  		if (!child->v.parent) {
f55d6e07bc6c9b Kent Overstreet 2023-08-17  1169  			child->v.skip[0] = 0;
f55d6e07bc6c9b Kent Overstreet 2023-08-17  1170  			child->v.skip[1] = 0;
f55d6e07bc6c9b Kent Overstreet 2023-08-17  1171  			child->v.skip[2] = 0;
f55d6e07bc6c9b Kent Overstreet 2023-08-17  1172  		}
f55d6e07bc6c9b Kent Overstreet 2023-08-17  1173  	}
f55d6e07bc6c9b Kent Overstreet 2023-08-17  1174  
f55d6e07bc6c9b Kent Overstreet 2023-08-17  1175  	if (!parent_id) {
8e877caaad8185 Kent Overstreet 2023-08-16  1176  		/*
8e877caaad8185 Kent Overstreet 2023-08-16  1177  		 * We're deleting the root of a snapshot tree: update the
8e877caaad8185 Kent Overstreet 2023-08-16  1178  		 * snapshot_tree entry to point to the new root, or delete it if
8e877caaad8185 Kent Overstreet 2023-08-16  1179  		 * this is the last snapshot ID in this tree:
8e877caaad8185 Kent Overstreet 2023-08-16  1180  		 */
8e877caaad8185 Kent Overstreet 2023-08-16  1181  
e9756dd29f33ed Kent Overstreet 2025-05-02  1182  		BUG_ON(s->v.children[1]);
8e877caaad8185 Kent Overstreet 2023-08-16  1183  
24c5e7ab4066da Kent Overstreet 2025-07-31  1184  		struct bkey_i_snapshot_tree *s_t = bch2_bkey_get_mut_typed(trans,
e9756dd29f33ed Kent Overstreet 2025-05-02  1185  				BTREE_ID_snapshot_trees, POS(0, le32_to_cpu(s->v.tree)),
8e877caaad8185 Kent Overstreet 2023-08-16  1186  				0, snapshot_tree);
8e877caaad8185 Kent Overstreet 2023-08-16  1187  		ret = PTR_ERR_OR_ZERO(s_t);
8e877caaad8185 Kent Overstreet 2023-08-16  1188  		if (ret)
24c5e7ab4066da Kent Overstreet 2025-07-31  1189  			return ret;
8e877caaad8185 Kent Overstreet 2023-08-16  1190  
e9756dd29f33ed Kent Overstreet 2025-05-02  1191  		if (s->v.children[0]) {
e9756dd29f33ed Kent Overstreet 2025-05-02  1192  			s_t->v.root_snapshot = s->v.children[0];
8e877caaad8185 Kent Overstreet 2023-08-16  1193  		} else {
8e877caaad8185 Kent Overstreet 2023-08-16  1194  			s_t->k.type = KEY_TYPE_deleted;
8e877caaad8185 Kent Overstreet 2023-08-16  1195  			set_bkey_val_u64s(&s_t->k, 0);
8e877caaad8185 Kent Overstreet 2023-08-16  1196  		}
8e877caaad8185 Kent Overstreet 2023-08-16  1197  	}
8e877caaad8185 Kent Overstreet 2023-08-16  1198  
e9756dd29f33ed Kent Overstreet 2025-05-02  1199  	if (!bch2_request_incompat_feature(c, bcachefs_metadata_version_snapshot_deletion_v2)) {
e9756dd29f33ed Kent Overstreet 2025-05-02  1200  		SET_BCH_SNAPSHOT_DELETED(&s->v, true);
e9756dd29f33ed Kent Overstreet 2025-05-02  1201  		s->v.parent		= 0;
e9756dd29f33ed Kent Overstreet 2025-05-02  1202  		s->v.children[0]	= 0;
e9756dd29f33ed Kent Overstreet 2025-05-02  1203  		s->v.children[1]	= 0;
e9756dd29f33ed Kent Overstreet 2025-05-02  1204  		s->v.subvol		= 0;
e9756dd29f33ed Kent Overstreet 2025-05-02  1205  		s->v.tree		= 0;
e9756dd29f33ed Kent Overstreet 2025-05-02  1206  		s->v.depth		= 0;
e9756dd29f33ed Kent Overstreet 2025-05-02  1207  		s->v.skip[0]		= 0;
e9756dd29f33ed Kent Overstreet 2025-05-02  1208  		s->v.skip[1]		= 0;
e9756dd29f33ed Kent Overstreet 2025-05-02  1209  		s->v.skip[2]		= 0;
e9756dd29f33ed Kent Overstreet 2025-05-02  1210  	} else {
e9756dd29f33ed Kent Overstreet 2025-05-02  1211  		s->k.type = KEY_TYPE_deleted;
e9756dd29f33ed Kent Overstreet 2025-05-02  1212  		set_bkey_val_u64s(&s->k, 0);
e9756dd29f33ed Kent Overstreet 2025-05-02  1213  	}
24c5e7ab4066da Kent Overstreet 2025-07-31  1214  
24c5e7ab4066da Kent Overstreet 2025-07-31  1215  	return 0;
8e877caaad8185 Kent Overstreet 2023-08-16  1216  }
8e877caaad8185 Kent Overstreet 2023-08-16  1217  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

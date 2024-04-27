Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9284AECE
	for <oe-kbuild@lists.linux.dev>; Sat, 27 Apr 2024 12:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714220620; cv=none; b=mzLOtyXZZ8cetutV+ZPKQB4mjs6saBHG3pjm3Ga0tjqz52tnJERCtjKLv2DPJkcdRYU/ueKJuJycqOzHW0zUjcLOvU+MfXWHGs8CKrp1P8VKssMH9g5BHhTbU29S4gDhiwVbxEKV0rwL+R4QW6J609EsaYlkMpvP5Ub0m0uZXnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714220620; c=relaxed/simple;
	bh=AjUt/JiS2yuaR8IfuUCs1Ahp2WpJtM6aWZtRyvRDZsU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t0wMl22wy6Lpr0x+K40DaUtcPzXNXQAvpQNTsJj8IWlo63kB1eaZuXrUloZSNnLpttKcV10wGnk09qTXZ54H4PDou2E5tgQMRvjwmBryxY8/4LnpPEGhb6kHwYO7cRlGHvNIv+6jd4CT7o1c2ONC7jyy8YGYjD5EDaUiEYcmY30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WTneH8Tp; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WTneH8Tp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714220618; x=1745756618;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AjUt/JiS2yuaR8IfuUCs1Ahp2WpJtM6aWZtRyvRDZsU=;
  b=WTneH8TpWtAi7YCYkVzQOpXjxS9iz5r6LoZraekokm5CERdXQ1d3TB/D
   EHTRzshxhMEeNEgiZTudibFhfwLNJIbR1XHqjKRhN8D0pnSbf/vfemW2S
   4+ttx34RQpCv4hiTWZSo/jXKXpclx7JSZmKsoyTd0sTZ2klvR1tirJE6R
   9t0VdRHf8PfQE3OWwbYv4uLnQNT0jINJ+zwpA1cadpryUKT+OurwPgS2q
   VQpVgozlP7uoPkAlNcZsubEjSr5UmmD2IuMrnGzCECPm1pHxbMwXIN3ge
   NhSeaufQMxFsoQK4RcAdihN5vvB2losMCNafxLxSiQIS5F5GAVDESuGEu
   w==;
X-CSE-ConnectionGUID: BcpNJxtdSBC89yhE0sLFlw==
X-CSE-MsgGUID: DbpEMC/BSWe5fc3uIyTs7g==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="27400285"
X-IronPort-AV: E=Sophos;i="6.07,235,1708416000"; 
   d="scan'208";a="27400285"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2024 05:23:35 -0700
X-CSE-ConnectionGUID: Rc+nns/gQGqLqA6lVTfLMw==
X-CSE-MsgGUID: yXrAYs7GSRKWzuiyudjBKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,235,1708416000"; 
   d="scan'208";a="26171432"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 27 Apr 2024 05:23:33 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0h5W-0004yS-2L;
	Sat, 27 Apr 2024 12:23:30 +0000
Date: Sat, 27 Apr 2024 20:23:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [drm-misc:for-linux-next 1/1]
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1267:17: sparse: sparse:
 statement expected after case label
Message-ID: <202404272055.XlGf5ZI8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1267:17: sparse: sparse: statement expected after case label"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: dri-devel@lists.freedesktop.org
TO: Timur Tabi <ttabi@nvidia.com>
CC: Danilo Krummrich <dakr@redhat.com>

tree:   git://anongit.freedesktop.org/drm/drm-misc for-linux-next
head:   c72211751870ffa2cff5d91834059456cfa7cbd5
commit: b58a0bc904ffa091fc020f7fd00e91808fec820e [1/1] nouveau: add command-line GSP-RM registry support
:::::: branch date: 5 hours ago
:::::: commit date: 20 hours ago
config: i386-randconfig-r132-20240427 (https://download.01.org/0day-ci/archive/20240427/202404272055.XlGf5ZI8-lkp@intel.com/config)
compiler: gcc-12 (Ubuntu 12.3.0-9ubuntu2) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240427/202404272055.XlGf5ZI8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202404272055.XlGf5ZI8-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1267:17: sparse: sparse: statement expected after case label
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:211:9: sparse: sparse: self-comparison always evaluates to false
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:262:17: sparse: sparse: self-comparison always evaluates to false
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:299:33: sparse: sparse: self-comparison always evaluates to false
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:378:17: sparse: sparse: self-comparison always evaluates to false
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:570:9: sparse: sparse: self-comparison always evaluates to false
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:605:25: sparse: sparse: self-comparison always evaluates to false
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:622:9: sparse: sparse: self-comparison always evaluates to false
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:664:25: sparse: sparse: self-comparison always evaluates to false
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:683:9: sparse: sparse: self-comparison always evaluates to false
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:848:17: sparse: sparse: self-comparison always evaluates to false
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:837:17: sparse: sparse: self-comparison always evaluates to false
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:878:17: sparse: sparse: self-comparison always evaluates to false
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:966:17: sparse: sparse: self-comparison always evaluates to false
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1171:17: sparse: sparse: self-comparison always evaluates to false
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1402:33: sparse: sparse: self-comparison always evaluates to false
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1420:33: sparse: sparse: self-comparison always evaluates to false
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1660:9: sparse: sparse: self-comparison always evaluates to false
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1676:9: sparse: sparse: self-comparison always evaluates to false
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1682:17: sparse: sparse: self-comparison always evaluates to false
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1699:9: sparse: sparse: self-comparison always evaluates to false
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1716:9: sparse: sparse: self-comparison always evaluates to false
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1734:25: sparse: sparse: self-comparison always evaluates to false
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1738:17: sparse: sparse: self-comparison always evaluates to false
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1764:9: sparse: sparse: self-comparison always evaluates to false
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1777:25: sparse: sparse: self-comparison always evaluates to false
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1786:25: sparse: sparse: self-comparison always evaluates to false
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1797:25: sparse: sparse: self-comparison always evaluates to false
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1808:25: sparse: sparse: self-comparison always evaluates to false
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1817:25: sparse: sparse: self-comparison always evaluates to false
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1822:25: sparse: sparse: self-comparison always evaluates to false
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1828:25: sparse: sparse: self-comparison always evaluates to false
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1835:25: sparse: sparse: self-comparison always evaluates to false
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1845:25: sparse: sparse: self-comparison always evaluates to false
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1875:25: sparse: sparse: self-comparison always evaluates to false
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1864:33: sparse: sparse: self-comparison always evaluates to false
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1893:17: sparse: sparse: self-comparison always evaluates to false
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:2451:9: sparse: sparse: self-comparison always evaluates to false

vim +1267 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c

b58a0bc904ffa0 Timur Tabi 2024-04-17  1199  
b58a0bc904ffa0 Timur Tabi 2024-04-17  1200  /**
b58a0bc904ffa0 Timur Tabi 2024-04-17  1201   * build_registry -- create the registry RPC data
b58a0bc904ffa0 Timur Tabi 2024-04-17  1202   * @gsp: gsp pointer
b58a0bc904ffa0 Timur Tabi 2024-04-17  1203   * @registry: pointer to the RPC payload to fill
b58a0bc904ffa0 Timur Tabi 2024-04-17  1204   *
b58a0bc904ffa0 Timur Tabi 2024-04-17  1205   * After all registry key/value pairs have been added, call this function to
b58a0bc904ffa0 Timur Tabi 2024-04-17  1206   * build the RPC.
b58a0bc904ffa0 Timur Tabi 2024-04-17  1207   *
b58a0bc904ffa0 Timur Tabi 2024-04-17  1208   * The registry RPC looks like this:
b58a0bc904ffa0 Timur Tabi 2024-04-17  1209   *
b58a0bc904ffa0 Timur Tabi 2024-04-17  1210   * +-----------------+
b58a0bc904ffa0 Timur Tabi 2024-04-17  1211   * |NvU32 size;      |
b58a0bc904ffa0 Timur Tabi 2024-04-17  1212   * |NvU32 numEntries;|
b58a0bc904ffa0 Timur Tabi 2024-04-17  1213   * +-----------------+
b58a0bc904ffa0 Timur Tabi 2024-04-17  1214   * +----------------------------------------+
b58a0bc904ffa0 Timur Tabi 2024-04-17  1215   * |PACKED_REGISTRY_ENTRY                   |
b58a0bc904ffa0 Timur Tabi 2024-04-17  1216   * +----------------------------------------+
b58a0bc904ffa0 Timur Tabi 2024-04-17  1217   * |Null-terminated key (string) for entry 0|
b58a0bc904ffa0 Timur Tabi 2024-04-17  1218   * +----------------------------------------+
b58a0bc904ffa0 Timur Tabi 2024-04-17  1219   * |Binary/string data value for entry 0    | (only if necessary)
b58a0bc904ffa0 Timur Tabi 2024-04-17  1220   * +----------------------------------------+
b58a0bc904ffa0 Timur Tabi 2024-04-17  1221   *
b58a0bc904ffa0 Timur Tabi 2024-04-17  1222   * +----------------------------------------+
b58a0bc904ffa0 Timur Tabi 2024-04-17  1223   * |PACKED_REGISTRY_ENTRY                   |
b58a0bc904ffa0 Timur Tabi 2024-04-17  1224   * +----------------------------------------+
b58a0bc904ffa0 Timur Tabi 2024-04-17  1225   * |Null-terminated key (string) for entry 1|
b58a0bc904ffa0 Timur Tabi 2024-04-17  1226   * +----------------------------------------+
b58a0bc904ffa0 Timur Tabi 2024-04-17  1227   * |Binary/string data value for entry 1    | (only if necessary)
b58a0bc904ffa0 Timur Tabi 2024-04-17  1228   * +----------------------------------------+
b58a0bc904ffa0 Timur Tabi 2024-04-17  1229   * ... (and so on, one copy for each entry)
b58a0bc904ffa0 Timur Tabi 2024-04-17  1230   *
b58a0bc904ffa0 Timur Tabi 2024-04-17  1231   *
b58a0bc904ffa0 Timur Tabi 2024-04-17  1232   * The 'data' field of an entry is either a 32-bit integer (for type DWORD)
b58a0bc904ffa0 Timur Tabi 2024-04-17  1233   * or an offset into the PACKED_REGISTRY_TABLE (for types BINARY and STRING).
b58a0bc904ffa0 Timur Tabi 2024-04-17  1234   *
b58a0bc904ffa0 Timur Tabi 2024-04-17  1235   * All memory allocated by add_registry() is released.
b58a0bc904ffa0 Timur Tabi 2024-04-17  1236   */
b58a0bc904ffa0 Timur Tabi 2024-04-17  1237  static void build_registry(struct nvkm_gsp *gsp, PACKED_REGISTRY_TABLE *registry)
b58a0bc904ffa0 Timur Tabi 2024-04-17  1238  {
b58a0bc904ffa0 Timur Tabi 2024-04-17  1239  	struct registry_list_entry *reg, *n;
b58a0bc904ffa0 Timur Tabi 2024-04-17  1240  	size_t str_offset;
b58a0bc904ffa0 Timur Tabi 2024-04-17  1241  	unsigned int i = 0;
b58a0bc904ffa0 Timur Tabi 2024-04-17  1242  
b58a0bc904ffa0 Timur Tabi 2024-04-17  1243  	registry->numEntries = list_count_nodes(&gsp->registry_list);
b58a0bc904ffa0 Timur Tabi 2024-04-17  1244  	str_offset = struct_size(registry, entries, registry->numEntries);
b58a0bc904ffa0 Timur Tabi 2024-04-17  1245  
b58a0bc904ffa0 Timur Tabi 2024-04-17  1246  	list_for_each_entry_safe(reg, n, &gsp->registry_list, head) {
b58a0bc904ffa0 Timur Tabi 2024-04-17  1247  		registry->entries[i].type = reg->type;
b58a0bc904ffa0 Timur Tabi 2024-04-17  1248  		registry->entries[i].length = reg->vlen;
b58a0bc904ffa0 Timur Tabi 2024-04-17  1249  
b58a0bc904ffa0 Timur Tabi 2024-04-17  1250  		/* Append the key name to the table */
b58a0bc904ffa0 Timur Tabi 2024-04-17  1251  		registry->entries[i].nameOffset = str_offset;
b58a0bc904ffa0 Timur Tabi 2024-04-17  1252  		memcpy((void *)registry + str_offset, reg->key, reg->klen);
b58a0bc904ffa0 Timur Tabi 2024-04-17  1253  		str_offset += reg->klen;
b58a0bc904ffa0 Timur Tabi 2024-04-17  1254  
b58a0bc904ffa0 Timur Tabi 2024-04-17  1255  		switch (reg->type) {
b58a0bc904ffa0 Timur Tabi 2024-04-17  1256  		case REGISTRY_TABLE_ENTRY_TYPE_DWORD:
b58a0bc904ffa0 Timur Tabi 2024-04-17  1257  			registry->entries[i].data = reg->dword;
b58a0bc904ffa0 Timur Tabi 2024-04-17  1258  			break;
b58a0bc904ffa0 Timur Tabi 2024-04-17  1259  		case REGISTRY_TABLE_ENTRY_TYPE_BINARY:
b58a0bc904ffa0 Timur Tabi 2024-04-17  1260  		case REGISTRY_TABLE_ENTRY_TYPE_STRING:
b58a0bc904ffa0 Timur Tabi 2024-04-17  1261  			/* If the type is binary or string, also append the value */
b58a0bc904ffa0 Timur Tabi 2024-04-17  1262  			memcpy((void *)registry + str_offset, reg->binary, reg->vlen);
b58a0bc904ffa0 Timur Tabi 2024-04-17  1263  			registry->entries[i].data = str_offset;
b58a0bc904ffa0 Timur Tabi 2024-04-17  1264  			str_offset += reg->vlen;
b58a0bc904ffa0 Timur Tabi 2024-04-17  1265  			break;
b58a0bc904ffa0 Timur Tabi 2024-04-17  1266  		default:
b58a0bc904ffa0 Timur Tabi 2024-04-17 @1267  		}
b58a0bc904ffa0 Timur Tabi 2024-04-17  1268  
b58a0bc904ffa0 Timur Tabi 2024-04-17  1269  		i++;
b58a0bc904ffa0 Timur Tabi 2024-04-17  1270  		list_del(&reg->head);
b58a0bc904ffa0 Timur Tabi 2024-04-17  1271  		kfree(reg);
b58a0bc904ffa0 Timur Tabi 2024-04-17  1272  	}
b58a0bc904ffa0 Timur Tabi 2024-04-17  1273  
b58a0bc904ffa0 Timur Tabi 2024-04-17  1274  	/* Double-check that we calculated the sizes correctly */
b58a0bc904ffa0 Timur Tabi 2024-04-17  1275  	WARN_ON(gsp->registry_rpc_size != str_offset);
b58a0bc904ffa0 Timur Tabi 2024-04-17  1276  
b58a0bc904ffa0 Timur Tabi 2024-04-17  1277  	registry->size = gsp->registry_rpc_size;
b58a0bc904ffa0 Timur Tabi 2024-04-17  1278  }
b58a0bc904ffa0 Timur Tabi 2024-04-17  1279  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

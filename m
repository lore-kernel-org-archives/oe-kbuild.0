Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40EE320D
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Jan 2023 20:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673728236; x=1705264236;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wKJGi34LvdCXrwSVWZBLVqGjzQ932FrWdLa3o71ljwA=;
  b=WVORKXJh+cFxQeLz8lom1SLBleHCDSbAfyfjIVK/Kv0i8InFCvGAFGjo
   AEG6XwHS+FTPj6652O3APEhLEESckVpiQl2hxrQP5w5vKq89dXkNMaZXx
   n/TMRMH0IxioL47hB4POTzvRjoqyG7BPj5CC4C/2ofjfTSmXnNk0M5MHN
   bQQFNHdL2KhQG9hplYpH679LyCMOya4Hzd24WVH0hHBYDNBh0d6Ya6PRs
   Ww8Ah5XwzH8QEexr2hrRYBITQx87uLWoK3EImxaST8YMgpNDt/VV6ywAd
   GujS/sxSuQ004oCr//Slw7W1CBUlQsDDK0bc9Kd4fsZh3/xpMotaOjGx8
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10590"; a="322933705"
X-IronPort-AV: E=Sophos;i="5.97,216,1669104000"; 
   d="scan'208";a="322933705"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2023 12:30:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10590"; a="782497265"
X-IronPort-AV: E=Sophos;i="5.97,216,1669104000"; 
   d="scan'208";a="782497265"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 14 Jan 2023 12:30:32 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pGnAd-000COW-10;
	Sat, 14 Jan 2023 20:30:31 +0000
Date: Sun, 15 Jan 2023 04:29:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 6/6] composefs: Add kconfig and build support
Message-ID: <202301150454.gfj4BzUM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="ZHxnAHRbnShX6hmY"
Content-Disposition: inline


--ZHxnAHRbnShX6hmY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <3cacd5065575e30f2120be6aa8587bc736aee774.1673623253.git.alexl@redhat.com>
References: <3cacd5065575e30f2120be6aa8587bc736aee774.1673623253.git.alexl@redhat.com>
TO: Alexander Larsson <alexl@redhat.com>
TO: linux-fsdevel@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: gscrivan@redhat.com
CC: Alexander Larsson <alexl@redhat.com>

Hi Alexander,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on fscrypt/fsverity]
[also build test WARNING on linus/master v6.2-rc3 next-20230113]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Larsson/fsverity-Export-fsverity_get_digest/20230113-234920
base:   https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git fsverity
patch link:    https://lore.kernel.org/r/3cacd5065575e30f2120be6aa8587bc736aee774.1673623253.git.alexl%40redhat.com
patch subject: [PATCH v2 6/6] composefs: Add kconfig and build support
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago
config: m68k-randconfig-m041-20230115
compiler: m68k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
fs/composefs/cfs-reader.c:813 cfs_dir_iterate() error: uninitialized symbol 'chunks_buf'.
fs/composefs/cfs-reader.c:860 cfs_dir_lookup_in_chunk() error: uninitialized symbol 'cmp'.
fs/composefs/cfs-reader.c:924 cfs_dir_lookup() error: uninitialized symbol 'chunks_buf'.

vim +/chunks_buf +813 fs/composefs/cfs-reader.c

4b543cf4700ea7 Alexander Larsson 2023-01-13  736  
4b543cf4700ea7 Alexander Larsson 2023-01-13  737  int cfs_dir_iterate(struct cfs_context_s *ctx, u64 index,
4b543cf4700ea7 Alexander Larsson 2023-01-13  738  		    struct cfs_inode_data_s *inode_data, loff_t first,
4b543cf4700ea7 Alexander Larsson 2023-01-13  739  		    cfs_dir_iter_cb cb, void *private)
4b543cf4700ea7 Alexander Larsson 2023-01-13  740  {
4b543cf4700ea7 Alexander Larsson 2023-01-13  741  	struct cfs_buf vdata_buf = { NULL };
4b543cf4700ea7 Alexander Larsson 2023-01-13  742  	struct cfs_dir_chunk_s *chunks;
4b543cf4700ea7 Alexander Larsson 2023-01-13  743  	struct cfs_dentry_s *dentries;
4b543cf4700ea7 Alexander Larsson 2023-01-13  744  	char *namedata, *namedata_end;
4b543cf4700ea7 Alexander Larsson 2023-01-13  745  	void *chunks_buf;
4b543cf4700ea7 Alexander Larsson 2023-01-13  746  	size_t n_chunks;
4b543cf4700ea7 Alexander Larsson 2023-01-13  747  	loff_t pos;
4b543cf4700ea7 Alexander Larsson 2023-01-13  748  	int res;
4b543cf4700ea7 Alexander Larsson 2023-01-13  749  
4b543cf4700ea7 Alexander Larsson 2023-01-13  750  	n_chunks = inode_data->n_dir_chunks;
4b543cf4700ea7 Alexander Larsson 2023-01-13  751  	if (n_chunks == 0)
4b543cf4700ea7 Alexander Larsson 2023-01-13  752  		return 0;
4b543cf4700ea7 Alexander Larsson 2023-01-13  753  
4b543cf4700ea7 Alexander Larsson 2023-01-13  754  	chunks = cfs_dir_get_chunk_info(ctx, index, inode_data, &chunks_buf);
4b543cf4700ea7 Alexander Larsson 2023-01-13  755  	if (IS_ERR(chunks))
4b543cf4700ea7 Alexander Larsson 2023-01-13  756  		return PTR_ERR(chunks);
4b543cf4700ea7 Alexander Larsson 2023-01-13  757  
4b543cf4700ea7 Alexander Larsson 2023-01-13  758  	pos = 0;
4b543cf4700ea7 Alexander Larsson 2023-01-13  759  	for (size_t i = 0; i < n_chunks; i++) {
4b543cf4700ea7 Alexander Larsson 2023-01-13  760  		/* Chunks info are verified/converted in cfs_dir_read_chunk_header */
4b543cf4700ea7 Alexander Larsson 2023-01-13  761  		u64 chunk_offset = chunks[i].chunk_offset;
4b543cf4700ea7 Alexander Larsson 2023-01-13  762  		size_t chunk_size = chunks[i].chunk_size;
4b543cf4700ea7 Alexander Larsson 2023-01-13  763  		size_t n_dentries = chunks[i].n_dentries;
4b543cf4700ea7 Alexander Larsson 2023-01-13  764  
4b543cf4700ea7 Alexander Larsson 2023-01-13  765  		/* Do we need to look at this chunk */
4b543cf4700ea7 Alexander Larsson 2023-01-13  766  		if (first >= pos + n_dentries) {
4b543cf4700ea7 Alexander Larsson 2023-01-13  767  			pos += n_dentries;
4b543cf4700ea7 Alexander Larsson 2023-01-13  768  			continue;
4b543cf4700ea7 Alexander Larsson 2023-01-13  769  		}
4b543cf4700ea7 Alexander Larsson 2023-01-13  770  
4b543cf4700ea7 Alexander Larsson 2023-01-13  771  		/* Read chunk dentries from page cache */
4b543cf4700ea7 Alexander Larsson 2023-01-13  772  		dentries = cfs_get_vdata_buf(ctx, chunk_offset, chunk_size,
4b543cf4700ea7 Alexander Larsson 2023-01-13  773  					     &vdata_buf);
4b543cf4700ea7 Alexander Larsson 2023-01-13  774  		if (IS_ERR(dentries)) {
4b543cf4700ea7 Alexander Larsson 2023-01-13  775  			res = PTR_ERR(dentries);
4b543cf4700ea7 Alexander Larsson 2023-01-13  776  			goto exit;
4b543cf4700ea7 Alexander Larsson 2023-01-13  777  		}
4b543cf4700ea7 Alexander Larsson 2023-01-13  778  
4b543cf4700ea7 Alexander Larsson 2023-01-13  779  		namedata = ((char *)dentries) +
4b543cf4700ea7 Alexander Larsson 2023-01-13  780  			   sizeof(struct cfs_dentry_s) * n_dentries;
4b543cf4700ea7 Alexander Larsson 2023-01-13  781  		namedata_end = ((char *)dentries) + chunk_size;
4b543cf4700ea7 Alexander Larsson 2023-01-13  782  
4b543cf4700ea7 Alexander Larsson 2023-01-13  783  		for (size_t j = 0; j < n_dentries; j++) {
4b543cf4700ea7 Alexander Larsson 2023-01-13  784  			struct cfs_dentry_s *dentry = &dentries[j];
4b543cf4700ea7 Alexander Larsson 2023-01-13  785  			size_t dentry_name_len = dentry->name_len;
4b543cf4700ea7 Alexander Larsson 2023-01-13  786  			char *dentry_name = (char *)namedata + dentry->name_offset;
4b543cf4700ea7 Alexander Larsson 2023-01-13  787  
4b543cf4700ea7 Alexander Larsson 2023-01-13  788  			/* name needs to fit in namedata */
4b543cf4700ea7 Alexander Larsson 2023-01-13  789  			if (dentry_name >= namedata_end ||
4b543cf4700ea7 Alexander Larsson 2023-01-13  790  			    namedata_end - dentry_name < dentry_name_len) {
4b543cf4700ea7 Alexander Larsson 2023-01-13  791  				res = -EFSCORRUPTED;
4b543cf4700ea7 Alexander Larsson 2023-01-13  792  				goto exit;
4b543cf4700ea7 Alexander Larsson 2023-01-13  793  			}
4b543cf4700ea7 Alexander Larsson 2023-01-13  794  
4b543cf4700ea7 Alexander Larsson 2023-01-13  795  			if (!cfs_validate_filename(dentry_name, dentry_name_len)) {
4b543cf4700ea7 Alexander Larsson 2023-01-13  796  				res = -EFSCORRUPTED;
4b543cf4700ea7 Alexander Larsson 2023-01-13  797  				goto exit;
4b543cf4700ea7 Alexander Larsson 2023-01-13  798  			}
4b543cf4700ea7 Alexander Larsson 2023-01-13  799  
4b543cf4700ea7 Alexander Larsson 2023-01-13  800  			if (pos++ < first)
4b543cf4700ea7 Alexander Larsson 2023-01-13  801  				continue;
4b543cf4700ea7 Alexander Larsson 2023-01-13  802  
4b543cf4700ea7 Alexander Larsson 2023-01-13  803  			if (!cb(private, dentry_name, dentry_name_len,
4b543cf4700ea7 Alexander Larsson 2023-01-13  804  				le64_to_cpu(dentry->inode_index), dentry->d_type)) {
4b543cf4700ea7 Alexander Larsson 2023-01-13  805  				res = 0;
4b543cf4700ea7 Alexander Larsson 2023-01-13  806  				goto exit;
4b543cf4700ea7 Alexander Larsson 2023-01-13  807  			}
4b543cf4700ea7 Alexander Larsson 2023-01-13  808  		}
4b543cf4700ea7 Alexander Larsson 2023-01-13  809  	}
4b543cf4700ea7 Alexander Larsson 2023-01-13  810  
4b543cf4700ea7 Alexander Larsson 2023-01-13  811  	res = 0;
4b543cf4700ea7 Alexander Larsson 2023-01-13  812  exit:
4b543cf4700ea7 Alexander Larsson 2023-01-13 @813  	kfree(chunks_buf);
4b543cf4700ea7 Alexander Larsson 2023-01-13  814  	cfs_buf_put(&vdata_buf);
4b543cf4700ea7 Alexander Larsson 2023-01-13  815  	return res;
4b543cf4700ea7 Alexander Larsson 2023-01-13  816  }
4b543cf4700ea7 Alexander Larsson 2023-01-13  817  
4b543cf4700ea7 Alexander Larsson 2023-01-13  818  #define BEFORE_CHUNK 1
4b543cf4700ea7 Alexander Larsson 2023-01-13  819  #define AFTER_CHUNK 2
4b543cf4700ea7 Alexander Larsson 2023-01-13  820  // -1 => error, 0 == hit, 1 == name is before chunk, 2 == name is after chunk
4b543cf4700ea7 Alexander Larsson 2023-01-13  821  static int cfs_dir_lookup_in_chunk(const char *name, size_t name_len,
4b543cf4700ea7 Alexander Larsson 2023-01-13  822  				   struct cfs_dentry_s *dentries,
4b543cf4700ea7 Alexander Larsson 2023-01-13  823  				   size_t n_dentries, char *namedata,
4b543cf4700ea7 Alexander Larsson 2023-01-13  824  				   char *namedata_end, u64 *index_out)
4b543cf4700ea7 Alexander Larsson 2023-01-13  825  {
4b543cf4700ea7 Alexander Larsson 2023-01-13  826  	int start_dentry, end_dentry;
4b543cf4700ea7 Alexander Larsson 2023-01-13  827  	int cmp;
4b543cf4700ea7 Alexander Larsson 2023-01-13  828  
4b543cf4700ea7 Alexander Larsson 2023-01-13  829  	// This should not happen in a valid fs, and if it does we don't know if
4b543cf4700ea7 Alexander Larsson 2023-01-13  830  	// the name is before or after the chunk.
4b543cf4700ea7 Alexander Larsson 2023-01-13  831  	if (n_dentries == 0)
4b543cf4700ea7 Alexander Larsson 2023-01-13  832  		return -EFSCORRUPTED;
4b543cf4700ea7 Alexander Larsson 2023-01-13  833  
4b543cf4700ea7 Alexander Larsson 2023-01-13  834  	start_dentry = 0;
4b543cf4700ea7 Alexander Larsson 2023-01-13  835  	end_dentry = n_dentries - 1;
4b543cf4700ea7 Alexander Larsson 2023-01-13  836  	while (start_dentry <= end_dentry) {
4b543cf4700ea7 Alexander Larsson 2023-01-13  837  		int mid_dentry = start_dentry + (end_dentry - start_dentry) / 2;
4b543cf4700ea7 Alexander Larsson 2023-01-13  838  		struct cfs_dentry_s *dentry = &dentries[mid_dentry];
4b543cf4700ea7 Alexander Larsson 2023-01-13  839  		char *dentry_name = (char *)namedata + dentry->name_offset;
4b543cf4700ea7 Alexander Larsson 2023-01-13  840  		size_t dentry_name_len = dentry->name_len;
4b543cf4700ea7 Alexander Larsson 2023-01-13  841  
4b543cf4700ea7 Alexander Larsson 2023-01-13  842  		/* name needs to fit in namedata */
4b543cf4700ea7 Alexander Larsson 2023-01-13  843  		if (dentry_name >= namedata_end ||
4b543cf4700ea7 Alexander Larsson 2023-01-13  844  		    namedata_end - dentry_name < dentry_name_len) {
4b543cf4700ea7 Alexander Larsson 2023-01-13  845  			return -EFSCORRUPTED;
4b543cf4700ea7 Alexander Larsson 2023-01-13  846  		}
4b543cf4700ea7 Alexander Larsson 2023-01-13  847  
4b543cf4700ea7 Alexander Larsson 2023-01-13  848  		cmp = memcmp2(name, name_len, dentry_name, dentry_name_len);
4b543cf4700ea7 Alexander Larsson 2023-01-13  849  		if (cmp == 0) {
4b543cf4700ea7 Alexander Larsson 2023-01-13  850  			*index_out = le64_to_cpu(dentry->inode_index);
4b543cf4700ea7 Alexander Larsson 2023-01-13  851  			return 0;
4b543cf4700ea7 Alexander Larsson 2023-01-13  852  		}
4b543cf4700ea7 Alexander Larsson 2023-01-13  853  
4b543cf4700ea7 Alexander Larsson 2023-01-13  854  		if (cmp > 0)
4b543cf4700ea7 Alexander Larsson 2023-01-13  855  			start_dentry = mid_dentry + 1;
4b543cf4700ea7 Alexander Larsson 2023-01-13  856  		else
4b543cf4700ea7 Alexander Larsson 2023-01-13  857  			end_dentry = mid_dentry - 1;
4b543cf4700ea7 Alexander Larsson 2023-01-13  858  	}
4b543cf4700ea7 Alexander Larsson 2023-01-13  859  
4b543cf4700ea7 Alexander Larsson 2023-01-13 @860  	return cmp > 0 ? AFTER_CHUNK : BEFORE_CHUNK;
4b543cf4700ea7 Alexander Larsson 2023-01-13  861  }
4b543cf4700ea7 Alexander Larsson 2023-01-13  862  
4b543cf4700ea7 Alexander Larsson 2023-01-13  863  int cfs_dir_lookup(struct cfs_context_s *ctx, u64 index,
4b543cf4700ea7 Alexander Larsson 2023-01-13  864  		   struct cfs_inode_data_s *inode_data, const char *name,
4b543cf4700ea7 Alexander Larsson 2023-01-13  865  		   size_t name_len, u64 *index_out)
4b543cf4700ea7 Alexander Larsson 2023-01-13  866  {
4b543cf4700ea7 Alexander Larsson 2023-01-13  867  	int n_chunks, start_chunk, end_chunk;
4b543cf4700ea7 Alexander Larsson 2023-01-13  868  	struct cfs_buf vdata_buf = { NULL };
4b543cf4700ea7 Alexander Larsson 2023-01-13  869  	char *namedata, *namedata_end;
4b543cf4700ea7 Alexander Larsson 2023-01-13  870  	struct cfs_dir_chunk_s *chunks;
4b543cf4700ea7 Alexander Larsson 2023-01-13  871  	struct cfs_dentry_s *dentries;
4b543cf4700ea7 Alexander Larsson 2023-01-13  872  	void *chunks_buf;
4b543cf4700ea7 Alexander Larsson 2023-01-13  873  	int res, r;
4b543cf4700ea7 Alexander Larsson 2023-01-13  874  
4b543cf4700ea7 Alexander Larsson 2023-01-13  875  	n_chunks = inode_data->n_dir_chunks;
4b543cf4700ea7 Alexander Larsson 2023-01-13  876  	if (n_chunks == 0)
4b543cf4700ea7 Alexander Larsson 2023-01-13  877  		return 0;
4b543cf4700ea7 Alexander Larsson 2023-01-13  878  
4b543cf4700ea7 Alexander Larsson 2023-01-13  879  	chunks = cfs_dir_get_chunk_info(ctx, index, inode_data, &chunks_buf);
4b543cf4700ea7 Alexander Larsson 2023-01-13  880  	if (IS_ERR(chunks))
4b543cf4700ea7 Alexander Larsson 2023-01-13  881  		return PTR_ERR(chunks);
4b543cf4700ea7 Alexander Larsson 2023-01-13  882  
4b543cf4700ea7 Alexander Larsson 2023-01-13  883  	start_chunk = 0;
4b543cf4700ea7 Alexander Larsson 2023-01-13  884  	end_chunk = n_chunks - 1;
4b543cf4700ea7 Alexander Larsson 2023-01-13  885  
4b543cf4700ea7 Alexander Larsson 2023-01-13  886  	while (start_chunk <= end_chunk) {
4b543cf4700ea7 Alexander Larsson 2023-01-13  887  		int mid_chunk = start_chunk + (end_chunk - start_chunk) / 2;
4b543cf4700ea7 Alexander Larsson 2023-01-13  888  
4b543cf4700ea7 Alexander Larsson 2023-01-13  889  		/* Chunks info are verified/converted in cfs_dir_read_chunk_header */
4b543cf4700ea7 Alexander Larsson 2023-01-13  890  		u64 chunk_offset = chunks[mid_chunk].chunk_offset;
4b543cf4700ea7 Alexander Larsson 2023-01-13  891  		size_t chunk_size = chunks[mid_chunk].chunk_size;
4b543cf4700ea7 Alexander Larsson 2023-01-13  892  		size_t n_dentries = chunks[mid_chunk].n_dentries;
4b543cf4700ea7 Alexander Larsson 2023-01-13  893  
4b543cf4700ea7 Alexander Larsson 2023-01-13  894  		/* Read chunk dentries from page cache */
4b543cf4700ea7 Alexander Larsson 2023-01-13  895  		dentries = cfs_get_vdata_buf(ctx, chunk_offset, chunk_size,
4b543cf4700ea7 Alexander Larsson 2023-01-13  896  					     &vdata_buf);
4b543cf4700ea7 Alexander Larsson 2023-01-13  897  		if (IS_ERR(dentries)) {
4b543cf4700ea7 Alexander Larsson 2023-01-13  898  			res = PTR_ERR(dentries);
4b543cf4700ea7 Alexander Larsson 2023-01-13  899  			goto exit;
4b543cf4700ea7 Alexander Larsson 2023-01-13  900  		}
4b543cf4700ea7 Alexander Larsson 2023-01-13  901  
4b543cf4700ea7 Alexander Larsson 2023-01-13  902  		namedata = ((u8 *)dentries) + sizeof(struct cfs_dentry_s) * n_dentries;
4b543cf4700ea7 Alexander Larsson 2023-01-13  903  		namedata_end = ((u8 *)dentries) + chunk_size;
4b543cf4700ea7 Alexander Larsson 2023-01-13  904  
4b543cf4700ea7 Alexander Larsson 2023-01-13  905  		r = cfs_dir_lookup_in_chunk(name, name_len, dentries, n_dentries,
4b543cf4700ea7 Alexander Larsson 2023-01-13  906  					    namedata, namedata_end, index_out);
4b543cf4700ea7 Alexander Larsson 2023-01-13  907  		if (r < 0) {
4b543cf4700ea7 Alexander Larsson 2023-01-13  908  			res = r; /* error */
4b543cf4700ea7 Alexander Larsson 2023-01-13  909  			goto exit;
4b543cf4700ea7 Alexander Larsson 2023-01-13  910  		} else if (r == 0) {
4b543cf4700ea7 Alexander Larsson 2023-01-13  911  			res = 1; /* found it */
4b543cf4700ea7 Alexander Larsson 2023-01-13  912  			goto exit;
4b543cf4700ea7 Alexander Larsson 2023-01-13  913  		} else if (r == AFTER_CHUNK) {
4b543cf4700ea7 Alexander Larsson 2023-01-13  914  			start_chunk = mid_chunk + 1;
4b543cf4700ea7 Alexander Larsson 2023-01-13  915  		} else { /* before */
4b543cf4700ea7 Alexander Larsson 2023-01-13  916  			end_chunk = mid_chunk - 1;
4b543cf4700ea7 Alexander Larsson 2023-01-13  917  		}
4b543cf4700ea7 Alexander Larsson 2023-01-13  918  	}
4b543cf4700ea7 Alexander Larsson 2023-01-13  919  
4b543cf4700ea7 Alexander Larsson 2023-01-13  920  	/* not found */
4b543cf4700ea7 Alexander Larsson 2023-01-13  921  	res = 0;
4b543cf4700ea7 Alexander Larsson 2023-01-13  922  
4b543cf4700ea7 Alexander Larsson 2023-01-13  923  exit:
4b543cf4700ea7 Alexander Larsson 2023-01-13 @924  	kfree(chunks_buf);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

--ZHxnAHRbnShX6hmY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=config

#
# Automatically generated file; DO NOT EDIT.
# Linux/m68k 6.2.0-rc2 Kernel Configuration
#
CONFIG_CC_VERSION_TEXT="m68k-linux-gcc (GCC) 12.1.0"
CONFIG_CC_IS_GCC=y
CONFIG_GCC_VERSION=120100
CONFIG_CLANG_VERSION=0
CONFIG_AS_IS_GNU=y
CONFIG_AS_VERSION=23800
CONFIG_LD_IS_BFD=y
CONFIG_LD_VERSION=23800
CONFIG_LLD_VERSION=0
CONFIG_CC_HAS_ASM_INLINE=y
CONFIG_CC_HAS_NO_PROFILE_FN_ATTR=y
CONFIG_PAHOLE_VERSION=123
CONFIG_IRQ_WORK=y

#
# General setup
#
CONFIG_BROKEN_ON_SMP=y
CONFIG_INIT_ENV_ARG_LIMIT=32
CONFIG_COMPILE_TEST=y
# CONFIG_WERROR is not set
CONFIG_LOCALVERSION=""
CONFIG_BUILD_SALT=""
CONFIG_DEFAULT_INIT=""
CONFIG_DEFAULT_HOSTNAME="(none)"
# CONFIG_SYSVIPC is not set
CONFIG_WATCH_QUEUE=y
CONFIG_USELIB=y

#
# IRQ subsystem
#
CONFIG_GENERIC_IRQ_SHOW=y
CONFIG_GENERIC_IRQ_CHIP=y
CONFIG_IRQ_DOMAIN=y
CONFIG_IRQ_SIM=y
CONFIG_IRQ_DOMAIN_HIERARCHY=y
CONFIG_IRQ_FASTEOI_HIERARCHY_HANDLERS=y
# CONFIG_GENERIC_IRQ_DEBUGFS is not set
# end of IRQ subsystem

CONFIG_LEGACY_TIMER_TICK=y
CONFIG_TIME_KUNIT_TEST=y

#
# BPF subsystem
#
# CONFIG_BPF_SYSCALL is not set
# end of BPF subsystem

CONFIG_PREEMPT_NONE_BUILD=y
CONFIG_PREEMPT_NONE=y

#
# CPU/Task time and stats accounting
#
CONFIG_TICK_CPU_ACCOUNTING=y
CONFIG_PSI=y
CONFIG_PSI_DEFAULT_DISABLED=y
# end of CPU/Task time and stats accounting

# CONFIG_CPU_ISOLATION is not set

#
# RCU Subsystem
#
CONFIG_TINY_RCU=y
CONFIG_RCU_EXPERT=y
CONFIG_SRCU=y
CONFIG_TINY_SRCU=y
CONFIG_TASKS_RCU_GENERIC=y
# CONFIG_FORCE_TASKS_RCU is not set
CONFIG_FORCE_TASKS_RUDE_RCU=y
CONFIG_TASKS_RUDE_RCU=y
# CONFIG_FORCE_TASKS_TRACE_RCU is not set
CONFIG_RCU_NEED_SEGCBLIST=y
# end of RCU Subsystem

CONFIG_IKCONFIG=y
CONFIG_IKCONFIG_PROC=y
CONFIG_IKHEADERS=m
CONFIG_LOG_BUF_SHIFT=17
CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=13
CONFIG_PRINTK_INDEX=y

#
# Scheduler features
#
# end of Scheduler features

CONFIG_CC_IMPLICIT_FALLTHROUGH="-Wimplicit-fallthrough=5"
CONFIG_GCC12_NO_ARRAY_BOUNDS=y
CONFIG_CC_NO_ARRAY_BOUNDS=y
# CONFIG_CGROUPS is not set
# CONFIG_CHECKPOINT_RESTORE is not set
# CONFIG_SCHED_AUTOGROUP is not set
# CONFIG_SYSFS_DEPRECATED is not set
# CONFIG_RELAY is not set
CONFIG_BLK_DEV_INITRD=y
CONFIG_INITRAMFS_SOURCE=""
# CONFIG_RD_GZIP is not set
CONFIG_RD_BZIP2=y
CONFIG_RD_LZMA=y
CONFIG_RD_XZ=y
CONFIG_RD_LZO=y
# CONFIG_RD_LZ4 is not set
CONFIG_RD_ZSTD=y
CONFIG_BOOT_CONFIG=y
# CONFIG_BOOT_CONFIG_EMBED is not set
CONFIG_INITRAMFS_PRESERVE_MTIME=y
CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=y
# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
CONFIG_SYSCTL=y
CONFIG_HAVE_UID16=y
CONFIG_EXPERT=y
# CONFIG_MULTIUSER is not set
# CONFIG_SGETMASK_SYSCALL is not set
CONFIG_SYSFS_SYSCALL=y
# CONFIG_FHANDLE is not set
# CONFIG_POSIX_TIMERS is not set
CONFIG_PRINTK=y
# CONFIG_BUG is not set
CONFIG_BASE_FULL=y
CONFIG_FUTEX=y
CONFIG_FUTEX_PI=y
CONFIG_EPOLL=y
# CONFIG_SIGNALFD is not set
CONFIG_TIMERFD=y
CONFIG_EVENTFD=y
CONFIG_AIO=y
CONFIG_IO_URING=y
CONFIG_ADVISE_SYSCALLS=y
CONFIG_MEMBARRIER=y
CONFIG_KALLSYMS=y
# CONFIG_KALLSYMS_SELFTEST is not set
# CONFIG_KALLSYMS_ALL is not set
CONFIG_KALLSYMS_BASE_RELATIVE=y
CONFIG_KCMP=y
CONFIG_EMBEDDED=y
CONFIG_PC104=y

#
# Kernel Performance Events And Counters
#
# end of Kernel Performance Events And Counters

CONFIG_SYSTEM_DATA_VERIFICATION=y
CONFIG_PROFILING=y
# end of General setup

CONFIG_M68K=y
CONFIG_CPU_BIG_ENDIAN=y
CONFIG_GENERIC_HWEIGHT=y
CONFIG_GENERIC_CALIBRATE_DELAY=y
CONFIG_GENERIC_CSUM=y
CONFIG_TIME_LOW_RES=y
CONFIG_NO_IOPORT_MAP=y
CONFIG_HZ=100
CONFIG_PGTABLE_LEVELS=3
# CONFIG_MMU is not set

#
# Platform setup
#

#
# Processor Type
#
CONFIG_M68KCLASSIC=y
# CONFIG_COLDFIRE is not set
CONFIG_M68000=y
CONFIG_M68EZ328=y

#
# Processor Specific Options
#
CONFIG_ARCH_FORCE_MAX_ORDER=11
CONFIG_CPU_HAS_NO_BITFIELDS=y
CONFIG_CPU_HAS_NO_CAS=y
CONFIG_CPU_HAS_NO_MULDIV64=y
CONFIG_CPU_HAS_NO_UNALIGNED=y

#
# Machine Types
#
# CONFIG_PILOT3 is not set
CONFIG_UCSIMM=y
# CONFIG_UCDIMM is not set
# CONFIG_DRAGEN2 is not set
CONFIG_DIRECT_IO_ACCESS=y
# CONFIG_INIT_LCD is not set
CONFIG_MEMORY_RESERVE=0

#
# Machine Options
#
# CONFIG_4KSTACKS is not set

#
# RAM configuration
#
CONFIG_RAMBASE=0
CONFIG_RAMSIZE=0x400000
CONFIG_VECTORBASE=0
CONFIG_KERNELBASE=0x400

#
# ROM configuration
#
CONFIG_ROM=y
CONFIG_ROMBASE=0
CONFIG_ROMVEC=0
CONFIG_ROMSTART=0x400
CONFIG_ROMSIZE=0x100000
# CONFIG_RAMKERNEL is not set
CONFIG_ROMKERNEL=y
# end of Platform setup

#
# Kernel Features
#
# end of Kernel Features

#
# Power management options
#
# CONFIG_PM is not set
# end of Power management options

#
# General architecture-dependent options
#
CONFIG_ARCH_32BIT_OFF_T=y
CONFIG_HAVE_ASM_MODVERSIONS=y
CONFIG_ARCH_WANT_IPC_PARSE_VERSION=y
CONFIG_LTO_NONE=y
CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
CONFIG_MODULES_USE_ELF_RELA=y
CONFIG_MODULES_USE_ELF_REL=y
CONFIG_PAGE_SIZE_LESS_THAN_64KB=y
CONFIG_PAGE_SIZE_LESS_THAN_256KB=y
CONFIG_HAVE_ARCH_HASH=y
CONFIG_ISA_BUS_API=y
CONFIG_OLD_SIGSUSPEND3=y
CONFIG_OLD_SIGACTION=y
CONFIG_COMPAT_32BIT_TIME=y
CONFIG_ARCH_NO_PREEMPT=y
CONFIG_CPU_NO_EFFICIENT_FFS=y
# CONFIG_LOCK_EVENT_COUNTS is not set
CONFIG_HAVE_ARCH_PFN_VALID=y

#
# GCOV-based kernel profiling
#
# CONFIG_GCOV_KERNEL is not set
# end of GCOV-based kernel profiling

CONFIG_FUNCTION_ALIGNMENT=0
# end of General architecture-dependent options

CONFIG_RT_MUTEXES=y
CONFIG_BASE_SMALL=0
CONFIG_MODULE_SIG_FORMAT=y
CONFIG_MODULES=y
# CONFIG_MODULE_FORCE_LOAD is not set
# CONFIG_MODULE_UNLOAD is not set
# CONFIG_MODVERSIONS is not set
CONFIG_MODULE_SRCVERSION_ALL=y
CONFIG_MODULE_SIG=y
CONFIG_MODULE_SIG_FORCE=y
CONFIG_MODULE_SIG_ALL=y
# CONFIG_MODULE_SIG_SHA1 is not set
# CONFIG_MODULE_SIG_SHA224 is not set
CONFIG_MODULE_SIG_SHA256=y
# CONFIG_MODULE_SIG_SHA384 is not set
# CONFIG_MODULE_SIG_SHA512 is not set
CONFIG_MODULE_SIG_HASH="sha256"
# CONFIG_MODULE_COMPRESS_NONE is not set
CONFIG_MODULE_COMPRESS_GZIP=y
# CONFIG_MODULE_COMPRESS_XZ is not set
# CONFIG_MODULE_COMPRESS_ZSTD is not set
# CONFIG_MODULE_DECOMPRESS is not set
# CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS is not set
CONFIG_MODPROBE_PATH="/sbin/modprobe"
CONFIG_BLOCK=y
# CONFIG_BLOCK_LEGACY_AUTOLOAD is not set
CONFIG_BLK_ICQ=y
# CONFIG_BLK_DEV_BSGLIB is not set
CONFIG_BLK_DEV_INTEGRITY=y
CONFIG_BLK_DEV_ZONED=y
CONFIG_BLK_WBT=y
CONFIG_BLK_WBT_MQ=y
CONFIG_BLK_DEBUG_FS=y
CONFIG_BLK_DEBUG_FS_ZONED=y
CONFIG_BLK_SED_OPAL=y
CONFIG_BLK_INLINE_ENCRYPTION=y
# CONFIG_BLK_INLINE_ENCRYPTION_FALLBACK is not set

#
# Partition Types
#
# CONFIG_PARTITION_ADVANCED is not set
CONFIG_MSDOS_PARTITION=y
CONFIG_EFI_PARTITION=y
# end of Partition Types

CONFIG_BLK_MQ_VIRTIO=y

#
# IO Schedulers
#
CONFIG_MQ_IOSCHED_DEADLINE=y
# CONFIG_MQ_IOSCHED_KYBER is not set
CONFIG_IOSCHED_BFQ=m
# end of IO Schedulers

CONFIG_ASN1=y
CONFIG_INLINE_SPIN_UNLOCK_IRQ=y
CONFIG_INLINE_READ_UNLOCK=y
CONFIG_INLINE_READ_UNLOCK_IRQ=y
CONFIG_INLINE_WRITE_UNLOCK=y
CONFIG_INLINE_WRITE_UNLOCK_IRQ=y

#
# Executable file formats
#
CONFIG_BINFMT_ELF_FDPIC=y
CONFIG_ELFCORE=y
CONFIG_BINFMT_SCRIPT=m
CONFIG_ARCH_HAS_BINFMT_FLAT=y
CONFIG_BINFMT_FLAT=y
CONFIG_BINFMT_FLAT_ARGVP_ENVP_ON_STACK=y
CONFIG_BINFMT_FLAT_OLD=y
CONFIG_BINFMT_ZFLAT=y
CONFIG_BINFMT_MISC=y
# CONFIG_COREDUMP is not set
# end of Executable file formats

#
# Memory Management options
#

#
# SLAB allocator options
#
# CONFIG_SLAB is not set
# CONFIG_SLUB is not set
CONFIG_SLOB_DEPRECATED=y
CONFIG_SLOB=y
# end of SLAB allocator options

# CONFIG_SHUFFLE_PAGE_ALLOCATOR is not set
CONFIG_COMPAT_BRK=y
CONFIG_MMAP_ALLOW_UNINITIALIZED=y
CONFIG_FLATMEM=y
CONFIG_EXCLUSIVE_SYSTEM_RAM=y
CONFIG_SPLIT_PTLOCK_CPUS=999999
# CONFIG_PAGE_REPORTING is not set
CONFIG_NOMMU_INITIAL_TRIM_EXCESS=1
CONFIG_NEED_PER_CPU_KM=y
CONFIG_ARCH_HAS_CURRENT_STACK_POINTER=y
CONFIG_ZONE_DMA=y
CONFIG_VM_EVENT_COUNTERS=y
# CONFIG_PERCPU_STATS is not set
# CONFIG_GUP_TEST is not set

#
# Data Access Monitoring
#
# CONFIG_DAMON is not set
# end of Data Access Monitoring
# end of Memory Management options

# CONFIG_NET is not set

#
# Device Drivers
#
CONFIG_PCCARD=m
CONFIG_PCMCIA=m
CONFIG_PCMCIA_LOAD_CIS=y

#
# PC-card bridges
#

#
# Generic Driver Options
#
CONFIG_AUXILIARY_BUS=y
# CONFIG_UEVENT_HELPER is not set
# CONFIG_DEVTMPFS is not set
CONFIG_STANDALONE=y
# CONFIG_PREVENT_FIRMWARE_BUILD is not set

#
# Firmware loader
#
CONFIG_FW_LOADER=y
CONFIG_FW_LOADER_PAGED_BUF=y
CONFIG_FW_LOADER_SYSFS=y
CONFIG_EXTRA_FIRMWARE=""
CONFIG_FW_LOADER_USER_HELPER=y
CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y
CONFIG_FW_LOADER_COMPRESS=y
# CONFIG_FW_LOADER_COMPRESS_XZ is not set
CONFIG_FW_LOADER_COMPRESS_ZSTD=y
CONFIG_FW_UPLOAD=y
# end of Firmware loader

# CONFIG_ALLOW_DEV_COREDUMP is not set
# CONFIG_DEBUG_DRIVER is not set
CONFIG_DEBUG_DEVRES=y
CONFIG_DEBUG_TEST_DRIVER_REMOVE=y
CONFIG_PM_QOS_KUNIT_TEST=y
CONFIG_TEST_ASYNC_DRIVER_PROBE=m
CONFIG_DRIVER_PE_KUNIT_TEST=y
CONFIG_GENERIC_CPU_DEVICES=y
CONFIG_SOC_BUS=y
CONFIG_REGMAP=y
CONFIG_REGMAP_I2C=m
CONFIG_REGMAP_SPMI=m
CONFIG_REGMAP_MMIO=y
CONFIG_REGMAP_IRQ=y
CONFIG_REGMAP_SCCB=m
CONFIG_DMA_SHARED_BUFFER=y
CONFIG_DMA_FENCE_TRACE=y
# end of Generic Driver Options

#
# Bus devices
#
CONFIG_ARM_INTEGRATOR_LM=y
CONFIG_BT1_APB=y
CONFIG_BT1_AXI=y
# CONFIG_HISILICON_LPC is not set
# CONFIG_INTEL_IXP4XX_EB is not set
# CONFIG_QCOM_EBI2 is not set
CONFIG_MHI_BUS=m
# CONFIG_MHI_BUS_DEBUG is not set
CONFIG_MHI_BUS_EP=y
# end of Bus devices

#
# Firmware Drivers
#

#
# ARM System Control and Management Interface Protocol
#
# CONFIG_ARM_SCMI_PROTOCOL is not set
CONFIG_ARM_SCMI_POWER_DOMAIN=m
# CONFIG_ARM_SCMI_POWER_CONTROL is not set
# end of ARM System Control and Management Interface Protocol

CONFIG_ARM_SCPI_POWER_DOMAIN=m
CONFIG_FIRMWARE_MEMMAP=y
CONFIG_QCOM_SCM=y
# CONFIG_QCOM_SCM_DOWNLOAD_MODE_DEFAULT is not set
CONFIG_BCM47XX_NVRAM=y
# CONFIG_BCM47XX_SPROM is not set
CONFIG_TEE_BNXT_FW=m
CONFIG_GOOGLE_FIRMWARE=y
# CONFIG_GOOGLE_COREBOOT_TABLE is not set

#
# Tegra firmware driver
#
# end of Tegra firmware driver
# end of Firmware Drivers

# CONFIG_GNSS is not set
CONFIG_MTD=m
CONFIG_MTD_TESTS=m

#
# Partition parsers
#
CONFIG_MTD_AR7_PARTS=m
# CONFIG_MTD_BCM63XX_PARTS is not set
# CONFIG_MTD_BRCM_U_BOOT is not set
# CONFIG_MTD_CMDLINE_PARTS is not set
CONFIG_MTD_OF_PARTS=m
CONFIG_MTD_OF_PARTS_BCM4908=y
CONFIG_MTD_OF_PARTS_LINKSYS_NS=y
# CONFIG_MTD_PARSER_IMAGETAG is not set
CONFIG_MTD_PARSER_TPLINK_SAFELOADER=m
CONFIG_MTD_PARSER_TRX=m
# CONFIG_MTD_SHARPSL_PARTS is not set
CONFIG_MTD_REDBOOT_PARTS=m
CONFIG_MTD_REDBOOT_DIRECTORY_BLOCK=-1
CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED=y
# CONFIG_MTD_REDBOOT_PARTS_READONLY is not set
# end of Partition parsers

#
# User Modules And Translation Layers
#
CONFIG_MTD_BLKDEVS=m
# CONFIG_MTD_BLOCK is not set
CONFIG_MTD_BLOCK_RO=m

#
# Note that in some cases UBI block is preferred. See MTD_UBI_BLOCK.
#
CONFIG_FTL=m
CONFIG_NFTL=m
# CONFIG_NFTL_RW is not set
CONFIG_INFTL=m
# CONFIG_RFD_FTL is not set
# CONFIG_SSFDC is not set
CONFIG_SM_FTL=m
CONFIG_MTD_OOPS=m
CONFIG_MTD_PARTITIONED_MASTER=y

#
# RAM/ROM/Flash chip drivers
#
CONFIG_MTD_CFI=m
CONFIG_MTD_JEDECPROBE=m
CONFIG_MTD_GEN_PROBE=m
CONFIG_MTD_CFI_ADV_OPTIONS=y
# CONFIG_MTD_CFI_NOSWAP is not set
# CONFIG_MTD_CFI_BE_BYTE_SWAP is not set
CONFIG_MTD_CFI_LE_BYTE_SWAP=y
CONFIG_MTD_CFI_GEOMETRY=y
CONFIG_MTD_MAP_BANK_WIDTH_1=y
CONFIG_MTD_MAP_BANK_WIDTH_2=y
# CONFIG_MTD_MAP_BANK_WIDTH_4 is not set
CONFIG_MTD_MAP_BANK_WIDTH_8=y
CONFIG_MTD_MAP_BANK_WIDTH_16=y
CONFIG_MTD_MAP_BANK_WIDTH_32=y
CONFIG_MTD_CFI_I1=y
CONFIG_MTD_CFI_I2=y
# CONFIG_MTD_CFI_I4 is not set
# CONFIG_MTD_CFI_I8 is not set
# CONFIG_MTD_OTP is not set
CONFIG_MTD_CFI_INTELEXT=m
CONFIG_MTD_CFI_AMDSTD=m
CONFIG_MTD_CFI_STAA=m
CONFIG_MTD_CFI_UTIL=m
CONFIG_MTD_RAM=m
CONFIG_MTD_ROM=m
CONFIG_MTD_ABSENT=m
# end of RAM/ROM/Flash chip drivers

#
# Mapping drivers for chip access
#
CONFIG_MTD_COMPLEX_MAPPINGS=y
# CONFIG_MTD_PHYSMAP is not set
CONFIG_MTD_SC520CDP=m
CONFIG_MTD_NETSC520=m
CONFIG_MTD_TS5500=m
# CONFIG_MTD_PCMCIA is not set
CONFIG_MTD_PLATRAM=m
# end of Mapping drivers for chip access

#
# Self-contained MTD device drivers
#
# CONFIG_MTD_SPEAR_SMI is not set
CONFIG_MTD_SLRAM=m
CONFIG_MTD_PHRAM=m
CONFIG_MTD_MTDRAM=m
CONFIG_MTDRAM_TOTAL_SIZE=4096
CONFIG_MTDRAM_ERASE_SIZE=128
CONFIG_MTD_BLOCK2MTD=m

#
# Disk-On-Chip Device Drivers
#
CONFIG_MTD_DOCG3=m
CONFIG_BCH_CONST_M=14
CONFIG_BCH_CONST_T=4
# end of Self-contained MTD device drivers

#
# NAND
#
CONFIG_MTD_NAND_CORE=m
# CONFIG_MTD_ONENAND is not set
CONFIG_MTD_RAW_NAND=m

#
# Raw/parallel NAND flash controllers
#
# CONFIG_MTD_NAND_AMS_DELTA is not set
# CONFIG_MTD_NAND_OMAP2 is not set
# CONFIG_MTD_NAND_SHARPSL is not set
CONFIG_MTD_NAND_ATMEL=m
CONFIG_MTD_NAND_MARVELL=m
CONFIG_MTD_NAND_SLC_LPC32XX=m
CONFIG_MTD_NAND_MLC_LPC32XX=m
# CONFIG_MTD_NAND_BRCMNAND is not set
CONFIG_MTD_NAND_OXNAS=m
# CONFIG_MTD_NAND_FSL_IFC is not set
# CONFIG_MTD_NAND_VF610_NFC is not set
# CONFIG_MTD_NAND_MXC is not set
# CONFIG_MTD_NAND_SH_FLCTL is not set
# CONFIG_MTD_NAND_DAVINCI is not set
CONFIG_MTD_NAND_TXX9NDFMC=m
CONFIG_MTD_NAND_JZ4780=m
CONFIG_MTD_NAND_INGENIC_ECC=y
CONFIG_MTD_NAND_JZ4740_ECC=m
# CONFIG_MTD_NAND_JZ4725B_BCH is not set
# CONFIG_MTD_NAND_JZ4780_BCH is not set
CONFIG_MTD_NAND_FSMC=m
CONFIG_MTD_NAND_SUNXI=m
CONFIG_MTD_NAND_HISI504=m
CONFIG_MTD_NAND_QCOM=m
CONFIG_MTD_NAND_MTK=m
# CONFIG_MTD_NAND_MXIC is not set
CONFIG_MTD_NAND_TEGRA=m
# CONFIG_MTD_NAND_STM32_FMC2 is not set
CONFIG_MTD_NAND_GPIO=m
CONFIG_MTD_NAND_PLATFORM=m
# CONFIG_MTD_NAND_CADENCE is not set
# CONFIG_MTD_NAND_INTEL_LGM is not set
CONFIG_MTD_NAND_RENESAS=m

#
# Misc
#
CONFIG_MTD_NAND_NANDSIM=m
# CONFIG_MTD_NAND_DISKONCHIP is not set

#
# ECC engine support
#
CONFIG_MTD_NAND_ECC=y
CONFIG_MTD_NAND_ECC_SW_HAMMING=y
CONFIG_MTD_NAND_ECC_SW_HAMMING_SMC=y
# CONFIG_MTD_NAND_ECC_SW_BCH is not set
CONFIG_MTD_NAND_ECC_MXIC=y
CONFIG_MTD_NAND_ECC_MEDIATEK=m
# end of ECC engine support
# end of NAND

#
# LPDDR & LPDDR2 PCM memory drivers
#
CONFIG_MTD_LPDDR=m
CONFIG_MTD_QINFO_PROBE=m
# end of LPDDR & LPDDR2 PCM memory drivers

# CONFIG_MTD_UBI is not set
CONFIG_MTD_HYPERBUS=m
CONFIG_HBMC_AM654=m
CONFIG_DTC=y
CONFIG_OF=y
# CONFIG_OF_UNITTEST is not set
# CONFIG_OF_ALL_DTBS is not set
CONFIG_OF_FLATTREE=y
CONFIG_OF_KOBJ=y
CONFIG_OF_DYNAMIC=y
CONFIG_OF_ADDRESS=y
CONFIG_OF_IRQ=y
CONFIG_OF_RESOLVE=y
CONFIG_OF_OVERLAY=y
CONFIG_PARPORT=y
# CONFIG_PARPORT_AX88796 is not set
CONFIG_PARPORT_1284=y
CONFIG_PARPORT_NOT_PC=y
CONFIG_BLK_DEV=y
CONFIG_BLK_DEV_NULL_BLK=m
# CONFIG_BLK_DEV_NULL_BLK_FAULT_INJECTION is not set
CONFIG_BLK_DEV_LOOP=y
CONFIG_BLK_DEV_LOOP_MIN_COUNT=8

#
# DRBD disabled because PROC_FS or INET not selected
#
CONFIG_BLK_DEV_RAM=m
CONFIG_BLK_DEV_RAM_COUNT=16
CONFIG_BLK_DEV_RAM_SIZE=4096
CONFIG_VIRTIO_BLK=y
CONFIG_BLK_DEV_UBLK=m

#
# NVME Support
#
# CONFIG_NVME_TARGET is not set
# end of NVME Support

#
# Misc devices
#
CONFIG_SENSORS_LIS3LV02D=m
CONFIG_AD525X_DPOT=m
# CONFIG_AD525X_DPOT_I2C is not set
# CONFIG_DUMMY_IRQ is not set
CONFIG_ICS932S401=m
CONFIG_ATMEL_SSC=m
# CONFIG_ENCLOSURE_SERVICES is not set
CONFIG_SMPRO_ERRMON=m
CONFIG_SMPRO_MISC=y
# CONFIG_HI6421V600_IRQ is not set
# CONFIG_QCOM_COINCELL is not set
CONFIG_APDS9802ALS=m
CONFIG_ISL29003=m
CONFIG_ISL29020=m
# CONFIG_SENSORS_TSL2550 is not set
# CONFIG_SENSORS_BH1770 is not set
# CONFIG_SENSORS_APDS990X is not set
# CONFIG_HMC6352 is not set
CONFIG_DS1682=m
# CONFIG_SRAM is not set
CONFIG_XILINX_SDFEC=m
CONFIG_HISI_HIKEY_USB=m
CONFIG_VCPU_STALL_DETECTOR=y
CONFIG_C2PORT=y

#
# EEPROM support
#
# CONFIG_EEPROM_AT24 is not set
CONFIG_EEPROM_LEGACY=m
CONFIG_EEPROM_MAX6875=m
CONFIG_EEPROM_93CX6=m
CONFIG_EEPROM_IDT_89HPESX=m
CONFIG_EEPROM_EE1004=m
# end of EEPROM support

#
# Texas Instruments shared transport line discipline
#
# end of Texas Instruments shared transport line discipline

CONFIG_SENSORS_LIS3_I2C=m

#
# Altera FPGA firmware download module (requires I2C)
#
CONFIG_ALTERA_STAPL=m
# CONFIG_ECHO is not set
# CONFIG_MISC_RTSX_USB is not set
CONFIG_UACCE=m
CONFIG_PVPANIC=y
CONFIG_PVPANIC_MMIO=m
# end of Misc devices

#
# SCSI device support
#
CONFIG_SCSI_MOD=y
# CONFIG_RAID_ATTRS is not set
CONFIG_SCSI_COMMON=y
# CONFIG_SCSI is not set
# end of SCSI device support

# CONFIG_ATA is not set
# CONFIG_MD is not set
CONFIG_TARGET_CORE=y
CONFIG_TCM_IBLOCK=y
CONFIG_TCM_FILEIO=y
CONFIG_SBP_TARGET=y

#
# IEEE 1394 (FireWire) support
#
CONFIG_FIREWIRE=y
# end of IEEE 1394 (FireWire) support

#
# Input device support
#
CONFIG_INPUT=y
CONFIG_INPUT_LEDS=m
CONFIG_INPUT_FF_MEMLESS=y
# CONFIG_INPUT_SPARSEKMAP is not set
CONFIG_INPUT_MATRIXKMAP=y

#
# Userland interfaces
#
CONFIG_INPUT_MOUSEDEV=y
# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
CONFIG_INPUT_JOYDEV=m
# CONFIG_INPUT_EVDEV is not set
CONFIG_INPUT_EVBUG=m

#
# Input Device Drivers
#
CONFIG_INPUT_KEYBOARD=y
CONFIG_KEYBOARD_ADC=m
# CONFIG_KEYBOARD_ADP5588 is not set
# CONFIG_KEYBOARD_ADP5589 is not set
# CONFIG_KEYBOARD_ATKBD is not set
CONFIG_KEYBOARD_QT1050=m
# CONFIG_KEYBOARD_QT1070 is not set
# CONFIG_KEYBOARD_QT2160 is not set
CONFIG_KEYBOARD_CLPS711X=y
CONFIG_KEYBOARD_DLINK_DIR685=m
CONFIG_KEYBOARD_LKKBD=y
# CONFIG_KEYBOARD_EP93XX is not set
# CONFIG_KEYBOARD_GPIO is not set
CONFIG_KEYBOARD_GPIO_POLLED=y
CONFIG_KEYBOARD_TCA6416=m
CONFIG_KEYBOARD_TCA8418=m
# CONFIG_KEYBOARD_MATRIX is not set
CONFIG_KEYBOARD_LM8323=m
CONFIG_KEYBOARD_LM8333=m
CONFIG_KEYBOARD_LPC32XX=y
# CONFIG_KEYBOARD_MAX7359 is not set
CONFIG_KEYBOARD_MCS=m
CONFIG_KEYBOARD_MPR121=m
# CONFIG_KEYBOARD_SNVS_PWRKEY is not set
CONFIG_KEYBOARD_IMX=m
# CONFIG_KEYBOARD_NEWTON is not set
# CONFIG_KEYBOARD_NOMADIK is not set
CONFIG_KEYBOARD_TEGRA=m
CONFIG_KEYBOARD_OPENCORES=y
CONFIG_KEYBOARD_PINEPHONE=m
CONFIG_KEYBOARD_PXA27x=y
CONFIG_KEYBOARD_GOLDFISH_EVENTS=m
# CONFIG_KEYBOARD_STOWAWAY is not set
# CONFIG_KEYBOARD_ST_KEYSCAN is not set
CONFIG_KEYBOARD_SUNKBD=m
# CONFIG_KEYBOARD_SH_KEYSC is not set
CONFIG_KEYBOARD_IQS62X=m
CONFIG_KEYBOARD_OMAP4=y
CONFIG_KEYBOARD_SPEAR=y
# CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
CONFIG_KEYBOARD_XTKBD=y
CONFIG_KEYBOARD_CAP11XX=m
# CONFIG_KEYBOARD_MT6779 is not set
CONFIG_KEYBOARD_MTK_PMIC=m
CONFIG_KEYBOARD_CYPRESS_SF=m
CONFIG_INPUT_MOUSE=y
CONFIG_MOUSE_PS2=m
CONFIG_MOUSE_PS2_ALPS=y
CONFIG_MOUSE_PS2_BYD=y
CONFIG_MOUSE_PS2_LOGIPS2PP=y
# CONFIG_MOUSE_PS2_SYNAPTICS is not set
CONFIG_MOUSE_PS2_SYNAPTICS_SMBUS=y
# CONFIG_MOUSE_PS2_CYPRESS is not set
CONFIG_MOUSE_PS2_TRACKPOINT=y
CONFIG_MOUSE_PS2_ELANTECH=y
# CONFIG_MOUSE_PS2_ELANTECH_SMBUS is not set
CONFIG_MOUSE_PS2_SENTELIC=y
# CONFIG_MOUSE_PS2_TOUCHKIT is not set
# CONFIG_MOUSE_PS2_FOCALTECH is not set
CONFIG_MOUSE_PS2_SMBUS=y
# CONFIG_MOUSE_SERIAL is not set
# CONFIG_MOUSE_APPLETOUCH is not set
# CONFIG_MOUSE_BCM5974 is not set
CONFIG_MOUSE_CYAPA=m
CONFIG_MOUSE_ELAN_I2C=m
# CONFIG_MOUSE_ELAN_I2C_I2C is not set
CONFIG_MOUSE_ELAN_I2C_SMBUS=y
# CONFIG_MOUSE_VSXXXAA is not set
CONFIG_MOUSE_GPIO=m
CONFIG_MOUSE_SYNAPTICS_I2C=m
# CONFIG_MOUSE_SYNAPTICS_USB is not set
# CONFIG_INPUT_JOYSTICK is not set
CONFIG_INPUT_TABLET=y
CONFIG_TABLET_USB_ACECAD=m
CONFIG_TABLET_USB_AIPTEK=m
CONFIG_TABLET_USB_HANWANG=m
# CONFIG_TABLET_USB_KBTAB is not set
CONFIG_TABLET_USB_PEGASUS=m
CONFIG_TABLET_SERIAL_WACOM4=y
CONFIG_INPUT_TOUCHSCREEN=y
# CONFIG_TOUCHSCREEN_AD7879 is not set
CONFIG_TOUCHSCREEN_ADC=m
CONFIG_TOUCHSCREEN_AR1021_I2C=m
CONFIG_TOUCHSCREEN_ATMEL_MXT=m
# CONFIG_TOUCHSCREEN_ATMEL_MXT_T37 is not set
CONFIG_TOUCHSCREEN_AUO_PIXCIR=m
CONFIG_TOUCHSCREEN_BU21013=m
# CONFIG_TOUCHSCREEN_BU21029 is not set
CONFIG_TOUCHSCREEN_CHIPONE_ICN8318=m
CONFIG_TOUCHSCREEN_CY8CTMA140=m
# CONFIG_TOUCHSCREEN_CY8CTMG110 is not set
# CONFIG_TOUCHSCREEN_CYTTSP_CORE is not set
CONFIG_TOUCHSCREEN_CYTTSP4_CORE=y
# CONFIG_TOUCHSCREEN_CYTTSP4_I2C is not set
CONFIG_TOUCHSCREEN_CYTTSP5=m
CONFIG_TOUCHSCREEN_DYNAPRO=y
CONFIG_TOUCHSCREEN_HAMPSHIRE=m
CONFIG_TOUCHSCREEN_EETI=m
CONFIG_TOUCHSCREEN_EGALAX=m
CONFIG_TOUCHSCREEN_EGALAX_SERIAL=y
CONFIG_TOUCHSCREEN_EXC3000=m
# CONFIG_TOUCHSCREEN_FUJITSU is not set
CONFIG_TOUCHSCREEN_GOODIX=m
# CONFIG_TOUCHSCREEN_HIDEEP is not set
CONFIG_TOUCHSCREEN_HYCON_HY46XX=m
CONFIG_TOUCHSCREEN_HYNITRON_CSTXXX=m
CONFIG_TOUCHSCREEN_ILI210X=m
CONFIG_TOUCHSCREEN_ILITEK=m
# CONFIG_TOUCHSCREEN_IPROC is not set
CONFIG_TOUCHSCREEN_S6SY761=m
CONFIG_TOUCHSCREEN_GUNZE=m
# CONFIG_TOUCHSCREEN_EKTF2127 is not set
CONFIG_TOUCHSCREEN_ELAN=m
CONFIG_TOUCHSCREEN_ELO=m
CONFIG_TOUCHSCREEN_WACOM_W8001=m
CONFIG_TOUCHSCREEN_WACOM_I2C=m
CONFIG_TOUCHSCREEN_MAX11801=m
# CONFIG_TOUCHSCREEN_MCS5000 is not set
CONFIG_TOUCHSCREEN_MMS114=m
CONFIG_TOUCHSCREEN_MELFAS_MIP4=m
CONFIG_TOUCHSCREEN_MSG2638=m
# CONFIG_TOUCHSCREEN_MTOUCH is not set
CONFIG_TOUCHSCREEN_IMAGIS=m
CONFIG_TOUCHSCREEN_IMX6UL_TSC=m
# CONFIG_TOUCHSCREEN_INEXIO is not set
CONFIG_TOUCHSCREEN_MK712=m
CONFIG_TOUCHSCREEN_PENMOUNT=y
CONFIG_TOUCHSCREEN_EDT_FT5X06=m
# CONFIG_TOUCHSCREEN_RASPBERRYPI_FW is not set
CONFIG_TOUCHSCREEN_MIGOR=m
CONFIG_TOUCHSCREEN_TOUCHRIGHT=m
# CONFIG_TOUCHSCREEN_TOUCHWIN is not set
CONFIG_TOUCHSCREEN_TI_AM335X_TSC=y
CONFIG_TOUCHSCREEN_PIXCIR=m
CONFIG_TOUCHSCREEN_WDT87XX_I2C=m
# CONFIG_TOUCHSCREEN_USB_COMPOSITE is not set
# CONFIG_TOUCHSCREEN_MXS_LRADC is not set
# CONFIG_TOUCHSCREEN_MC13783 is not set
CONFIG_TOUCHSCREEN_TOUCHIT213=m
# CONFIG_TOUCHSCREEN_TS4800 is not set
# CONFIG_TOUCHSCREEN_TSC_SERIO is not set
CONFIG_TOUCHSCREEN_TSC200X_CORE=m
CONFIG_TOUCHSCREEN_TSC2004=m
CONFIG_TOUCHSCREEN_TSC2007=m
# CONFIG_TOUCHSCREEN_TSC2007_IIO is not set
CONFIG_TOUCHSCREEN_RM_TS=m
CONFIG_TOUCHSCREEN_SILEAD=m
# CONFIG_TOUCHSCREEN_SIS_I2C is not set
CONFIG_TOUCHSCREEN_ST1232=m
# CONFIG_TOUCHSCREEN_STMFTS is not set
# CONFIG_TOUCHSCREEN_SUN4I is not set
CONFIG_TOUCHSCREEN_SX8654=m
CONFIG_TOUCHSCREEN_TPS6507X=m
# CONFIG_TOUCHSCREEN_ZET6223 is not set
# CONFIG_TOUCHSCREEN_ZFORCE is not set
CONFIG_TOUCHSCREEN_COLIBRI_VF50=m
CONFIG_TOUCHSCREEN_ROHM_BU21023=m
# CONFIG_TOUCHSCREEN_IQS5XX is not set
# CONFIG_TOUCHSCREEN_ZINITIX is not set
CONFIG_TOUCHSCREEN_HIMAX_HX83112B=m
# CONFIG_INPUT_MISC is not set
# CONFIG_RMI4_CORE is not set

#
# Hardware I/O ports
#
CONFIG_SERIO=y
CONFIG_SERIO_SERPORT=y
CONFIG_SERIO_PARKBD=y
CONFIG_SERIO_LIBPS2=m
CONFIG_SERIO_RAW=y
CONFIG_SERIO_ALTERA_PS2=y
CONFIG_SERIO_PS2MULT=y
CONFIG_SERIO_ARC_PS2=y
CONFIG_SERIO_APBPS2=m
# CONFIG_SERIO_OLPC_APSP is not set
CONFIG_SERIO_SUN4I_PS2=y
# CONFIG_SERIO_GPIO_PS2 is not set
CONFIG_USERIO=y
CONFIG_GAMEPORT=m
CONFIG_GAMEPORT_NS558=m
CONFIG_GAMEPORT_L4=m
# end of Hardware I/O ports
# end of Input device support

#
# Character devices
#
CONFIG_TTY=y
CONFIG_VT=y
# CONFIG_CONSOLE_TRANSLATIONS is not set
# CONFIG_VT_CONSOLE is not set
CONFIG_HW_CONSOLE=y
# CONFIG_VT_HW_CONSOLE_BINDING is not set
# CONFIG_UNIX98_PTYS is not set
# CONFIG_LEGACY_PTYS is not set
# CONFIG_LEGACY_TIOCSTI is not set
CONFIG_LDISC_AUTOLOAD=y

#
# Serial drivers
#
CONFIG_SERIAL_EARLYCON=y
# CONFIG_SERIAL_8250 is not set

#
# Non-8250 serial port support
#
CONFIG_SERIAL_AMBA_PL010=y
# CONFIG_SERIAL_AMBA_PL010_CONSOLE is not set
# CONFIG_SERIAL_MESON is not set
CONFIG_SERIAL_CLPS711X=y
CONFIG_SERIAL_CLPS711X_CONSOLE=y
CONFIG_SERIAL_SAMSUNG=m
CONFIG_SERIAL_SAMSUNG_UARTS_4=y
CONFIG_SERIAL_SAMSUNG_UARTS=4
CONFIG_SERIAL_SAMSUNG_CONSOLE=y
CONFIG_SERIAL_TEGRA=m
CONFIG_SERIAL_IMX=m
# CONFIG_SERIAL_IMX_CONSOLE is not set
# CONFIG_SERIAL_IMX_EARLYCON is not set
# CONFIG_SERIAL_UARTLITE is not set
CONFIG_SERIAL_SH_SCI=m
CONFIG_SERIAL_SH_SCI_NR_UARTS=2
# CONFIG_SERIAL_HS_LPC32XX is not set
CONFIG_SERIAL_CORE=y
CONFIG_SERIAL_CORE_CONSOLE=y
# CONFIG_SERIAL_MSM is not set
CONFIG_SERIAL_QCOM_GENI=m
# CONFIG_SERIAL_QCOM_GENI_CONSOLE is not set
CONFIG_SERIAL_VT8500=y
CONFIG_SERIAL_VT8500_CONSOLE=y
CONFIG_SERIAL_OMAP=m
CONFIG_SERIAL_SIFIVE=y
CONFIG_SERIAL_SIFIVE_CONSOLE=y
# CONFIG_SERIAL_LANTIQ is not set
CONFIG_SERIAL_QE=y
CONFIG_SERIAL_SCCNXP=m
CONFIG_SERIAL_SC16IS7XX_CORE=m
CONFIG_SERIAL_SC16IS7XX=m
CONFIG_SERIAL_SC16IS7XX_I2C=y
# CONFIG_SERIAL_TIMBERDALE is not set
CONFIG_SERIAL_BCM63XX=m
CONFIG_SERIAL_ALTERA_JTAGUART=y
CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE=y
# CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE_BYPASS is not set
CONFIG_SERIAL_ALTERA_UART=m
CONFIG_SERIAL_ALTERA_UART_MAXPORTS=4
CONFIG_SERIAL_ALTERA_UART_BAUDRATE=115200
# CONFIG_SERIAL_MXS_AUART is not set
# CONFIG_SERIAL_XILINX_PS_UART is not set
CONFIG_SERIAL_MPS2_UART_CONSOLE=y
CONFIG_SERIAL_MPS2_UART=y
CONFIG_SERIAL_ARC=y
CONFIG_SERIAL_ARC_CONSOLE=y
CONFIG_SERIAL_ARC_NR_PORTS=1
CONFIG_SERIAL_FSL_LINFLEXUART=m
CONFIG_SERIAL_CONEXANT_DIGICOLOR=m
# CONFIG_SERIAL_ST_ASC is not set
CONFIG_SERIAL_MEN_Z135=m
CONFIG_SERIAL_STM32=m
# CONFIG_SERIAL_OWL is not set
# CONFIG_SERIAL_RDA is not set
CONFIG_SERIAL_MILBEAUT_USIO=m
CONFIG_SERIAL_MILBEAUT_USIO_PORTS=4
# CONFIG_SERIAL_LITEUART is not set
CONFIG_SERIAL_SUNPLUS=m
CONFIG_SERIAL_SUNPLUS_CONSOLE=y
# end of Serial drivers

CONFIG_SERIAL_MCTRL_GPIO=y
CONFIG_SERIAL_NONSTANDARD=y
CONFIG_N_HDLC=y
CONFIG_NULL_TTY=y
CONFIG_HVC_DRIVER=y
CONFIG_SERIAL_DEV_BUS=y
CONFIG_SERIAL_DEV_CTRL_TTYPORT=y
CONFIG_TTY_PRINTK=m
CONFIG_TTY_PRINTK_LEVEL=6
CONFIG_PRINTER=y
# CONFIG_LP_CONSOLE is not set
CONFIG_PPDEV=y
CONFIG_VIRTIO_CONSOLE=m
CONFIG_IPMI_HANDLER=m
CONFIG_IPMI_PLAT_DATA=y
CONFIG_IPMI_PANIC_EVENT=y
CONFIG_IPMI_PANIC_STRING=y
# CONFIG_IPMI_DEVICE_INTERFACE is not set
CONFIG_IPMI_SI=m
CONFIG_IPMI_SSIF=m
CONFIG_IPMI_IPMB=m
CONFIG_IPMI_WATCHDOG=m
CONFIG_IPMI_POWEROFF=m
CONFIG_IPMI_KCS_BMC=m
CONFIG_ASPEED_KCS_IPMI_BMC=m
CONFIG_NPCM7XX_KCS_IPMI_BMC=m
CONFIG_IPMI_KCS_BMC_CDEV_IPMI=m
CONFIG_IPMI_KCS_BMC_SERIO=m
# CONFIG_ASPEED_BT_IPMI_BMC is not set
CONFIG_SSIF_IPMI_BMC=m
CONFIG_IPMB_DEVICE_INTERFACE=m
CONFIG_HW_RANDOM=m
CONFIG_HW_RANDOM_TIMERIOMEM=m
CONFIG_HW_RANDOM_BA431=m
CONFIG_HW_RANDOM_BCM2835=m
CONFIG_HW_RANDOM_IPROC_RNG200=m
CONFIG_HW_RANDOM_IXP4XX=m
CONFIG_HW_RANDOM_OMAP=m
# CONFIG_HW_RANDOM_OMAP3_ROM is not set
# CONFIG_HW_RANDOM_VIRTIO is not set
CONFIG_HW_RANDOM_NOMADIK=m
# CONFIG_HW_RANDOM_STM32 is not set
CONFIG_HW_RANDOM_MESON=m
# CONFIG_HW_RANDOM_MTK is not set
CONFIG_HW_RANDOM_EXYNOS=m
CONFIG_HW_RANDOM_NPCM=m
CONFIG_HW_RANDOM_KEYSTONE=m
CONFIG_HW_RANDOM_CCTRNG=m
CONFIG_HW_RANDOM_XIPHERA=m

#
# PCMCIA character devices
#
# CONFIG_SYNCLINK_CS is not set
# CONFIG_CARDMAN_4000 is not set
# CONFIG_CARDMAN_4040 is not set
# CONFIG_SCR24X is not set
# end of PCMCIA character devices

# CONFIG_DEVMEM is not set
CONFIG_TCG_TPM=m
CONFIG_HW_RANDOM_TPM=y
CONFIG_TCG_TIS_CORE=m
CONFIG_TCG_TIS=m
CONFIG_TCG_TIS_I2C=m
CONFIG_TCG_TIS_SYNQUACER=m
CONFIG_TCG_TIS_I2C_CR50=m
# CONFIG_TCG_TIS_I2C_ATMEL is not set
# CONFIG_TCG_TIS_I2C_INFINEON is not set
# CONFIG_TCG_TIS_I2C_NUVOTON is not set
CONFIG_TCG_VTPM_PROXY=m
# CONFIG_TCG_TIS_ST33ZP24_I2C is not set
CONFIG_XILLYBUS_CLASS=m
CONFIG_XILLYBUS=m
# CONFIG_XILLYUSB is not set
# end of Character devices

#
# I2C support
#
CONFIG_I2C=m
CONFIG_I2C_BOARDINFO=y
CONFIG_I2C_COMPAT=y
# CONFIG_I2C_CHARDEV is not set
CONFIG_I2C_MUX=m

#
# Multiplexer I2C Chip support
#
# CONFIG_I2C_ARB_GPIO_CHALLENGE is not set
# CONFIG_I2C_MUX_GPIO is not set
CONFIG_I2C_MUX_GPMUX=m
CONFIG_I2C_MUX_LTC4306=m
CONFIG_I2C_MUX_PCA9541=m
# CONFIG_I2C_MUX_PCA954x is not set
CONFIG_I2C_MUX_PINCTRL=m
CONFIG_I2C_MUX_REG=m
# CONFIG_I2C_DEMUX_PINCTRL is not set
CONFIG_I2C_MUX_MLXCPLD=m
# end of Multiplexer I2C Chip support

CONFIG_I2C_HELPER_AUTO=y
CONFIG_I2C_SMBUS=m
CONFIG_I2C_ALGOBIT=m
CONFIG_I2C_ALGOPCA=m

#
# I2C Hardware Bus support
#
# CONFIG_I2C_HIX5HD2 is not set

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
# CONFIG_I2C_ALTERA is not set
# CONFIG_I2C_ASPEED is not set
CONFIG_I2C_AT91=m
# CONFIG_I2C_AT91_SLAVE_EXPERIMENTAL is not set
CONFIG_I2C_AXXIA=m
# CONFIG_I2C_BCM_IPROC is not set
# CONFIG_I2C_BCM_KONA is not set
CONFIG_I2C_BRCMSTB=m
CONFIG_I2C_CADENCE=m
# CONFIG_I2C_CBUS_GPIO is not set
CONFIG_I2C_DAVINCI=m
CONFIG_I2C_DESIGNWARE_CORE=m
CONFIG_I2C_DESIGNWARE_SLAVE=y
CONFIG_I2C_DESIGNWARE_PLATFORM=m
CONFIG_I2C_DIGICOLOR=m
# CONFIG_I2C_EXYNOS5 is not set
CONFIG_I2C_GPIO=m
# CONFIG_I2C_GPIO_FAULT_INJECTOR is not set
CONFIG_I2C_HIGHLANDER=m
CONFIG_I2C_HISI=m
CONFIG_I2C_IMG=m
CONFIG_I2C_IMX=m
CONFIG_I2C_IMX_LPI2C=m
# CONFIG_I2C_IOP3XX is not set
# CONFIG_I2C_JZ4780 is not set
CONFIG_I2C_KEMPLD=m
CONFIG_I2C_LPC2K=m
CONFIG_I2C_MICROCHIP_CORE=m
# CONFIG_I2C_MT65XX is not set
# CONFIG_I2C_MT7621 is not set
CONFIG_I2C_MV64XXX=m
CONFIG_I2C_MXS=m
# CONFIG_I2C_NPCM is not set
CONFIG_I2C_OCORES=m
# CONFIG_I2C_OMAP is not set
# CONFIG_I2C_OWL is not set
# CONFIG_I2C_APPLE is not set
CONFIG_I2C_PCA_PLATFORM=m
CONFIG_I2C_PNX=m
CONFIG_I2C_PXA=m
# CONFIG_I2C_PXA_SLAVE is not set
# CONFIG_I2C_QCOM_CCI is not set
CONFIG_I2C_QCOM_GENI=m
CONFIG_I2C_QUP=m
# CONFIG_I2C_RIIC is not set
CONFIG_I2C_RZV2M=m
CONFIG_I2C_S3C2410=m
CONFIG_I2C_SH_MOBILE=m
CONFIG_I2C_SIMTEC=m
CONFIG_I2C_ST=m
# CONFIG_I2C_STM32F4 is not set
CONFIG_I2C_STM32F7=m
CONFIG_I2C_SUN6I_P2WI=m
CONFIG_I2C_SYNQUACER=m
CONFIG_I2C_TEGRA=m
CONFIG_I2C_TEGRA_BPMP=m
CONFIG_I2C_UNIPHIER=m
# CONFIG_I2C_UNIPHIER_F is not set
# CONFIG_I2C_VERSATILE is not set
CONFIG_I2C_WMT=m
# CONFIG_I2C_XILINX is not set
CONFIG_I2C_XLP9XX=m
CONFIG_I2C_RCAR=m

#
# External I2C/SMBus adapter drivers
#
# CONFIG_I2C_DIOLAN_U2C is not set
CONFIG_I2C_CP2615=m
# CONFIG_I2C_PARPORT is not set
CONFIG_I2C_ROBOTFUZZ_OSIF=m
# CONFIG_I2C_TAOS_EVM is not set
# CONFIG_I2C_TINY_USB is not set
# CONFIG_I2C_VIPERBOARD is not set

#
# Other I2C/SMBus bus drivers
#
CONFIG_I2C_MLXCPLD=m
# CONFIG_I2C_FSI is not set
# CONFIG_I2C_VIRTIO is not set
# end of I2C Hardware Bus support

CONFIG_I2C_STUB=m
CONFIG_I2C_SLAVE=y
CONFIG_I2C_SLAVE_EEPROM=m
# CONFIG_I2C_SLAVE_TESTUNIT is not set
CONFIG_I2C_DEBUG_CORE=y
# CONFIG_I2C_DEBUG_ALGO is not set
CONFIG_I2C_DEBUG_BUS=y
# end of I2C support

CONFIG_I3C=m
CONFIG_CDNS_I3C_MASTER=m
CONFIG_DW_I3C_MASTER=m
# CONFIG_SVC_I3C_MASTER is not set
CONFIG_MIPI_I3C_HCI=m
# CONFIG_SPI is not set
CONFIG_SPMI=m
CONFIG_SPMI_HISI3670=m
CONFIG_SPMI_MSM_PMIC_ARB=m
CONFIG_SPMI_MTK_PMIF=m
CONFIG_HSI=y
CONFIG_HSI_BOARDINFO=y

#
# HSI controllers
#

#
# HSI clients
#
# CONFIG_HSI_CHAR is not set
CONFIG_PPS=m
CONFIG_PPS_DEBUG=y
# CONFIG_NTP_PPS is not set

#
# PPS clients support
#
CONFIG_PPS_CLIENT_KTIMER=m
CONFIG_PPS_CLIENT_LDISC=m
# CONFIG_PPS_CLIENT_PARPORT is not set
CONFIG_PPS_CLIENT_GPIO=m

#
# PPS generators support
#

#
# PTP clock support
#
CONFIG_PTP_1588_CLOCK_OPTIONAL=y

#
# Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
#
# end of PTP clock support

CONFIG_PINCTRL=y
CONFIG_GENERIC_PINCTRL_GROUPS=y
CONFIG_PINMUX=y
CONFIG_GENERIC_PINMUX_FUNCTIONS=y
CONFIG_PINCONF=y
CONFIG_GENERIC_PINCONF=y
# CONFIG_DEBUG_PINCTRL is not set
# CONFIG_PINCTRL_AMD is not set
CONFIG_PINCTRL_AT91PIO4=y
CONFIG_PINCTRL_BM1880=y
CONFIG_PINCTRL_CY8C95X0=m
# CONFIG_PINCTRL_DA850_PUPD is not set
CONFIG_PINCTRL_DA9062=m
CONFIG_PINCTRL_EQUILIBRIUM=y
CONFIG_PINCTRL_INGENIC=y
CONFIG_PINCTRL_LOONGSON2=y
# CONFIG_PINCTRL_LPC18XX is not set
CONFIG_PINCTRL_MCP23S08_I2C=m
CONFIG_PINCTRL_MCP23S08=m
CONFIG_PINCTRL_MICROCHIP_SGPIO=m
CONFIG_PINCTRL_OCELOT=y
# CONFIG_PINCTRL_PISTACHIO is not set
# CONFIG_PINCTRL_ROCKCHIP is not set
# CONFIG_PINCTRL_SINGLE is not set
# CONFIG_PINCTRL_STMFX is not set
# CONFIG_PINCTRL_OWL is not set
CONFIG_PINCTRL_ASPEED=y
# CONFIG_PINCTRL_ASPEED_G4 is not set
# CONFIG_PINCTRL_ASPEED_G5 is not set
CONFIG_PINCTRL_ASPEED_G6=y
# CONFIG_PINCTRL_BCM281XX is not set
CONFIG_PINCTRL_BCM2835=m
CONFIG_PINCTRL_BCM4908=m
CONFIG_PINCTRL_BCM63XX=y
# CONFIG_PINCTRL_BCM6318 is not set
# CONFIG_PINCTRL_BCM6328 is not set
# CONFIG_PINCTRL_BCM6358 is not set
CONFIG_PINCTRL_BCM6362=y
CONFIG_PINCTRL_BCM6368=y
CONFIG_PINCTRL_BCM63268=y
CONFIG_PINCTRL_IPROC_GPIO=y
# CONFIG_PINCTRL_CYGNUS_MUX is not set
CONFIG_PINCTRL_NS=y
CONFIG_PINCTRL_NSP_GPIO=y
CONFIG_PINCTRL_NS2_MUX=y
CONFIG_PINCTRL_NSP_MUX=y
CONFIG_PINCTRL_BERLIN=y
# CONFIG_PINCTRL_AS370 is not set
CONFIG_PINCTRL_BERLIN_BG4CT=y
CONFIG_PINCTRL_MADERA=m
CONFIG_PINCTRL_CS47L35=y
CONFIG_PINCTRL_CS47L85=y
CONFIG_PINCTRL_CS47L92=y

#
# Intel pinctrl drivers
#
# end of Intel pinctrl drivers

#
# MediaTek pinctrl drivers
#
CONFIG_EINT_MTK=y
CONFIG_PINCTRL_MTK=y
CONFIG_PINCTRL_MTK_V2=y
CONFIG_PINCTRL_MTK_MOORE=y
CONFIG_PINCTRL_MTK_PARIS=y
CONFIG_PINCTRL_MT2701=y
# CONFIG_PINCTRL_MT7623 is not set
# CONFIG_PINCTRL_MT7629 is not set
CONFIG_PINCTRL_MT8135=y
# CONFIG_PINCTRL_MT8127 is not set
# CONFIG_PINCTRL_MT2712 is not set
# CONFIG_PINCTRL_MT6765 is not set
CONFIG_PINCTRL_MT6779=y
# CONFIG_PINCTRL_MT6795 is not set
# CONFIG_PINCTRL_MT6797 is not set
# CONFIG_PINCTRL_MT7622 is not set
CONFIG_PINCTRL_MT7986=y
CONFIG_PINCTRL_MT8167=y
CONFIG_PINCTRL_MT8173=y
# CONFIG_PINCTRL_MT8183 is not set
# CONFIG_PINCTRL_MT8186 is not set
# CONFIG_PINCTRL_MT8188 is not set
# CONFIG_PINCTRL_MT8192 is not set
# CONFIG_PINCTRL_MT8195 is not set
CONFIG_PINCTRL_MT8365=y
CONFIG_PINCTRL_MT8516=y
# CONFIG_PINCTRL_MT6397 is not set
# end of MediaTek pinctrl drivers

# CONFIG_PINCTRL_MESON is not set
CONFIG_PINCTRL_WPCM450=y
CONFIG_PINCTRL_NPCM7XX=y
CONFIG_PINCTRL_PXA=y
CONFIG_PINCTRL_PXA25X=m
CONFIG_PINCTRL_PXA27X=m
CONFIG_PINCTRL_MSM=y
# CONFIG_PINCTRL_APQ8064 is not set
CONFIG_PINCTRL_APQ8084=m
# CONFIG_PINCTRL_IPQ4019 is not set
# CONFIG_PINCTRL_IPQ8064 is not set
# CONFIG_PINCTRL_IPQ8074 is not set
# CONFIG_PINCTRL_IPQ6018 is not set
CONFIG_PINCTRL_MSM8226=m
# CONFIG_PINCTRL_MSM8660 is not set
CONFIG_PINCTRL_MSM8960=y
CONFIG_PINCTRL_MDM9607=m
# CONFIG_PINCTRL_MDM9615 is not set
# CONFIG_PINCTRL_MSM8X74 is not set
# CONFIG_PINCTRL_MSM8909 is not set
CONFIG_PINCTRL_MSM8916=m
CONFIG_PINCTRL_MSM8953=m
CONFIG_PINCTRL_MSM8976=m
CONFIG_PINCTRL_MSM8994=m
CONFIG_PINCTRL_MSM8996=y
CONFIG_PINCTRL_MSM8998=y
CONFIG_PINCTRL_QCM2290=m
CONFIG_PINCTRL_QCS404=y
CONFIG_PINCTRL_QCOM_SPMI_PMIC=m
# CONFIG_PINCTRL_QCOM_SSBI_PMIC is not set
# CONFIG_PINCTRL_SC7180 is not set
CONFIG_PINCTRL_SC7280=y
# CONFIG_PINCTRL_SC7280_LPASS_LPI is not set
CONFIG_PINCTRL_SC8180X=y
# CONFIG_PINCTRL_SC8280XP is not set
# CONFIG_PINCTRL_SDM660 is not set
# CONFIG_PINCTRL_SDM670 is not set
# CONFIG_PINCTRL_SDM845 is not set
# CONFIG_PINCTRL_SDX55 is not set
# CONFIG_PINCTRL_SM6115 is not set
CONFIG_PINCTRL_SM6125=m
# CONFIG_PINCTRL_SM6350 is not set
CONFIG_PINCTRL_SM6375=y
CONFIG_PINCTRL_SDX65=y
CONFIG_PINCTRL_SM8150=m
CONFIG_PINCTRL_SM8250=y
CONFIG_PINCTRL_SM8250_LPASS_LPI=m
# CONFIG_PINCTRL_SM8350 is not set
CONFIG_PINCTRL_SM8450=y
CONFIG_PINCTRL_SM8450_LPASS_LPI=y
# CONFIG_PINCTRL_SC8280XP_LPASS_LPI is not set
CONFIG_PINCTRL_LPASS_LPI=y

#
# Renesas pinctrl drivers
#
# CONFIG_PINCTRL_RENESAS is not set
CONFIG_PINCTRL_SH_PFC=y
CONFIG_PINCTRL_SH_PFC_GPIO=y
CONFIG_PINCTRL_SH_FUNC_GPIO=y
# CONFIG_PINCTRL_PFC_EMEV2 is not set
# CONFIG_PINCTRL_PFC_R8A77995 is not set
# CONFIG_PINCTRL_PFC_R8A7794 is not set
CONFIG_PINCTRL_PFC_R8A77990=y
CONFIG_PINCTRL_PFC_R8A7779=y
# CONFIG_PINCTRL_PFC_R8A7790 is not set
# CONFIG_PINCTRL_PFC_R8A77950 is not set
CONFIG_PINCTRL_PFC_R8A77951=y
# CONFIG_PINCTRL_PFC_R8A7778 is not set
# CONFIG_PINCTRL_PFC_R8A7793 is not set
# CONFIG_PINCTRL_PFC_R8A7791 is not set
# CONFIG_PINCTRL_PFC_R8A77965 is not set
# CONFIG_PINCTRL_PFC_R8A77960 is not set
CONFIG_PINCTRL_PFC_R8A77961=y
CONFIG_PINCTRL_PFC_R8A779F0=y
CONFIG_PINCTRL_PFC_R8A7792=y
CONFIG_PINCTRL_PFC_R8A77980=y
# CONFIG_PINCTRL_PFC_R8A77970 is not set
# CONFIG_PINCTRL_PFC_R8A779A0 is not set
# CONFIG_PINCTRL_PFC_R8A779G0 is not set
CONFIG_PINCTRL_PFC_R8A7740=y
# CONFIG_PINCTRL_PFC_R8A73A4 is not set
CONFIG_PINCTRL_RZA1=y
CONFIG_PINCTRL_RZA2=y
CONFIG_PINCTRL_RZG2L=y
CONFIG_PINCTRL_PFC_R8A77470=y
# CONFIG_PINCTRL_PFC_R8A7745 is not set
CONFIG_PINCTRL_PFC_R8A7742=y
CONFIG_PINCTRL_PFC_R8A7743=y
# CONFIG_PINCTRL_PFC_R8A7744 is not set
CONFIG_PINCTRL_PFC_R8A774C0=y
# CONFIG_PINCTRL_PFC_R8A774E1 is not set
# CONFIG_PINCTRL_PFC_R8A774A1 is not set
CONFIG_PINCTRL_PFC_R8A774B1=y
CONFIG_PINCTRL_RZN1=y
# CONFIG_PINCTRL_RZV2M is not set
# CONFIG_PINCTRL_PFC_SH7203 is not set
# CONFIG_PINCTRL_PFC_SH7264 is not set
# CONFIG_PINCTRL_PFC_SH7269 is not set
# CONFIG_PINCTRL_PFC_SH7720 is not set
CONFIG_PINCTRL_PFC_SH7722=y
CONFIG_PINCTRL_PFC_SH7734=y
# CONFIG_PINCTRL_PFC_SH7757 is not set
CONFIG_PINCTRL_PFC_SH7785=y
CONFIG_PINCTRL_PFC_SH7786=y
CONFIG_PINCTRL_PFC_SH73A0=y
CONFIG_PINCTRL_PFC_SH7723=y
CONFIG_PINCTRL_PFC_SH7724=y
# CONFIG_PINCTRL_PFC_SHX3 is not set
# end of Renesas pinctrl drivers

# CONFIG_PINCTRL_EXYNOS is not set
# CONFIG_PINCTRL_S3C24XX is not set
# CONFIG_PINCTRL_S3C64XX is not set
CONFIG_PINCTRL_SPRD=y
CONFIG_PINCTRL_SPRD_SC9860=y
# CONFIG_PINCTRL_STARFIVE_JH7100 is not set
CONFIG_PINCTRL_STM32=y
CONFIG_PINCTRL_STM32F429=y
# CONFIG_PINCTRL_STM32F469 is not set
# CONFIG_PINCTRL_STM32F746 is not set
# CONFIG_PINCTRL_STM32F769 is not set
# CONFIG_PINCTRL_STM32H743 is not set
# CONFIG_PINCTRL_STM32MP135 is not set
CONFIG_PINCTRL_STM32MP157=y
CONFIG_PINCTRL_TI_IODELAY=m
# CONFIG_PINCTRL_UNIPHIER is not set
# CONFIG_PINCTRL_TMPV7700 is not set
CONFIG_GPIOLIB=y
CONFIG_GPIOLIB_FASTPATH_LIMIT=512
CONFIG_OF_GPIO=y
CONFIG_GPIOLIB_IRQCHIP=y
# CONFIG_DEBUG_GPIO is not set
# CONFIG_GPIO_SYSFS is not set
CONFIG_GPIO_CDEV=y
# CONFIG_GPIO_CDEV_V1 is not set
CONFIG_GPIO_GENERIC=y
CONFIG_GPIO_REGMAP=y
CONFIG_GPIO_MAX730X=m

#
# Memory mapped GPIO drivers
#
CONFIG_GPIO_74XX_MMIO=m
CONFIG_GPIO_ALTERA=y
# CONFIG_GPIO_ASPEED is not set
# CONFIG_GPIO_ASPEED_SGPIO is not set
# CONFIG_GPIO_ATH79 is not set
# CONFIG_GPIO_RASPBERRYPI_EXP is not set
# CONFIG_GPIO_BCM_KONA is not set
CONFIG_GPIO_BCM_XGS_IPROC=m
CONFIG_GPIO_BRCMSTB=m
CONFIG_GPIO_CADENCE=m
CONFIG_GPIO_CLPS711X=y
CONFIG_GPIO_DWAPB=m
CONFIG_GPIO_EIC_SPRD=y
CONFIG_GPIO_EM=y
CONFIG_GPIO_FTGPIO010=y
# CONFIG_GPIO_GENERIC_PLATFORM is not set
CONFIG_GPIO_GRGPIO=m
# CONFIG_GPIO_HISI is not set
CONFIG_GPIO_HLWD=y
# CONFIG_GPIO_IOP is not set
CONFIG_GPIO_LOGICVC=y
CONFIG_GPIO_LPC18XX=m
# CONFIG_GPIO_LPC32XX is not set
# CONFIG_GPIO_MB86S7X is not set
# CONFIG_GPIO_MENZ127 is not set
CONFIG_GPIO_MPC8XXX=y
# CONFIG_GPIO_MT7621 is not set
CONFIG_GPIO_MXC=y
# CONFIG_GPIO_MXS is not set
# CONFIG_GPIO_PMIC_EIC_SPRD is not set
# CONFIG_GPIO_PXA is not set
# CONFIG_GPIO_RCAR is not set
# CONFIG_GPIO_RDA is not set
CONFIG_GPIO_ROCKCHIP=m
CONFIG_GPIO_SAMA5D2_PIOBU=m
CONFIG_GPIO_SIFIVE=y
# CONFIG_GPIO_SNPS_CREG is not set
CONFIG_GPIO_SPRD=m
CONFIG_GPIO_STP_XWAY=y
CONFIG_GPIO_SYSCON=y
CONFIG_GPIO_TEGRA=y
CONFIG_GPIO_TEGRA186=y
# CONFIG_GPIO_TS4800 is not set
CONFIG_GPIO_UNIPHIER=m
# CONFIG_GPIO_VISCONTI is not set
CONFIG_GPIO_XGENE_SB=y
# CONFIG_GPIO_XILINX is not set
CONFIG_GPIO_XLP=m
CONFIG_GPIO_AMD_FCH=m
CONFIG_GPIO_IDT3243X=y
# end of Memory mapped GPIO drivers

#
# I2C GPIO expanders
#
CONFIG_GPIO_ADNP=m
CONFIG_GPIO_GW_PLD=m
CONFIG_GPIO_MAX7300=m
# CONFIG_GPIO_MAX732X is not set
CONFIG_GPIO_PCA953X=m
CONFIG_GPIO_PCA953X_IRQ=y
CONFIG_GPIO_PCA9570=m
# CONFIG_GPIO_PCF857X is not set
CONFIG_GPIO_TPIC2810=m
CONFIG_GPIO_TS4900=m
# end of I2C GPIO expanders

#
# MFD GPIO expanders
#
CONFIG_GPIO_KEMPLD=m
# CONFIG_GPIO_LP3943 is not set
CONFIG_GPIO_MADERA=m
CONFIG_GPIO_MAX77650=m
CONFIG_GPIO_SL28CPLD=y
CONFIG_GPIO_TPS65086=m
# CONFIG_GPIO_WM8994 is not set
# end of MFD GPIO expanders

#
# USB GPIO expanders
#
CONFIG_GPIO_VIPERBOARD=y
# end of USB GPIO expanders

#
# Virtual GPIO drivers
#
# CONFIG_GPIO_AGGREGATOR is not set
CONFIG_GPIO_LATCH=y
CONFIG_GPIO_MOCKUP=y
# CONFIG_GPIO_VIRTIO is not set
CONFIG_GPIO_SIM=y
# end of Virtual GPIO drivers

CONFIG_W1=y

#
# 1-wire Bus Masters
#
# CONFIG_W1_MASTER_DS2490 is not set
CONFIG_W1_MASTER_DS2482=m
CONFIG_W1_MASTER_MXC=m
# CONFIG_W1_MASTER_DS1WM is not set
CONFIG_W1_MASTER_GPIO=y
CONFIG_W1_MASTER_SGI=y
# end of 1-wire Bus Masters

#
# 1-wire Slaves
#
# CONFIG_W1_SLAVE_THERM is not set
# CONFIG_W1_SLAVE_SMEM is not set
CONFIG_W1_SLAVE_DS2405=y
# CONFIG_W1_SLAVE_DS2408 is not set
# CONFIG_W1_SLAVE_DS2413 is not set
CONFIG_W1_SLAVE_DS2406=m
CONFIG_W1_SLAVE_DS2423=y
# CONFIG_W1_SLAVE_DS2805 is not set
# CONFIG_W1_SLAVE_DS2430 is not set
CONFIG_W1_SLAVE_DS2431=m
CONFIG_W1_SLAVE_DS2433=m
# CONFIG_W1_SLAVE_DS2433_CRC is not set
CONFIG_W1_SLAVE_DS2438=m
CONFIG_W1_SLAVE_DS250X=y
CONFIG_W1_SLAVE_DS2780=y
CONFIG_W1_SLAVE_DS2781=y
CONFIG_W1_SLAVE_DS28E04=y
# CONFIG_W1_SLAVE_DS28E17 is not set
# end of 1-wire Slaves

# CONFIG_POWER_RESET is not set
CONFIG_POWER_SUPPLY=y
CONFIG_POWER_SUPPLY_DEBUG=y
# CONFIG_POWER_SUPPLY_HWMON is not set
# CONFIG_PDA_POWER is not set
CONFIG_GENERIC_ADC_BATTERY=m
CONFIG_IP5XXX_POWER=m
CONFIG_TEST_POWER=y
CONFIG_CHARGER_ADP5061=m
# CONFIG_BATTERY_ACT8945A is not set
CONFIG_BATTERY_CW2015=m
CONFIG_BATTERY_DS2760=y
# CONFIG_BATTERY_DS2780 is not set
CONFIG_BATTERY_DS2781=y
CONFIG_BATTERY_DS2782=m
CONFIG_BATTERY_LEGO_EV3=m
CONFIG_BATTERY_SAMSUNG_SDI=y
CONFIG_BATTERY_INGENIC=m
CONFIG_BATTERY_SBS=m
CONFIG_CHARGER_SBS=m
CONFIG_MANAGER_SBS=m
# CONFIG_BATTERY_BQ27XXX is not set
CONFIG_CHARGER_DA9150=m
# CONFIG_BATTERY_DA9150 is not set
# CONFIG_BATTERY_MAX17040 is not set
CONFIG_BATTERY_MAX17042=m
# CONFIG_BATTERY_MAX1721X is not set
CONFIG_CHARGER_ISP1704=y
# CONFIG_CHARGER_MAX8903 is not set
CONFIG_CHARGER_LP8727=m
CONFIG_CHARGER_GPIO=y
CONFIG_CHARGER_MANAGER=m
CONFIG_CHARGER_LT3651=y
CONFIG_CHARGER_LTC4162L=m
CONFIG_CHARGER_MAX14577=m
CONFIG_CHARGER_DETECTOR_MAX14656=m
CONFIG_CHARGER_MAX77650=m
# CONFIG_CHARGER_MAX77693 is not set
CONFIG_CHARGER_MAX77976=m
# CONFIG_CHARGER_MT6360 is not set
CONFIG_CHARGER_MT6370=m
CONFIG_CHARGER_QCOM_SMBB=m
# CONFIG_CHARGER_BQ2415X is not set
CONFIG_CHARGER_BQ24190=m
# CONFIG_CHARGER_BQ24257 is not set
CONFIG_CHARGER_BQ24735=m
CONFIG_CHARGER_BQ2515X=m
# CONFIG_CHARGER_BQ25890 is not set
# CONFIG_CHARGER_BQ25980 is not set
# CONFIG_CHARGER_BQ256XX is not set
# CONFIG_CHARGER_SMB347 is not set
CONFIG_BATTERY_GAUGE_LTC2941=m
# CONFIG_BATTERY_GOLDFISH is not set
CONFIG_BATTERY_RT5033=m
# CONFIG_CHARGER_RT9455 is not set
CONFIG_CHARGER_SC2731=y
CONFIG_FUEL_GAUGE_SC27XX=m
# CONFIG_CHARGER_UCS1002 is not set
CONFIG_CHARGER_BD99954=m
CONFIG_BATTERY_UG3105=m
CONFIG_HWMON=y
CONFIG_HWMON_VID=y
CONFIG_HWMON_DEBUG_CHIP=y

#
# Native drivers
#
CONFIG_SENSORS_SMPRO=m
CONFIG_SENSORS_AD7414=m
CONFIG_SENSORS_AD7418=m
CONFIG_SENSORS_ADM1021=m
CONFIG_SENSORS_ADM1025=m
CONFIG_SENSORS_ADM1026=m
# CONFIG_SENSORS_ADM1029 is not set
# CONFIG_SENSORS_ADM1031 is not set
# CONFIG_SENSORS_ADM1177 is not set
# CONFIG_SENSORS_ADM9240 is not set
CONFIG_SENSORS_ADT7X10=m
CONFIG_SENSORS_ADT7410=m
CONFIG_SENSORS_ADT7411=m
CONFIG_SENSORS_ADT7462=m
# CONFIG_SENSORS_ADT7470 is not set
CONFIG_SENSORS_ADT7475=m
CONFIG_SENSORS_AHT10=m
# CONFIG_SENSORS_AQUACOMPUTER_D5NEXT is not set
CONFIG_SENSORS_AS370=m
CONFIG_SENSORS_ASC7621=m
CONFIG_SENSORS_AXI_FAN_CONTROL=m
# CONFIG_SENSORS_ASB100 is not set
CONFIG_SENSORS_ASPEED=y
# CONFIG_SENSORS_ATXP1 is not set
# CONFIG_SENSORS_BT1_PVT is not set
# CONFIG_SENSORS_CORSAIR_CPRO is not set
# CONFIG_SENSORS_CORSAIR_PSU is not set
# CONFIG_SENSORS_DS620 is not set
CONFIG_SENSORS_DS1621=m
CONFIG_SENSORS_SPARX5=m
CONFIG_SENSORS_F71805F=m
# CONFIG_SENSORS_F71882FG is not set
CONFIG_SENSORS_F75375S=m
# CONFIG_SENSORS_MC13783_ADC is not set
CONFIG_SENSORS_FSCHMD=m
CONFIG_SENSORS_FTSTEUTATES=m
CONFIG_SENSORS_GL518SM=m
# CONFIG_SENSORS_GL520SM is not set
CONFIG_SENSORS_G760A=m
CONFIG_SENSORS_G762=m
# CONFIG_SENSORS_GPIO_FAN is not set
CONFIG_SENSORS_HIH6130=m
CONFIG_SENSORS_IBMAEM=m
CONFIG_SENSORS_IBMPEX=m
# CONFIG_SENSORS_IIO_HWMON is not set
CONFIG_SENSORS_IT87=m
CONFIG_SENSORS_JC42=m
# CONFIG_SENSORS_POWR1220 is not set
CONFIG_SENSORS_LAN966X=y
# CONFIG_SENSORS_LINEAGE is not set
CONFIG_SENSORS_LTC2945=m
CONFIG_SENSORS_LTC2947=m
CONFIG_SENSORS_LTC2947_I2C=m
CONFIG_SENSORS_LTC2990=m
CONFIG_SENSORS_LTC2992=m
CONFIG_SENSORS_LTC4151=m
CONFIG_SENSORS_LTC4215=m
CONFIG_SENSORS_LTC4222=m
CONFIG_SENSORS_LTC4245=m
# CONFIG_SENSORS_LTC4260 is not set
CONFIG_SENSORS_LTC4261=m
CONFIG_SENSORS_MAX127=m
CONFIG_SENSORS_MAX16065=m
CONFIG_SENSORS_MAX1619=m
CONFIG_SENSORS_MAX1668=m
CONFIG_SENSORS_MAX197=y
# CONFIG_SENSORS_MAX31730 is not set
CONFIG_SENSORS_MAX31760=m
CONFIG_SENSORS_MAX6620=m
CONFIG_SENSORS_MAX6621=m
CONFIG_SENSORS_MAX6639=m
CONFIG_SENSORS_MAX6642=m
CONFIG_SENSORS_MAX6650=m
# CONFIG_SENSORS_MAX6697 is not set
CONFIG_SENSORS_MAX31790=m
CONFIG_SENSORS_MCP3021=m
CONFIG_SENSORS_TC654=m
CONFIG_SENSORS_TPS23861=m
# CONFIG_SENSORS_MR75203 is not set
CONFIG_SENSORS_LM63=m
CONFIG_SENSORS_LM73=m
CONFIG_SENSORS_LM75=m
CONFIG_SENSORS_LM77=m
CONFIG_SENSORS_LM78=m
CONFIG_SENSORS_LM80=m
CONFIG_SENSORS_LM83=m
CONFIG_SENSORS_LM85=m
CONFIG_SENSORS_LM87=m
# CONFIG_SENSORS_LM90 is not set
# CONFIG_SENSORS_LM92 is not set
CONFIG_SENSORS_LM93=m
# CONFIG_SENSORS_LM95234 is not set
CONFIG_SENSORS_LM95241=m
CONFIG_SENSORS_LM95245=m
CONFIG_SENSORS_PC87360=y
CONFIG_SENSORS_PC87427=m
# CONFIG_SENSORS_NTC_THERMISTOR is not set
CONFIG_SENSORS_NCT6683=m
CONFIG_SENSORS_NCT6775_CORE=y
CONFIG_SENSORS_NCT6775=y
CONFIG_SENSORS_NCT6775_I2C=m
CONFIG_SENSORS_NCT7802=m
CONFIG_SENSORS_NCT7904=m
# CONFIG_SENSORS_NPCM7XX is not set
CONFIG_SENSORS_NSA320=m
# CONFIG_SENSORS_NZXT_KRAKEN2 is not set
# CONFIG_SENSORS_NZXT_SMART2 is not set
CONFIG_SENSORS_OCC_P8_I2C=m
CONFIG_SENSORS_OCC_P9_SBE=m
CONFIG_SENSORS_OCC=m
CONFIG_SENSORS_PCF8591=m
CONFIG_SENSORS_PECI_CPUTEMP=m
CONFIG_SENSORS_PECI_DIMMTEMP=m
CONFIG_SENSORS_PECI=m
CONFIG_PMBUS=m
CONFIG_SENSORS_PMBUS=m
CONFIG_SENSORS_ADM1266=m
CONFIG_SENSORS_ADM1275=m
# CONFIG_SENSORS_BEL_PFE is not set
CONFIG_SENSORS_BPA_RS600=m
# CONFIG_SENSORS_DELTA_AHE50DC_FAN is not set
# CONFIG_SENSORS_FSP_3Y is not set
CONFIG_SENSORS_IBM_CFFPS=m
CONFIG_SENSORS_DPS920AB=m
CONFIG_SENSORS_INSPUR_IPSPS=m
# CONFIG_SENSORS_IR35221 is not set
CONFIG_SENSORS_IR36021=m
# CONFIG_SENSORS_IR38064 is not set
# CONFIG_SENSORS_IRPS5401 is not set
# CONFIG_SENSORS_ISL68137 is not set
CONFIG_SENSORS_LM25066=m
CONFIG_SENSORS_LM25066_REGULATOR=y
CONFIG_SENSORS_LT7182S=m
# CONFIG_SENSORS_LTC2978 is not set
# CONFIG_SENSORS_LTC3815 is not set
CONFIG_SENSORS_MAX15301=m
# CONFIG_SENSORS_MAX16064 is not set
CONFIG_SENSORS_MAX16601=m
CONFIG_SENSORS_MAX20730=m
CONFIG_SENSORS_MAX20751=m
CONFIG_SENSORS_MAX31785=m
CONFIG_SENSORS_MAX34440=m
CONFIG_SENSORS_MAX8688=m
CONFIG_SENSORS_MP2888=m
CONFIG_SENSORS_MP2975=m
# CONFIG_SENSORS_MP5023 is not set
CONFIG_SENSORS_PIM4328=m
CONFIG_SENSORS_PLI1209BC=m
# CONFIG_SENSORS_PLI1209BC_REGULATOR is not set
CONFIG_SENSORS_PM6764TR=m
CONFIG_SENSORS_PXE1610=m
# CONFIG_SENSORS_Q54SJ108A2 is not set
CONFIG_SENSORS_STPDDC60=m
# CONFIG_SENSORS_TPS40422 is not set
CONFIG_SENSORS_TPS53679=m
# CONFIG_SENSORS_TPS546D24 is not set
CONFIG_SENSORS_UCD9000=m
CONFIG_SENSORS_UCD9200=m
CONFIG_SENSORS_XDPE152=m
CONFIG_SENSORS_XDPE122=m
CONFIG_SENSORS_XDPE122_REGULATOR=y
# CONFIG_SENSORS_ZL6100 is not set
CONFIG_SENSORS_PWM_FAN=y
CONFIG_SENSORS_RASPBERRYPI_HWMON=m
# CONFIG_SENSORS_SL28CPLD is not set
# CONFIG_SENSORS_SBTSI is not set
CONFIG_SENSORS_SBRMI=m
CONFIG_SENSORS_SHT15=y
CONFIG_SENSORS_SHT21=m
CONFIG_SENSORS_SHT3x=m
CONFIG_SENSORS_SHT4x=m
# CONFIG_SENSORS_SHTC1 is not set
# CONFIG_SENSORS_DME1737 is not set
CONFIG_SENSORS_EMC1403=m
# CONFIG_SENSORS_EMC2103 is not set
CONFIG_SENSORS_EMC2305=m
CONFIG_SENSORS_EMC6W201=m
CONFIG_SENSORS_SMSC47M1=m
# CONFIG_SENSORS_SMSC47M192 is not set
CONFIG_SENSORS_SMSC47B397=y
CONFIG_SENSORS_SCH56XX_COMMON=y
CONFIG_SENSORS_SCH5627=y
# CONFIG_SENSORS_SCH5636 is not set
# CONFIG_SENSORS_STTS751 is not set
# CONFIG_SENSORS_SMM665 is not set
CONFIG_SENSORS_ADC128D818=m
CONFIG_SENSORS_ADS7828=m
CONFIG_SENSORS_AMC6821=m
# CONFIG_SENSORS_INA209 is not set
CONFIG_SENSORS_INA2XX=m
CONFIG_SENSORS_INA238=m
CONFIG_SENSORS_INA3221=m
# CONFIG_SENSORS_TC74 is not set
# CONFIG_SENSORS_THMC50 is not set
CONFIG_SENSORS_TMP102=m
CONFIG_SENSORS_TMP103=m
CONFIG_SENSORS_TMP108=m
CONFIG_SENSORS_TMP401=m
# CONFIG_SENSORS_TMP421 is not set
CONFIG_SENSORS_TMP464=m
# CONFIG_SENSORS_TMP513 is not set
# CONFIG_SENSORS_VT1211 is not set
# CONFIG_SENSORS_W83773G is not set
CONFIG_SENSORS_W83781D=m
CONFIG_SENSORS_W83791D=m
# CONFIG_SENSORS_W83792D is not set
CONFIG_SENSORS_W83793=m
CONFIG_SENSORS_W83795=m
CONFIG_SENSORS_W83795_FANCTRL=y
# CONFIG_SENSORS_W83L785TS is not set
CONFIG_SENSORS_W83L786NG=m
CONFIG_SENSORS_W83627HF=y
# CONFIG_SENSORS_W83627EHF is not set
CONFIG_THERMAL=y
# CONFIG_THERMAL_STATISTICS is not set
CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=0
# CONFIG_THERMAL_HWMON is not set
CONFIG_THERMAL_OF=y
# CONFIG_THERMAL_WRITABLE_TRIPS is not set
CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=y
# CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
# CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
# CONFIG_THERMAL_GOV_FAIR_SHARE is not set
CONFIG_THERMAL_GOV_STEP_WISE=y
CONFIG_THERMAL_GOV_BANG_BANG=y
CONFIG_THERMAL_GOV_USER_SPACE=y
CONFIG_CPU_THERMAL=y
CONFIG_DEVFREQ_THERMAL=y
CONFIG_THERMAL_EMULATION=y
CONFIG_THERMAL_MMIO=m
# CONFIG_HISI_THERMAL is not set
CONFIG_IMX_THERMAL=m
CONFIG_IMX8MM_THERMAL=y
CONFIG_K3_THERMAL=m
CONFIG_QORIQ_THERMAL=y
CONFIG_SPEAR_THERMAL=y
# CONFIG_SUN8I_THERMAL is not set
CONFIG_ROCKCHIP_THERMAL=y
CONFIG_RCAR_THERMAL=y
# CONFIG_RCAR_GEN3_THERMAL is not set
CONFIG_RZG2L_THERMAL=m
CONFIG_KIRKWOOD_THERMAL=y
# CONFIG_DOVE_THERMAL is not set
# CONFIG_ARMADA_THERMAL is not set
# CONFIG_DA9062_THERMAL is not set
CONFIG_MTK_THERMAL=m

#
# Intel thermal drivers
#

#
# ACPI INT340X thermal drivers
#
# end of ACPI INT340X thermal drivers
# end of Intel thermal drivers

#
# Broadcom thermal drivers
#
# CONFIG_BCM2711_THERMAL is not set
# CONFIG_BCM2835_THERMAL is not set
CONFIG_BRCMSTB_THERMAL=m
CONFIG_BCM_NS_THERMAL=y
# CONFIG_BCM_SR_THERMAL is not set
# end of Broadcom thermal drivers

#
# Texas Instruments thermal drivers
#
CONFIG_TI_SOC_THERMAL=y
CONFIG_TI_THERMAL=y
# CONFIG_OMAP3_THERMAL is not set
# CONFIG_OMAP4_THERMAL is not set
# CONFIG_OMAP5_THERMAL is not set
# CONFIG_DRA752_THERMAL is not set
# end of Texas Instruments thermal drivers

#
# Samsung thermal drivers
#
# CONFIG_EXYNOS_THERMAL is not set
# end of Samsung thermal drivers

#
# NVIDIA Tegra thermal drivers
#
CONFIG_TEGRA_SOCTHERM=y
# CONFIG_TEGRA_BPMP_THERMAL is not set
CONFIG_TEGRA30_TSENSOR=y
# end of NVIDIA Tegra thermal drivers

CONFIG_GENERIC_ADC_THERMAL=m

#
# Qualcomm thermal drivers
#
# CONFIG_QCOM_TSENS is not set
CONFIG_QCOM_SPMI_ADC_TM5=m
CONFIG_QCOM_SPMI_TEMP_ALARM=m
# end of Qualcomm thermal drivers

CONFIG_UNIPHIER_THERMAL=m
CONFIG_SPRD_THERMAL=m
CONFIG_KHADAS_MCU_FAN_THERMAL=m
CONFIG_WATCHDOG=y
CONFIG_WATCHDOG_CORE=y
# CONFIG_WATCHDOG_NOWAYOUT is not set
# CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED is not set
CONFIG_WATCHDOG_OPEN_TIMEOUT=0
# CONFIG_WATCHDOG_SYSFS is not set
# CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT is not set

#
# Watchdog Pretimeout Governors
#
CONFIG_WATCHDOG_PRETIMEOUT_GOV=y
CONFIG_WATCHDOG_PRETIMEOUT_GOV_SEL=m
CONFIG_WATCHDOG_PRETIMEOUT_GOV_NOOP=y
CONFIG_WATCHDOG_PRETIMEOUT_GOV_PANIC=y
CONFIG_WATCHDOG_PRETIMEOUT_DEFAULT_GOV_NOOP=y
# CONFIG_WATCHDOG_PRETIMEOUT_DEFAULT_GOV_PANIC is not set

#
# Watchdog Device Drivers
#
CONFIG_SOFT_WATCHDOG=y
# CONFIG_SOFT_WATCHDOG_PRETIMEOUT is not set
# CONFIG_DA9052_WATCHDOG is not set
CONFIG_DA9055_WATCHDOG=m
CONFIG_DA9063_WATCHDOG=m
CONFIG_DA9062_WATCHDOG=m
CONFIG_GPIO_WATCHDOG=m
CONFIG_MENF21BMC_WATCHDOG=m
CONFIG_MENZ069_WATCHDOG=m
# CONFIG_XILINX_WATCHDOG is not set
CONFIG_ZIIRAVE_WATCHDOG=m
# CONFIG_RAVE_SP_WATCHDOG is not set
CONFIG_SL28CPLD_WATCHDOG=m
CONFIG_ARMADA_37XX_WATCHDOG=y
# CONFIG_ASM9260_WATCHDOG is not set
CONFIG_AT91RM9200_WATCHDOG=m
CONFIG_AT91SAM9X_WATCHDOG=m
# CONFIG_SAMA5D4_WATCHDOG is not set
CONFIG_CADENCE_WATCHDOG=m
CONFIG_FTWDT010_WATCHDOG=m
# CONFIG_S3C2410_WATCHDOG is not set
CONFIG_DW_WATCHDOG=m
CONFIG_EP93XX_WATCHDOG=m
# CONFIG_OMAP_WATCHDOG is not set
CONFIG_PNX4008_WATCHDOG=m
CONFIG_DAVINCI_WATCHDOG=y
CONFIG_K3_RTI_WATCHDOG=m
# CONFIG_RN5T618_WATCHDOG is not set
CONFIG_SUNXI_WATCHDOG=y
CONFIG_NPCM7XX_WATCHDOG=m
# CONFIG_STMP3XXX_RTC_WATCHDOG is not set
CONFIG_TS4800_WATCHDOG=y
CONFIG_TS72XX_WATCHDOG=y
CONFIG_MAX63XX_WATCHDOG=y
CONFIG_MAX77620_WATCHDOG=m
# CONFIG_IMX2_WDT is not set
CONFIG_IMX7ULP_WDT=m
CONFIG_RETU_WATCHDOG=m
CONFIG_MOXART_WDT=m
CONFIG_ST_LPC_WATCHDOG=m
CONFIG_TEGRA_WATCHDOG=y
CONFIG_QCOM_WDT=m
CONFIG_MESON_GXBB_WATCHDOG=m
CONFIG_MESON_WATCHDOG=m
CONFIG_MEDIATEK_WATCHDOG=m
CONFIG_DIGICOLOR_WATCHDOG=m
CONFIG_LPC18XX_WATCHDOG=y
# CONFIG_RENESAS_WDT is not set
# CONFIG_RENESAS_RZAWDT is not set
CONFIG_RENESAS_RZN1WDT=y
# CONFIG_RENESAS_RZG2LWDT is not set
# CONFIG_ASPEED_WATCHDOG is not set
# CONFIG_UNIPHIER_WATCHDOG is not set
CONFIG_RTD119X_WATCHDOG=y
# CONFIG_SPRD_WATCHDOG is not set
# CONFIG_PM8916_WATCHDOG is not set
CONFIG_VISCONTI_WATCHDOG=m
CONFIG_MSC313E_WATCHDOG=m
CONFIG_APPLE_WATCHDOG=y
# CONFIG_SUNPLUS_WATCHDOG is not set
# CONFIG_SC520_WDT is not set
CONFIG_KEMPLD_WDT=m
# CONFIG_BCM47XX_WDT is not set
# CONFIG_BCM2835_WDT is not set
# CONFIG_BCM_KONA_WDT is not set
# CONFIG_BCM7038_WDT is not set
CONFIG_IMGPDC_WDT=m
# CONFIG_MPC5200_WDT is not set
# CONFIG_MEN_A21_WDT is not set
CONFIG_UML_WATCHDOG=y

#
# USB-based Watchdog Cards
#
# CONFIG_USBPCWATCHDOG is not set

#
# Multifunction device drivers
#
CONFIG_MFD_CORE=y
CONFIG_MFD_ACT8945A=m
CONFIG_MFD_SUN4I_GPADC=y
CONFIG_MFD_SMPRO=m
# CONFIG_MFD_AT91_USART is not set
# CONFIG_MFD_ATMEL_FLEXCOM is not set
CONFIG_MFD_ATMEL_HLCDC=m
CONFIG_MFD_ATMEL_SMC=y
CONFIG_MFD_BCM590XX=m
# CONFIG_MFD_BD9571MWV is not set
# CONFIG_MFD_AXP20X_I2C is not set
CONFIG_MFD_MADERA=m
# CONFIG_MFD_MADERA_I2C is not set
# CONFIG_MFD_CS47L15 is not set
CONFIG_MFD_CS47L35=y
CONFIG_MFD_CS47L85=y
# CONFIG_MFD_CS47L90 is not set
CONFIG_MFD_CS47L92=y
# CONFIG_MFD_ASIC3 is not set
CONFIG_MFD_DA9062=m
CONFIG_MFD_DA9063=m
CONFIG_MFD_DA9150=m
# CONFIG_MFD_DLN2 is not set
CONFIG_MFD_ENE_KB3930=m
# CONFIG_MFD_EXYNOS_LPASS is not set
# CONFIG_MFD_GATEWORKS_GSC is not set
CONFIG_MFD_MC13XXX=m
CONFIG_MFD_MC13XXX_I2C=m
# CONFIG_MFD_MP2629 is not set
CONFIG_MFD_MXS_LRADC=y
# CONFIG_MFD_MX25_TSADC is not set
CONFIG_MFD_HI6421_PMIC=y
# CONFIG_MFD_HI6421_SPMI is not set
# CONFIG_MFD_HI655X_PMIC is not set
# CONFIG_HTC_PASIC3 is not set
CONFIG_MFD_IQS62X=m
CONFIG_MFD_KEMPLD=m
CONFIG_MFD_88PM800=m
CONFIG_MFD_88PM805=m
CONFIG_MFD_MAX14577=m
CONFIG_MFD_MAX77650=m
CONFIG_MFD_MAX77686=m
CONFIG_MFD_MAX77693=m
CONFIG_MFD_MAX77714=m
# CONFIG_MFD_MAX8907 is not set
CONFIG_MFD_MT6360=m
CONFIG_MFD_MT6370=m
# CONFIG_MFD_MT6397 is not set
# CONFIG_MFD_MENF21BMC is not set
CONFIG_MFD_VIPERBOARD=y
# CONFIG_MFD_NTXEC is not set
CONFIG_MFD_RETU=m
# CONFIG_MFD_PCF50633 is not set
# CONFIG_MFD_PM8XXX is not set
CONFIG_MFD_SPMI_PMIC=m
# CONFIG_MFD_SY7636A is not set
CONFIG_MFD_RT4831=m
CONFIG_MFD_RT5033=m
CONFIG_MFD_RT5120=m
# CONFIG_MFD_RK808 is not set
CONFIG_MFD_RN5T618=m
CONFIG_MFD_SI476X_CORE=m
CONFIG_MFD_SIMPLE_MFD_I2C=m
CONFIG_MFD_SL28CPLD=m
CONFIG_MFD_SKY81452=m
# CONFIG_ABX500_CORE is not set
CONFIG_MFD_SUN6I_PRCM=y
CONFIG_MFD_SYSCON=y
CONFIG_MFD_TI_AM335X_TSCADC=y
CONFIG_MFD_LP3943=m
CONFIG_MFD_TI_LMU=m
CONFIG_TPS6105X=m
CONFIG_TPS65010=m
CONFIG_TPS6507X=m
CONFIG_MFD_TPS65086=m
# CONFIG_MFD_TPS65217 is not set
# CONFIG_MFD_TI_LP873X is not set
# CONFIG_MFD_TI_LP87565 is not set
# CONFIG_MFD_TPS65218 is not set
# CONFIG_MFD_TPS65219 is not set
# CONFIG_MFD_TPS65912_I2C is not set
CONFIG_MFD_WL1273_CORE=m
CONFIG_MFD_LM3533=m
# CONFIG_MFD_TQMX86 is not set
# CONFIG_MFD_ARIZONA_I2C is not set
CONFIG_MFD_WM8994=m
# CONFIG_MFD_STW481X is not set
CONFIG_MFD_STM32_LPTIMER=y
CONFIG_MFD_STM32_TIMERS=y
# CONFIG_MFD_STMFX is not set
# CONFIG_MFD_ATC260X_I2C is not set
CONFIG_MFD_KHADAS_MCU=m
# CONFIG_MFD_ACER_A500_EC is not set
# CONFIG_MFD_QCOM_PM8008 is not set
CONFIG_RAVE_SP_CORE=y
CONFIG_MFD_RSMU_I2C=m
# end of Multifunction device drivers

CONFIG_REGULATOR=y
# CONFIG_REGULATOR_DEBUG is not set
CONFIG_REGULATOR_FIXED_VOLTAGE=y
# CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
CONFIG_REGULATOR_USERSPACE_CONSUMER=y
CONFIG_REGULATOR_88PG86X=m
# CONFIG_REGULATOR_88PM800 is not set
CONFIG_REGULATOR_ACT8865=m
# CONFIG_REGULATOR_ACT8945A is not set
CONFIG_REGULATOR_AD5398=m
CONFIG_REGULATOR_ANATOP=y
CONFIG_REGULATOR_BCM590XX=m
CONFIG_REGULATOR_DA9062=m
CONFIG_REGULATOR_DA9063=m
CONFIG_REGULATOR_DA9121=m
CONFIG_REGULATOR_DA9210=m
CONFIG_REGULATOR_DA9211=m
CONFIG_REGULATOR_FAN53555=m
CONFIG_REGULATOR_FAN53880=m
CONFIG_REGULATOR_GPIO=m
CONFIG_REGULATOR_HI6421=m
CONFIG_REGULATOR_HI6421V530=m
CONFIG_REGULATOR_ISL9305=m
CONFIG_REGULATOR_ISL6271A=m
CONFIG_REGULATOR_LM363X=m
CONFIG_REGULATOR_LP3971=m
CONFIG_REGULATOR_LP3972=m
CONFIG_REGULATOR_LP872X=m
# CONFIG_REGULATOR_LP8755 is not set
CONFIG_REGULATOR_LTC3589=m
CONFIG_REGULATOR_LTC3676=m
# CONFIG_REGULATOR_MAX14577 is not set
# CONFIG_REGULATOR_MAX1586 is not set
# CONFIG_REGULATOR_MAX77620 is not set
# CONFIG_REGULATOR_MAX77650 is not set
CONFIG_REGULATOR_MAX8649=m
# CONFIG_REGULATOR_MAX8660 is not set
CONFIG_REGULATOR_MAX8893=m
CONFIG_REGULATOR_MAX8907=m
# CONFIG_REGULATOR_MAX8952 is not set
# CONFIG_REGULATOR_MAX8973 is not set
CONFIG_REGULATOR_MAX20086=m
# CONFIG_REGULATOR_MAX77686 is not set
# CONFIG_REGULATOR_MAX77693 is not set
# CONFIG_REGULATOR_MAX77802 is not set
# CONFIG_REGULATOR_MAX77826 is not set
CONFIG_REGULATOR_MC13XXX_CORE=m
CONFIG_REGULATOR_MC13783=m
CONFIG_REGULATOR_MC13892=m
CONFIG_REGULATOR_MCP16502=m
# CONFIG_REGULATOR_MP5416 is not set
CONFIG_REGULATOR_MP8859=m
# CONFIG_REGULATOR_MP886X is not set
CONFIG_REGULATOR_MPQ7920=m
CONFIG_REGULATOR_MT6311=m
CONFIG_REGULATOR_MT6315=m
CONFIG_REGULATOR_MT6360=m
CONFIG_REGULATOR_MT6370=m
CONFIG_REGULATOR_MT6380=m
# CONFIG_REGULATOR_PBIAS is not set
CONFIG_REGULATOR_PCA9450=m
CONFIG_REGULATOR_PF8X00=m
CONFIG_REGULATOR_PFUZE100=m
CONFIG_REGULATOR_PV88060=m
CONFIG_REGULATOR_PV88080=m
CONFIG_REGULATOR_PV88090=m
# CONFIG_REGULATOR_PWM is not set
CONFIG_REGULATOR_QCOM_RPMH=y
CONFIG_REGULATOR_QCOM_SPMI=m
# CONFIG_REGULATOR_QCOM_USB_VBUS is not set
CONFIG_REGULATOR_RASPBERRYPI_TOUCHSCREEN_ATTINY=m
# CONFIG_REGULATOR_RN5T618 is not set
CONFIG_REGULATOR_RT4801=m
# CONFIG_REGULATOR_RT4831 is not set
CONFIG_REGULATOR_RT5033=m
# CONFIG_REGULATOR_RT5120 is not set
CONFIG_REGULATOR_RT5190A=m
CONFIG_REGULATOR_RT5759=m
CONFIG_REGULATOR_RT6160=m
CONFIG_REGULATOR_RT6190=m
CONFIG_REGULATOR_RT6245=m
CONFIG_REGULATOR_RTQ2134=m
CONFIG_REGULATOR_RTMV20=m
CONFIG_REGULATOR_RTQ6752=m
# CONFIG_REGULATOR_S2MPA01 is not set
# CONFIG_REGULATOR_S2MPS11 is not set
CONFIG_REGULATOR_S5M8767=m
CONFIG_REGULATOR_SC2731=m
CONFIG_REGULATOR_SKY81452=m
CONFIG_REGULATOR_SLG51000=m
CONFIG_REGULATOR_STM32_BOOSTER=m
CONFIG_REGULATOR_STM32_VREFBUF=y
CONFIG_REGULATOR_STM32_PWR=y
# CONFIG_REGULATOR_TI_ABB is not set
# CONFIG_REGULATOR_STW481X_VMMC is not set
CONFIG_REGULATOR_SY8106A=m
CONFIG_REGULATOR_SY8824X=m
CONFIG_REGULATOR_SY8827N=m
CONFIG_REGULATOR_TPS51632=m
# CONFIG_REGULATOR_TPS6105X is not set
CONFIG_REGULATOR_TPS62360=m
# CONFIG_REGULATOR_TPS6286X is not set
CONFIG_REGULATOR_TPS65023=m
CONFIG_REGULATOR_TPS6507X=m
CONFIG_REGULATOR_TPS65086=m
CONFIG_REGULATOR_TPS65132=m
CONFIG_REGULATOR_TPS68470=m
# CONFIG_REGULATOR_UNIPHIER is not set
CONFIG_REGULATOR_VCTRL=y
CONFIG_REGULATOR_WM8994=m
CONFIG_REGULATOR_QCOM_LABIBB=m
# CONFIG_RC_CORE is not set
CONFIG_CEC_CORE=y
CONFIG_CEC_NOTIFIER=y

#
# CEC support
#
CONFIG_MEDIA_CEC_SUPPORT=y
CONFIG_CEC_CH7322=m
# CONFIG_CEC_MESON_AO is not set
# CONFIG_CEC_GPIO is not set
# CONFIG_CEC_SAMSUNG_S5P is not set
# CONFIG_CEC_STI is not set
# CONFIG_CEC_STM32 is not set
CONFIG_CEC_TEGRA=m
CONFIG_USB_PULSE8_CEC=y
# CONFIG_USB_RAINSHADOW_CEC is not set
# end of CEC support

CONFIG_MEDIA_SUPPORT=m
CONFIG_MEDIA_SUPPORT_FILTER=y
CONFIG_MEDIA_SUBDRV_AUTOSELECT=y

#
# Media device types
#
CONFIG_MEDIA_CAMERA_SUPPORT=y
CONFIG_MEDIA_ANALOG_TV_SUPPORT=y
CONFIG_MEDIA_DIGITAL_TV_SUPPORT=y
# CONFIG_MEDIA_RADIO_SUPPORT is not set
# CONFIG_MEDIA_SDR_SUPPORT is not set
CONFIG_MEDIA_PLATFORM_SUPPORT=y
# CONFIG_MEDIA_TEST_SUPPORT is not set
# end of Media device types

CONFIG_VIDEO_DEV=m
CONFIG_MEDIA_CONTROLLER=y
CONFIG_DVB_CORE=m

#
# Video4Linux options
#
CONFIG_VIDEO_V4L2_I2C=y
CONFIG_VIDEO_V4L2_SUBDEV_API=y
CONFIG_VIDEO_ADV_DEBUG=y
# CONFIG_VIDEO_FIXED_MINOR_RANGES is not set
# CONFIG_V4L2_FLASH_LED_CLASS is not set
CONFIG_V4L2_FWNODE=m
CONFIG_V4L2_ASYNC=m
# end of Video4Linux options

#
# Media controller options
#
# CONFIG_MEDIA_CONTROLLER_DVB is not set
# end of Media controller options

#
# Digital TV options
#
# CONFIG_DVB_MMAP is not set
CONFIG_DVB_MAX_ADAPTERS=16
CONFIG_DVB_DYNAMIC_MINORS=y
# CONFIG_DVB_DEMUX_SECTION_LOSS_LOG is not set
# CONFIG_DVB_ULE_DEBUG is not set
# end of Digital TV options

#
# Media drivers
#

#
# Drivers filtered as selected at 'Filter media drivers'
#

#
# Media drivers
#
# CONFIG_MEDIA_USB_SUPPORT is not set
# CONFIG_MEDIA_PLATFORM_DRIVERS is not set

#
# FireWire (IEEE 1394) Adapters
#
CONFIG_DVB_FIREDTV=m
CONFIG_DVB_FIREDTV_INPUT=y
CONFIG_VIDEOBUF2_CORE=m
CONFIG_VIDEOBUF2_V4L2=m
CONFIG_VIDEOBUF2_MEMOPS=m
CONFIG_VIDEOBUF2_VMALLOC=m
# end of Media drivers

#
# Media ancillary drivers
#
CONFIG_MEDIA_ATTACH=y

#
# Camera sensor devices
#
CONFIG_VIDEO_APTINA_PLL=m
CONFIG_VIDEO_AR0521=m
# CONFIG_VIDEO_HI556 is not set
# CONFIG_VIDEO_HI846 is not set
CONFIG_VIDEO_HI847=m
# CONFIG_VIDEO_IMX208 is not set
CONFIG_VIDEO_IMX214=m
CONFIG_VIDEO_IMX219=m
CONFIG_VIDEO_IMX258=m
CONFIG_VIDEO_IMX274=m
# CONFIG_VIDEO_IMX290 is not set
CONFIG_VIDEO_IMX319=m
CONFIG_VIDEO_IMX334=m
CONFIG_VIDEO_IMX335=m
# CONFIG_VIDEO_IMX355 is not set
# CONFIG_VIDEO_IMX412 is not set
CONFIG_VIDEO_MAX9271_LIB=m
# CONFIG_VIDEO_MT9M001 is not set
CONFIG_VIDEO_MT9M032=m
# CONFIG_VIDEO_MT9M111 is not set
CONFIG_VIDEO_MT9P031=m
# CONFIG_VIDEO_MT9T001 is not set
CONFIG_VIDEO_MT9T112=m
CONFIG_VIDEO_MT9V011=m
CONFIG_VIDEO_MT9V032=m
CONFIG_VIDEO_MT9V111=m
CONFIG_VIDEO_NOON010PC30=m
# CONFIG_VIDEO_OG01A1B is not set
CONFIG_VIDEO_OV02A10=m
CONFIG_VIDEO_OV08D10=m
CONFIG_VIDEO_OV08X40=m
CONFIG_VIDEO_OV13858=m
# CONFIG_VIDEO_OV13B10 is not set
CONFIG_VIDEO_OV2640=m
CONFIG_VIDEO_OV2659=m
# CONFIG_VIDEO_OV2680 is not set
# CONFIG_VIDEO_OV2685 is not set
CONFIG_VIDEO_OV2740=m
CONFIG_VIDEO_OV4689=m
CONFIG_VIDEO_OV5640=m
# CONFIG_VIDEO_OV5645 is not set
# CONFIG_VIDEO_OV5647 is not set
# CONFIG_VIDEO_OV5670 is not set
# CONFIG_VIDEO_OV5675 is not set
# CONFIG_VIDEO_OV5693 is not set
CONFIG_VIDEO_OV5695=m
CONFIG_VIDEO_OV6650=m
CONFIG_VIDEO_OV7251=m
CONFIG_VIDEO_OV7640=m
CONFIG_VIDEO_OV7670=m
CONFIG_VIDEO_OV772X=m
CONFIG_VIDEO_OV7740=m
CONFIG_VIDEO_OV8856=m
CONFIG_VIDEO_OV9282=m
CONFIG_VIDEO_OV9640=m
# CONFIG_VIDEO_OV9650 is not set
CONFIG_VIDEO_OV9734=m
CONFIG_VIDEO_RDACM20=m
CONFIG_VIDEO_RDACM21=m
CONFIG_VIDEO_RJ54N1=m
# CONFIG_VIDEO_S5K5BAF is not set
# CONFIG_VIDEO_S5K6A3 is not set
# CONFIG_VIDEO_S5K6AA is not set
# CONFIG_VIDEO_SR030PC30 is not set
CONFIG_VIDEO_ST_VGXY61=m
CONFIG_VIDEO_VS6624=m
# CONFIG_VIDEO_ET8EK8 is not set
# CONFIG_VIDEO_M5MOLS is not set
# end of Camera sensor devices

#
# Lens drivers
#
CONFIG_VIDEO_AD5820=m
CONFIG_VIDEO_AK7375=m
CONFIG_VIDEO_DW9714=m
CONFIG_VIDEO_DW9768=m
CONFIG_VIDEO_DW9807_VCM=m
# end of Lens drivers

#
# Flash devices
#
# CONFIG_VIDEO_ADP1653 is not set
CONFIG_VIDEO_LM3560=m
CONFIG_VIDEO_LM3646=m
# end of Flash devices

#
# Audio decoders, processors and mixers
#
CONFIG_VIDEO_CS3308=m
CONFIG_VIDEO_CS5345=m
# CONFIG_VIDEO_CS53L32A is not set
CONFIG_VIDEO_MSP3400=m
CONFIG_VIDEO_SONY_BTF_MPX=m
CONFIG_VIDEO_TDA7432=m
# CONFIG_VIDEO_TDA9840 is not set
CONFIG_VIDEO_TEA6415C=m
CONFIG_VIDEO_TEA6420=m
CONFIG_VIDEO_TLV320AIC23B=m
CONFIG_VIDEO_TVAUDIO=m
CONFIG_VIDEO_UDA1342=m
# CONFIG_VIDEO_VP27SMPX is not set
CONFIG_VIDEO_WM8739=m
CONFIG_VIDEO_WM8775=m
# end of Audio decoders, processors and mixers

#
# RDS decoders
#
CONFIG_VIDEO_SAA6588=m
# end of RDS decoders

#
# Video decoders
#
CONFIG_VIDEO_ADV7180=m
# CONFIG_VIDEO_ADV7183 is not set
# CONFIG_VIDEO_ADV748X is not set
CONFIG_VIDEO_ADV7604=m
# CONFIG_VIDEO_ADV7604_CEC is not set
# CONFIG_VIDEO_ADV7842 is not set
CONFIG_VIDEO_BT819=m
# CONFIG_VIDEO_BT856 is not set
CONFIG_VIDEO_BT866=m
CONFIG_VIDEO_ISL7998X=m
CONFIG_VIDEO_KS0127=m
CONFIG_VIDEO_MAX9286=m
CONFIG_VIDEO_ML86V7667=m
# CONFIG_VIDEO_SAA7110 is not set
# CONFIG_VIDEO_SAA711X is not set
CONFIG_VIDEO_TC358743=m
# CONFIG_VIDEO_TC358743_CEC is not set
# CONFIG_VIDEO_TVP514X is not set
# CONFIG_VIDEO_TVP5150 is not set
CONFIG_VIDEO_TVP7002=m
CONFIG_VIDEO_TW2804=m
CONFIG_VIDEO_TW9903=m
CONFIG_VIDEO_TW9906=m
CONFIG_VIDEO_TW9910=m
CONFIG_VIDEO_VPX3220=m

#
# Video and audio decoders
#
CONFIG_VIDEO_SAA717X=m
CONFIG_VIDEO_CX25840=m
# end of Video decoders

#
# Video encoders
#
CONFIG_VIDEO_AD9389B=m
CONFIG_VIDEO_ADV7170=m
# CONFIG_VIDEO_ADV7175 is not set
CONFIG_VIDEO_ADV7343=m
CONFIG_VIDEO_ADV7393=m
CONFIG_VIDEO_ADV7511=m
CONFIG_VIDEO_ADV7511_CEC=y
# CONFIG_VIDEO_AK881X is not set
# CONFIG_VIDEO_SAA7127 is not set
CONFIG_VIDEO_SAA7185=m
# CONFIG_VIDEO_THS8200 is not set
# end of Video encoders

#
# Video improvement chips
#
CONFIG_VIDEO_UPD64031A=m
# CONFIG_VIDEO_UPD64083 is not set
# end of Video improvement chips

#
# Audio/Video compression chips
#
# CONFIG_VIDEO_SAA6752HS is not set
# end of Audio/Video compression chips

#
# SDR tuner chips
#
# end of SDR tuner chips

#
# Miscellaneous helper chips
#
CONFIG_VIDEO_I2C=m
# CONFIG_VIDEO_M52790 is not set
CONFIG_VIDEO_ST_MIPID02=m
CONFIG_VIDEO_THS7303=m
# end of Miscellaneous helper chips

CONFIG_MEDIA_TUNER=m

#
# Customize TV tuners
#
# CONFIG_MEDIA_TUNER_E4000 is not set
CONFIG_MEDIA_TUNER_FC0011=m
CONFIG_MEDIA_TUNER_FC0012=m
CONFIG_MEDIA_TUNER_FC0013=m
CONFIG_MEDIA_TUNER_FC2580=m
CONFIG_MEDIA_TUNER_IT913X=m
CONFIG_MEDIA_TUNER_M88RS6000T=m
CONFIG_MEDIA_TUNER_MAX2165=m
CONFIG_MEDIA_TUNER_MC44S803=m
CONFIG_MEDIA_TUNER_MT2060=m
CONFIG_MEDIA_TUNER_MT2063=m
CONFIG_MEDIA_TUNER_MT20XX=m
# CONFIG_MEDIA_TUNER_MT2131 is not set
CONFIG_MEDIA_TUNER_MT2266=m
# CONFIG_MEDIA_TUNER_MXL301RF is not set
CONFIG_MEDIA_TUNER_MXL5005S=m
CONFIG_MEDIA_TUNER_MXL5007T=m
# CONFIG_MEDIA_TUNER_QM1D1B0004 is not set
# CONFIG_MEDIA_TUNER_QM1D1C0042 is not set
# CONFIG_MEDIA_TUNER_QT1010 is not set
# CONFIG_MEDIA_TUNER_R820T is not set
CONFIG_MEDIA_TUNER_SI2157=m
CONFIG_MEDIA_TUNER_SIMPLE=m
CONFIG_MEDIA_TUNER_TDA18212=m
# CONFIG_MEDIA_TUNER_TDA18218 is not set
# CONFIG_MEDIA_TUNER_TDA18250 is not set
CONFIG_MEDIA_TUNER_TDA18271=m
CONFIG_MEDIA_TUNER_TDA827X=m
CONFIG_MEDIA_TUNER_TDA8290=m
CONFIG_MEDIA_TUNER_TDA9887=m
# CONFIG_MEDIA_TUNER_TEA5761 is not set
# CONFIG_MEDIA_TUNER_TEA5767 is not set
# CONFIG_MEDIA_TUNER_TUA9001 is not set
CONFIG_MEDIA_TUNER_XC2028=m
CONFIG_MEDIA_TUNER_XC4000=m
CONFIG_MEDIA_TUNER_XC5000=m
# end of Customize TV tuners

#
# Customise DVB Frontends
#

#
# Multistandard (satellite) frontends
#
# CONFIG_DVB_M88DS3103 is not set
# CONFIG_DVB_MXL5XX is not set
CONFIG_DVB_STB0899=m
CONFIG_DVB_STB6100=m
CONFIG_DVB_STV090x=m
# CONFIG_DVB_STV0910 is not set
# CONFIG_DVB_STV6110x is not set
CONFIG_DVB_STV6111=m

#
# Multistandard (cable + terrestrial) frontends
#
# CONFIG_DVB_DRXK is not set
CONFIG_DVB_MN88472=m
# CONFIG_DVB_MN88473 is not set
CONFIG_DVB_SI2165=m
CONFIG_DVB_TDA18271C2DD=m

#
# DVB-S (satellite) frontends
#
# CONFIG_DVB_CX24110 is not set
CONFIG_DVB_CX24116=m
CONFIG_DVB_CX24117=m
# CONFIG_DVB_CX24120 is not set
CONFIG_DVB_CX24123=m
CONFIG_DVB_DS3000=m
CONFIG_DVB_MB86A16=m
# CONFIG_DVB_MT312 is not set
CONFIG_DVB_S5H1420=m
CONFIG_DVB_SI21XX=m
CONFIG_DVB_STB6000=m
# CONFIG_DVB_STV0288 is not set
CONFIG_DVB_STV0299=m
CONFIG_DVB_STV0900=m
# CONFIG_DVB_STV6110 is not set
# CONFIG_DVB_TDA10071 is not set
CONFIG_DVB_TDA10086=m
CONFIG_DVB_TDA8083=m
CONFIG_DVB_TDA8261=m
CONFIG_DVB_TDA826X=m
# CONFIG_DVB_TS2020 is not set
# CONFIG_DVB_TUA6100 is not set
CONFIG_DVB_TUNER_CX24113=m
CONFIG_DVB_TUNER_ITD1000=m
# CONFIG_DVB_VES1X93 is not set
CONFIG_DVB_ZL10036=m
CONFIG_DVB_ZL10039=m

#
# DVB-T (terrestrial) frontends
#
CONFIG_DVB_AF9013=m
CONFIG_DVB_CX22700=m
# CONFIG_DVB_CX22702 is not set
CONFIG_DVB_CXD2820R=m
CONFIG_DVB_CXD2841ER=m
# CONFIG_DVB_DIB3000MB is not set
CONFIG_DVB_DIB3000MC=m
# CONFIG_DVB_DIB7000M is not set
# CONFIG_DVB_DIB7000P is not set
CONFIG_DVB_DIB9000=m
# CONFIG_DVB_DRXD is not set
CONFIG_DVB_EC100=m
CONFIG_DVB_L64781=m
# CONFIG_DVB_MT352 is not set
CONFIG_DVB_NXT6000=m
CONFIG_DVB_RTL2830=m
CONFIG_DVB_RTL2832=m
CONFIG_DVB_S5H1432=m
CONFIG_DVB_SI2168=m
# CONFIG_DVB_SP887X is not set
# CONFIG_DVB_STV0367 is not set
# CONFIG_DVB_TDA10048 is not set
# CONFIG_DVB_TDA1004X is not set
CONFIG_DVB_ZD1301_DEMOD=m
CONFIG_DVB_ZL10353=m

#
# DVB-C (cable) frontends
#
# CONFIG_DVB_STV0297 is not set
CONFIG_DVB_TDA10021=m
CONFIG_DVB_TDA10023=m
CONFIG_DVB_VES1820=m

#
# ATSC (North American/Korean Terrestrial/Cable DTV) frontends
#
CONFIG_DVB_AU8522=m
# CONFIG_DVB_AU8522_DTV is not set
CONFIG_DVB_AU8522_V4L=m
CONFIG_DVB_BCM3510=m
CONFIG_DVB_LG2160=m
CONFIG_DVB_LGDT3305=m
# CONFIG_DVB_LGDT3306A is not set
# CONFIG_DVB_LGDT330X is not set
# CONFIG_DVB_MXL692 is not set
CONFIG_DVB_NXT200X=m
# CONFIG_DVB_OR51132 is not set
CONFIG_DVB_OR51211=m
CONFIG_DVB_S5H1409=m
CONFIG_DVB_S5H1411=m

#
# ISDB-T (terrestrial) frontends
#
# CONFIG_DVB_DIB8000 is not set
# CONFIG_DVB_MB86A20S is not set
CONFIG_DVB_S921=m

#
# ISDB-S (satellite) & ISDB-T (terrestrial) frontends
#
CONFIG_DVB_MN88443X=m
CONFIG_DVB_TC90522=m

#
# Digital terrestrial only tuners/PLL
#
# CONFIG_DVB_PLL is not set
CONFIG_DVB_TUNER_DIB0070=m
CONFIG_DVB_TUNER_DIB0090=m

#
# SEC control devices for DVB-S
#
# CONFIG_DVB_A8293 is not set
# CONFIG_DVB_AF9033 is not set
CONFIG_DVB_ASCOT2E=m
# CONFIG_DVB_ATBM8830 is not set
CONFIG_DVB_HELENE=m
# CONFIG_DVB_HORUS3A is not set
CONFIG_DVB_ISL6405=m
CONFIG_DVB_ISL6421=m
CONFIG_DVB_ISL6423=m
# CONFIG_DVB_IX2505V is not set
CONFIG_DVB_LGS8GL5=m
# CONFIG_DVB_LGS8GXX is not set
# CONFIG_DVB_LNBH25 is not set
CONFIG_DVB_LNBH29=m
CONFIG_DVB_LNBP21=m
CONFIG_DVB_LNBP22=m
CONFIG_DVB_M88RS2000=m
CONFIG_DVB_TDA665x=m
# CONFIG_DVB_DRX39XYJ is not set

#
# Common Interface (EN50221) controller drivers
#
CONFIG_DVB_CXD2099=m
# CONFIG_DVB_SP2 is not set
# end of Customise DVB Frontends
# end of Media ancillary drivers

#
# Graphics support
#
CONFIG_IMX_IPUV3_CORE=y

#
# ARM devices
#
# end of ARM devices

#
# Frame buffer Devices
#
# CONFIG_FB is not set
# CONFIG_MMP_DISP is not set
# end of Frame buffer Devices

#
# Backlight & LCD device support
#
CONFIG_LCD_CLASS_DEVICE=y
# CONFIG_LCD_PLATFORM is not set
CONFIG_BACKLIGHT_CLASS_DEVICE=m
CONFIG_BACKLIGHT_KTD253=m
CONFIG_BACKLIGHT_LM3533=m
CONFIG_BACKLIGHT_OMAP1=m
CONFIG_BACKLIGHT_PWM=m
# CONFIG_BACKLIGHT_MT6370 is not set
CONFIG_BACKLIGHT_QCOM_WLED=m
# CONFIG_BACKLIGHT_RT4831 is not set
CONFIG_BACKLIGHT_ADP8860=m
CONFIG_BACKLIGHT_ADP8870=m
CONFIG_BACKLIGHT_LM3630A=m
CONFIG_BACKLIGHT_LM3639=m
CONFIG_BACKLIGHT_LP855X=m
# CONFIG_BACKLIGHT_SKY81452 is not set
# CONFIG_BACKLIGHT_GPIO is not set
CONFIG_BACKLIGHT_LV5207LP=m
CONFIG_BACKLIGHT_BD6107=m
# CONFIG_BACKLIGHT_ARCXCNN is not set
CONFIG_BACKLIGHT_RAVE_SP=m
CONFIG_BACKLIGHT_LED=m
# end of Backlight & LCD device support

CONFIG_HDMI=y

#
# Console display driver support
#
CONFIG_DUMMY_CONSOLE=y
CONFIG_DUMMY_CONSOLE_COLUMNS=80
CONFIG_DUMMY_CONSOLE_ROWS=25
# end of Console display driver support
# end of Graphics support

# CONFIG_SOUND is not set

#
# HID support
#
CONFIG_HID=y
# CONFIG_HID_BATTERY_STRENGTH is not set
# CONFIG_HIDRAW is not set
# CONFIG_UHID is not set
CONFIG_HID_GENERIC=y

#
# Special HID drivers
#
# CONFIG_HID_A4TECH is not set
# CONFIG_HID_ACCUTOUCH is not set
# CONFIG_HID_ACRUX is not set
# CONFIG_HID_APPLE is not set
# CONFIG_HID_APPLEIR is not set
# CONFIG_HID_ASUS is not set
# CONFIG_HID_AUREAL is not set
# CONFIG_HID_BELKIN is not set
# CONFIG_HID_BETOP_FF is not set
# CONFIG_HID_BIGBEN_FF is not set
# CONFIG_HID_CHERRY is not set
# CONFIG_HID_CHICONY is not set
# CONFIG_HID_CORSAIR is not set
# CONFIG_HID_COUGAR is not set
# CONFIG_HID_MACALLY is not set
# CONFIG_HID_CMEDIA is not set
# CONFIG_HID_CREATIVE_SB0540 is not set
# CONFIG_HID_CYPRESS is not set
# CONFIG_HID_DRAGONRISE is not set
# CONFIG_HID_EMS_FF is not set
# CONFIG_HID_ELAN is not set
# CONFIG_HID_ELECOM is not set
# CONFIG_HID_ELO is not set
# CONFIG_HID_EZKEY is not set
# CONFIG_HID_GEMBIRD is not set
# CONFIG_HID_GFRM is not set
# CONFIG_HID_GLORIOUS is not set
# CONFIG_HID_HOLTEK is not set
# CONFIG_HID_VIVALDI is not set
# CONFIG_HID_GT683R is not set
# CONFIG_HID_KEYTOUCH is not set
# CONFIG_HID_KYE is not set
# CONFIG_HID_UCLOGIC is not set
# CONFIG_HID_WALTOP is not set
# CONFIG_HID_VIEWSONIC is not set
# CONFIG_HID_VRC2 is not set
# CONFIG_HID_XIAOMI is not set
# CONFIG_HID_GYRATION is not set
# CONFIG_HID_ICADE is not set
# CONFIG_HID_ITE is not set
# CONFIG_HID_JABRA is not set
# CONFIG_HID_TWINHAN is not set
# CONFIG_HID_KENSINGTON is not set
# CONFIG_HID_LCPOWER is not set
# CONFIG_HID_LED is not set
# CONFIG_HID_LENOVO is not set
# CONFIG_HID_LETSKETCH is not set
# CONFIG_HID_LOGITECH is not set
# CONFIG_HID_MAGICMOUSE is not set
# CONFIG_HID_MALTRON is not set
# CONFIG_HID_MAYFLASH is not set
# CONFIG_HID_MEGAWORLD_FF is not set
# CONFIG_HID_REDRAGON is not set
# CONFIG_HID_MICROSOFT is not set
# CONFIG_HID_MONTEREY is not set
# CONFIG_HID_MULTITOUCH is not set
# CONFIG_HID_NINTENDO is not set
# CONFIG_HID_NTI is not set
# CONFIG_HID_NTRIG is not set
# CONFIG_HID_ORTEK is not set
# CONFIG_HID_PANTHERLORD is not set
# CONFIG_HID_PENMOUNT is not set
# CONFIG_HID_PETALYNX is not set
# CONFIG_HID_PICOLCD is not set
# CONFIG_HID_PLANTRONICS is not set
# CONFIG_HID_PLAYSTATION is not set
# CONFIG_HID_PXRC is not set
# CONFIG_HID_RAZER is not set
# CONFIG_HID_PRIMAX is not set
# CONFIG_HID_RETRODE is not set
# CONFIG_HID_ROCCAT is not set
# CONFIG_HID_SAITEK is not set
# CONFIG_HID_SAMSUNG is not set
# CONFIG_HID_SEMITEK is not set
# CONFIG_HID_SIGMAMICRO is not set
# CONFIG_HID_SONY is not set
# CONFIG_HID_SPEEDLINK is not set
# CONFIG_HID_STEAM is not set
# CONFIG_HID_STEELSERIES is not set
# CONFIG_HID_SUNPLUS is not set
# CONFIG_HID_RMI is not set
# CONFIG_HID_GREENASIA is not set
# CONFIG_HID_SMARTJOYPLUS is not set
# CONFIG_HID_TIVO is not set
# CONFIG_HID_TOPSEED is not set
# CONFIG_HID_TOPRE is not set
# CONFIG_HID_THINGM is not set
# CONFIG_HID_THRUSTMASTER is not set
# CONFIG_HID_UDRAW_PS3 is not set
# CONFIG_HID_U2FZERO is not set
# CONFIG_HID_WACOM is not set
# CONFIG_HID_WIIMOTE is not set
# CONFIG_HID_XINMO is not set
# CONFIG_HID_ZEROPLUS is not set
# CONFIG_HID_ZYDACRON is not set
# CONFIG_HID_SENSOR_HUB is not set
# CONFIG_HID_ALPS is not set
# CONFIG_HID_MCP2221 is not set
# end of Special HID drivers

#
# USB HID support
#
CONFIG_USB_HID=y
# CONFIG_HID_PID is not set
# CONFIG_USB_HIDDEV is not set
# end of USB HID support

#
# I2C HID support
#
# CONFIG_I2C_HID_OF is not set
# CONFIG_I2C_HID_OF_ELAN is not set
# CONFIG_I2C_HID_OF_GOODIX is not set
# end of I2C HID support
# end of HID support

CONFIG_USB_OHCI_LITTLE_ENDIAN=y
CONFIG_USB_SUPPORT=y
CONFIG_USB_COMMON=y
CONFIG_USB_LED_TRIG=y
CONFIG_USB_ULPI_BUS=y
CONFIG_USB_CONN_GPIO=y
CONFIG_USB_ARCH_HAS_HCD=y
CONFIG_USB=y
# CONFIG_USB_ANNOUNCE_NEW_DEVICES is not set

#
# Miscellaneous USB options
#
# CONFIG_USB_DEFAULT_PERSIST is not set
# CONFIG_USB_FEW_INIT_RETRIES is not set
# CONFIG_USB_DYNAMIC_MINORS is not set
CONFIG_USB_OTG_PRODUCTLIST=y
# CONFIG_USB_OTG_DISABLE_EXTERNAL_HUB is not set
CONFIG_USB_LEDS_TRIGGER_USBPORT=y
CONFIG_USB_AUTOSUSPEND_DELAY=2
CONFIG_USB_MON=y

#
# USB Host Controller Drivers
#
# CONFIG_USB_C67X00_HCD is not set
# CONFIG_USB_BRCMSTB is not set
# CONFIG_USB_OXU210HP_HCD is not set
CONFIG_USB_ISP116X_HCD=m
# CONFIG_USB_ISP1362_HCD is not set
CONFIG_USB_U132_HCD=m
# CONFIG_USB_SL811_HCD is not set
# CONFIG_USB_R8A66597_HCD is not set
CONFIG_USB_HCD_TEST_MODE=y

#
# USB Device Class drivers
#
CONFIG_USB_ACM=y
CONFIG_USB_PRINTER=y
CONFIG_USB_WDM=m
CONFIG_USB_TMC=y

#
# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
#

#
# also be needed; see USB_STORAGE Help for more info
#

#
# USB Imaging devices
#
CONFIG_USB_MDC800=m

#
# USB dual-mode controller drivers
#
CONFIG_USB_MTU3=m
CONFIG_USB_MTU3_HOST=y
CONFIG_USB_MTU3_DEBUG=y
CONFIG_USB_MUSB_HDRC=m
CONFIG_USB_MUSB_HOST=y

#
# Platform Glue Layer
#
# CONFIG_USB_MUSB_TUSB6010 is not set
CONFIG_USB_MUSB_DSPS=m
CONFIG_USB_MUSB_UX500=m

#
# MUSB DMA mode
#
CONFIG_MUSB_PIO_ONLY=y
CONFIG_USB_ISP1760=m
CONFIG_USB_ISP1760_HCD=y
CONFIG_USB_ISP1760_HOST_ROLE=y

#
# USB port drivers
#
# CONFIG_USB_USS720 is not set
CONFIG_USB_SERIAL=y
CONFIG_USB_SERIAL_CONSOLE=y
CONFIG_USB_SERIAL_GENERIC=y
CONFIG_USB_SERIAL_SIMPLE=y
CONFIG_USB_SERIAL_AIRCABLE=m
CONFIG_USB_SERIAL_ARK3116=y
CONFIG_USB_SERIAL_BELKIN=m
CONFIG_USB_SERIAL_CH341=m
# CONFIG_USB_SERIAL_WHITEHEAT is not set
CONFIG_USB_SERIAL_DIGI_ACCELEPORT=m
CONFIG_USB_SERIAL_CP210X=y
CONFIG_USB_SERIAL_CYPRESS_M8=m
CONFIG_USB_SERIAL_EMPEG=m
CONFIG_USB_SERIAL_FTDI_SIO=m
CONFIG_USB_SERIAL_VISOR=m
# CONFIG_USB_SERIAL_IPAQ is not set
# CONFIG_USB_SERIAL_IR is not set
CONFIG_USB_SERIAL_EDGEPORT=y
CONFIG_USB_SERIAL_EDGEPORT_TI=m
CONFIG_USB_SERIAL_F81232=y
CONFIG_USB_SERIAL_F8153X=y
CONFIG_USB_SERIAL_GARMIN=y
# CONFIG_USB_SERIAL_IPW is not set
# CONFIG_USB_SERIAL_IUU is not set
# CONFIG_USB_SERIAL_KEYSPAN_PDA is not set
CONFIG_USB_SERIAL_KEYSPAN=m
CONFIG_USB_SERIAL_KLSI=m
# CONFIG_USB_SERIAL_KOBIL_SCT is not set
# CONFIG_USB_SERIAL_MCT_U232 is not set
CONFIG_USB_SERIAL_METRO=y
CONFIG_USB_SERIAL_MOS7720=y
CONFIG_USB_SERIAL_MOS7715_PARPORT=y
# CONFIG_USB_SERIAL_MOS7840 is not set
# CONFIG_USB_SERIAL_MXUPORT is not set
# CONFIG_USB_SERIAL_NAVMAN is not set
# CONFIG_USB_SERIAL_PL2303 is not set
CONFIG_USB_SERIAL_OTI6858=y
CONFIG_USB_SERIAL_QCAUX=y
# CONFIG_USB_SERIAL_QUALCOMM is not set
# CONFIG_USB_SERIAL_SPCP8X5 is not set
# CONFIG_USB_SERIAL_SAFE is not set
CONFIG_USB_SERIAL_SIERRAWIRELESS=m
# CONFIG_USB_SERIAL_SYMBOL is not set
CONFIG_USB_SERIAL_TI=m
# CONFIG_USB_SERIAL_CYBERJACK is not set
CONFIG_USB_SERIAL_WWAN=y
CONFIG_USB_SERIAL_OPTION=y
CONFIG_USB_SERIAL_OMNINET=y
CONFIG_USB_SERIAL_OPTICON=y
CONFIG_USB_SERIAL_XSENS_MT=m
CONFIG_USB_SERIAL_WISHBONE=y
CONFIG_USB_SERIAL_SSU100=y
CONFIG_USB_SERIAL_QT2=y
CONFIG_USB_SERIAL_UPD78F0730=m
# CONFIG_USB_SERIAL_XR is not set
# CONFIG_USB_SERIAL_DEBUG is not set

#
# USB Miscellaneous drivers
#
CONFIG_USB_EMI62=y
CONFIG_USB_EMI26=y
CONFIG_USB_ADUTUX=y
CONFIG_USB_SEVSEG=m
# CONFIG_USB_LEGOTOWER is not set
# CONFIG_USB_LCD is not set
CONFIG_USB_CYPRESS_CY7C63=m
CONFIG_USB_CYTHERM=y
CONFIG_USB_IDMOUSE=m
CONFIG_USB_FTDI_ELAN=m
# CONFIG_USB_APPLEDISPLAY is not set
# CONFIG_USB_QCOM_EUD is not set
CONFIG_APPLE_MFI_FASTCHARGE=m
CONFIG_USB_SISUSBVGA=m
# CONFIG_USB_LD is not set
# CONFIG_USB_TRANCEVIBRATOR is not set
# CONFIG_USB_IOWARRIOR is not set
CONFIG_USB_TEST=m
CONFIG_USB_EHSET_TEST_FIXTURE=y
CONFIG_USB_ISIGHTFW=y
CONFIG_USB_YUREX=y
CONFIG_USB_EZUSB_FX2=m
# CONFIG_USB_HUB_USB251XB is not set
CONFIG_USB_HSIC_USB3503=m
CONFIG_USB_HSIC_USB4604=m
# CONFIG_USB_LINK_LAYER_TEST is not set
CONFIG_USB_CHAOSKEY=m
# CONFIG_BRCM_USB_PINMAP is not set
# CONFIG_USB_ONBOARD_HUB is not set

#
# USB Physical Layer drivers
#
CONFIG_USB_PHY=y
# CONFIG_NOP_USB_XCEIV is not set
CONFIG_TAHVO_USB=m
# CONFIG_TAHVO_USB_HOST_BY_DEFAULT is not set
CONFIG_USB_ISP1301=m
CONFIG_USB_TEGRA_PHY=y
CONFIG_USB_ULPI=y
CONFIG_USB_ULPI_VIEWPORT=y
# end of USB Physical Layer drivers

# CONFIG_USB_GADGET is not set
# CONFIG_TYPEC is not set
CONFIG_USB_ROLE_SWITCH=y
CONFIG_MMC=y
CONFIG_PWRSEQ_EMMC=m
CONFIG_PWRSEQ_SIMPLE=m
CONFIG_MMC_BLOCK=m
CONFIG_MMC_BLOCK_MINORS=8
CONFIG_SDIO_UART=m
CONFIG_MMC_TEST=m
# CONFIG_MMC_CRYPTO is not set

#
# MMC/SD/SDIO Host Controller Drivers
#
CONFIG_MMC_DEBUG=y
CONFIG_MMC_SUNPLUS=y
CONFIG_MMC_MOXART=m
CONFIG_MMC_OMAP_HS=y
# CONFIG_MMC_DAVINCI is not set
# CONFIG_MMC_S3C is not set
CONFIG_MMC_TMIO_CORE=m
# CONFIG_MMC_TMIO is not set
# CONFIG_MMC_SDHI is not set
CONFIG_MMC_UNIPHIER=m
CONFIG_MMC_DW=y
CONFIG_MMC_DW_PLTFM=y
CONFIG_MMC_DW_BLUEFIELD=m
# CONFIG_MMC_DW_EXYNOS is not set
CONFIG_MMC_DW_HI3798CV200=m
CONFIG_MMC_DW_K3=y
CONFIG_MMC_SH_MMCIF=y
CONFIG_MMC_VUB300=y
CONFIG_MMC_USHC=y
CONFIG_MMC_HSQ=m
CONFIG_MMC_BCM2835=y
CONFIG_MMC_LITEX=m
# CONFIG_MEMSTICK is not set
CONFIG_NEW_LEDS=y
CONFIG_LEDS_CLASS=y
CONFIG_LEDS_CLASS_FLASH=y
CONFIG_LEDS_CLASS_MULTICOLOR=y
# CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set

#
# LED drivers
#
# CONFIG_LEDS_AN30259A is not set
CONFIG_LEDS_ARIEL=y
CONFIG_LEDS_AW2013=m
# CONFIG_LEDS_BCM6328 is not set
CONFIG_LEDS_BCM6358=m
# CONFIG_LEDS_TURRIS_OMNIA is not set
# CONFIG_LEDS_LM3530 is not set
# CONFIG_LEDS_LM3532 is not set
CONFIG_LEDS_LM3533=m
CONFIG_LEDS_LM3642=m
# CONFIG_LEDS_LM3692X is not set
# CONFIG_LEDS_S3C24XX is not set
CONFIG_LEDS_COBALT_QUBE=m
CONFIG_LEDS_COBALT_RAQ=y
CONFIG_LEDS_PCA9532=m
CONFIG_LEDS_PCA9532_GPIO=y
CONFIG_LEDS_GPIO=y
CONFIG_LEDS_LP3944=m
# CONFIG_LEDS_LP3952 is not set
# CONFIG_LEDS_LP50XX is not set
# CONFIG_LEDS_LP55XX_COMMON is not set
CONFIG_LEDS_LP8860=m
# CONFIG_LEDS_PCA955X is not set
CONFIG_LEDS_PCA963X=m
CONFIG_LEDS_PWM=m
# CONFIG_LEDS_REGULATOR is not set
CONFIG_LEDS_BD2802=m
CONFIG_LEDS_LT3593=m
CONFIG_LEDS_MC13783=m
CONFIG_LEDS_NS2=y
CONFIG_LEDS_NETXBIG=y
# CONFIG_LEDS_TCA6507 is not set
CONFIG_LEDS_TLC591XX=m
# CONFIG_LEDS_MAX77650 is not set
CONFIG_LEDS_LM355x=m
CONFIG_LEDS_OT200=y
CONFIG_LEDS_IS31FL319X=m
# CONFIG_LEDS_IS31FL32XX is not set

#
# LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
#
CONFIG_LEDS_BLINKM=m
CONFIG_LEDS_SYSCON=y
# CONFIG_LEDS_MLXREG is not set
CONFIG_LEDS_USER=y
CONFIG_LEDS_TI_LMU_COMMON=m
CONFIG_LEDS_LM3697=m
CONFIG_LEDS_LM36274=m
CONFIG_LEDS_TPS6105X=m
# CONFIG_LEDS_IP30 is not set
CONFIG_LEDS_BCM63138=m
# CONFIG_LEDS_LGM is not set

#
# Flash and Torch LED drivers
#
# CONFIG_LEDS_AAT1290 is not set
CONFIG_LEDS_AS3645A=m
CONFIG_LEDS_KTD2692=m
CONFIG_LEDS_LM3601X=m
CONFIG_LEDS_MAX77693=m
CONFIG_LEDS_MT6360=m
CONFIG_LEDS_RT4505=m
# CONFIG_LEDS_RT8515 is not set
# CONFIG_LEDS_SGM3140 is not set

#
# RGB LED drivers
#
# CONFIG_LEDS_PWM_MULTICOLOR is not set
CONFIG_LEDS_QCOM_LPG=m

#
# LED Triggers
#
CONFIG_LEDS_TRIGGERS=y
# CONFIG_LEDS_TRIGGER_TIMER is not set
CONFIG_LEDS_TRIGGER_ONESHOT=y
# CONFIG_LEDS_TRIGGER_MTD is not set
# CONFIG_LEDS_TRIGGER_HEARTBEAT is not set
CONFIG_LEDS_TRIGGER_BACKLIGHT=y
CONFIG_LEDS_TRIGGER_CPU=y
# CONFIG_LEDS_TRIGGER_ACTIVITY is not set
# CONFIG_LEDS_TRIGGER_GPIO is not set
CONFIG_LEDS_TRIGGER_DEFAULT_ON=y

#
# iptables trigger is under Netfilter config (LED target)
#
# CONFIG_LEDS_TRIGGER_TRANSIENT is not set
# CONFIG_LEDS_TRIGGER_CAMERA is not set
CONFIG_LEDS_TRIGGER_PANIC=y
# CONFIG_LEDS_TRIGGER_PATTERN is not set
CONFIG_LEDS_TRIGGER_AUDIO=m
CONFIG_LEDS_TRIGGER_TTY=y

#
# Simple LED drivers
#
# CONFIG_ACCESSIBILITY is not set
# CONFIG_RTC_CLASS is not set

#
# DMABUF options
#
CONFIG_SYNC_FILE=y
CONFIG_SW_SYNC=y
# CONFIG_UDMABUF is not set
# CONFIG_DMABUF_MOVE_NOTIFY is not set
# CONFIG_DMABUF_DEBUG is not set
CONFIG_DMABUF_SELFTESTS=m
CONFIG_DMABUF_HEAPS=y
# CONFIG_DMABUF_SYSFS_STATS is not set
# CONFIG_DMABUF_HEAPS_SYSTEM is not set
# end of DMABUF options

CONFIG_AUXDISPLAY=y
CONFIG_CHARLCD=y
CONFIG_LINEDISP=m
CONFIG_HD44780_COMMON=y
CONFIG_HD44780=m
CONFIG_IMG_ASCII_LCD=m
CONFIG_LCD2S=m
CONFIG_PARPORT_PANEL=y
CONFIG_PANEL_PARPORT=0
CONFIG_PANEL_PROFILE=5
# CONFIG_PANEL_CHANGE_MESSAGE is not set
# CONFIG_CHARLCD_BL_OFF is not set
CONFIG_CHARLCD_BL_ON=y
# CONFIG_CHARLCD_BL_FLASH is not set
CONFIG_PANEL=m
CONFIG_VFIO=y
CONFIG_VFIO_CONTAINER=y
CONFIG_VFIO_NOIOMMU=y
CONFIG_VFIO_VIRQFD=y
CONFIG_VFIO_PLATFORM=y
# CONFIG_VFIO_AMBA is not set
CONFIG_VFIO_PLATFORM_CALXEDAXGMAC_RESET=m
CONFIG_VFIO_PLATFORM_AMDXGBE_RESET=y
CONFIG_VFIO_PLATFORM_BCMFLEXRM_RESET=y
CONFIG_VFIO_MDEV=m
CONFIG_VIRT_DRIVERS=y
CONFIG_VIRTIO_ANCHOR=y
CONFIG_VIRTIO=y
# CONFIG_VIRTIO_MENU is not set
# CONFIG_VHOST_MENU is not set

#
# Microsoft Hyper-V guest support
#
# end of Microsoft Hyper-V guest support

CONFIG_GREYBUS=m
# CONFIG_GREYBUS_ES2 is not set
CONFIG_COMEDI=m
# CONFIG_COMEDI_DEBUG is not set
CONFIG_COMEDI_DEFAULT_BUF_SIZE_KB=2048
CONFIG_COMEDI_DEFAULT_BUF_MAXSIZE_KB=20480
CONFIG_COMEDI_MISC_DRIVERS=y
CONFIG_COMEDI_BOND=m
CONFIG_COMEDI_TEST=m
CONFIG_COMEDI_PARPORT=m
CONFIG_COMEDI_SSV_DNP=m
CONFIG_COMEDI_ISA_DRIVERS=y
CONFIG_COMEDI_PCL711=m
CONFIG_COMEDI_PCL724=m
CONFIG_COMEDI_PCL726=m
CONFIG_COMEDI_PCL730=m
CONFIG_COMEDI_PCL812=m
# CONFIG_COMEDI_PCL816 is not set
# CONFIG_COMEDI_PCL818 is not set
CONFIG_COMEDI_PCM3724=m
# CONFIG_COMEDI_AMPLC_DIO200_ISA is not set
CONFIG_COMEDI_AMPLC_PC236_ISA=m
# CONFIG_COMEDI_AMPLC_PC263_ISA is not set
CONFIG_COMEDI_RTI800=m
CONFIG_COMEDI_RTI802=m
# CONFIG_COMEDI_DAC02 is not set
CONFIG_COMEDI_DAS16M1=m
# CONFIG_COMEDI_DAS08_ISA is not set
# CONFIG_COMEDI_DAS16 is not set
CONFIG_COMEDI_DAS800=m
CONFIG_COMEDI_DAS1800=m
CONFIG_COMEDI_DAS6402=m
CONFIG_COMEDI_DT2801=m
CONFIG_COMEDI_DT2811=m
# CONFIG_COMEDI_DT2814 is not set
# CONFIG_COMEDI_DT2815 is not set
CONFIG_COMEDI_DT2817=m
CONFIG_COMEDI_DT282X=m
CONFIG_COMEDI_DMM32AT=m
# CONFIG_COMEDI_FL512 is not set
CONFIG_COMEDI_AIO_AIO12_8=m
CONFIG_COMEDI_AIO_IIRO_16=m
CONFIG_COMEDI_II_PCI20KC=m
CONFIG_COMEDI_C6XDIGIO=m
CONFIG_COMEDI_MPC624=m
# CONFIG_COMEDI_ADQ12B is not set
CONFIG_COMEDI_NI_AT_A2150=m
CONFIG_COMEDI_NI_AT_AO=m
CONFIG_COMEDI_NI_ATMIO=m
# CONFIG_COMEDI_NI_ATMIO16D is not set
CONFIG_COMEDI_NI_LABPC_ISA=m
CONFIG_COMEDI_PCMAD=m
CONFIG_COMEDI_PCMDA12=m
CONFIG_COMEDI_PCMMIO=m
# CONFIG_COMEDI_PCMUIO is not set
# CONFIG_COMEDI_MULTIQ3 is not set
CONFIG_COMEDI_S526=m
CONFIG_COMEDI_PCMCIA_DRIVERS=m
# CONFIG_COMEDI_CB_DAS16_CS is not set
CONFIG_COMEDI_DAS08_CS=m
# CONFIG_COMEDI_NI_DAQ_700_CS is not set
CONFIG_COMEDI_NI_DAQ_DIO24_CS=m
CONFIG_COMEDI_NI_LABPC_CS=m
# CONFIG_COMEDI_NI_MIO_CS is not set
CONFIG_COMEDI_QUATECH_DAQP_CS=m
CONFIG_COMEDI_USB_DRIVERS=m
# CONFIG_COMEDI_DT9812 is not set
CONFIG_COMEDI_NI_USB6501=m
CONFIG_COMEDI_USBDUX=m
CONFIG_COMEDI_USBDUXFAST=m
CONFIG_COMEDI_USBDUXSIGMA=m
CONFIG_COMEDI_VMK80XX=m
CONFIG_COMEDI_8254=m
CONFIG_COMEDI_8255=m
CONFIG_COMEDI_8255_SA=m
CONFIG_COMEDI_KCOMEDILIB=m
CONFIG_COMEDI_AMPLC_PC236=m
CONFIG_COMEDI_DAS08=m
CONFIG_COMEDI_NI_LABPC=m
CONFIG_COMEDI_NI_TIO=m
CONFIG_COMEDI_NI_ROUTING=m
# CONFIG_COMEDI_TESTS is not set
# CONFIG_STAGING is not set
# CONFIG_CHROME_PLATFORMS is not set
# CONFIG_MELLANOX_PLATFORM is not set
CONFIG_OLPC_XO175=y
CONFIG_SURFACE_PLATFORMS=y
# CONFIG_COMMON_CLK is not set
CONFIG_HWSPINLOCK=y
CONFIG_HWSPINLOCK_OMAP=y
CONFIG_HWSPINLOCK_QCOM=m
# CONFIG_HWSPINLOCK_SPRD is not set
CONFIG_HWSPINLOCK_STM32=y
CONFIG_HWSPINLOCK_SUN6I=m
CONFIG_HSEM_U8500=m
# CONFIG_MAILBOX is not set
CONFIG_IOMMU_API=y

#
# Remoteproc drivers
#
# end of Remoteproc drivers

#
# Rpmsg drivers
#
# end of Rpmsg drivers

CONFIG_SOUNDWIRE=y

#
# SoundWire Devices
#

#
# SOC (System On Chip) specific Drivers
#

#
# Amlogic SoC drivers
#
CONFIG_MESON_CANVAS=m
# CONFIG_MESON_CLK_MEASURE is not set
CONFIG_MESON_GX_SOCINFO=y
CONFIG_MESON_MX_SOCINFO=y
# end of Amlogic SoC drivers

#
# Apple SoC drivers
#
CONFIG_APPLE_SART=y
# end of Apple SoC drivers

#
# ASPEED SoC drivers
#
# CONFIG_ASPEED_LPC_CTRL is not set
CONFIG_ASPEED_LPC_SNOOP=y
CONFIG_ASPEED_UART_ROUTING=m
CONFIG_ASPEED_P2A_CTRL=y
# CONFIG_ASPEED_SOCINFO is not set
# end of ASPEED SoC drivers

CONFIG_AT91_SOC_ID=y
# CONFIG_AT91_SOC_SFR is not set

#
# Broadcom SoC drivers
#
CONFIG_BCM2835_POWER=y
CONFIG_SOC_BCM63XX=y
CONFIG_SOC_BRCMSTB=y
CONFIG_BCM63XX_POWER=y
# CONFIG_BCM_PMB is not set
# end of Broadcom SoC drivers

#
# NXP/Freescale QorIQ SoC drivers
#
CONFIG_QUICC_ENGINE=y
CONFIG_UCC_SLOW=y
CONFIG_UCC=y
# CONFIG_DPAA2_CONSOLE is not set
# end of NXP/Freescale QorIQ SoC drivers

#
# fujitsu SoC drivers
#
# end of fujitsu SoC drivers

#
# i.MX SoC drivers
#
# CONFIG_SOC_IMX8M is not set
CONFIG_SOC_IMX9=y
# end of i.MX SoC drivers

#
# IXP4xx SoC drivers
#
# CONFIG_IXP4XX_QMGR is not set
# CONFIG_IXP4XX_NPE is not set
# end of IXP4xx SoC drivers

#
# Enable LiteX SoC Builder specific drivers
#
CONFIG_LITEX=y
CONFIG_LITEX_SOC_CONTROLLER=y
# end of Enable LiteX SoC Builder specific drivers

# CONFIG_LOONGSON2_GUTS is not set

#
# MediaTek SoC drivers
#
# CONFIG_MTK_CMDQ is not set
CONFIG_MTK_DEVAPC=m
CONFIG_MTK_INFRACFG=y
CONFIG_MTK_PMIC_WRAP=m
CONFIG_MTK_SCPSYS=y
CONFIG_MTK_MMSYS=y
CONFIG_MTK_SVS=m
# end of MediaTek SoC drivers

#
# Qualcomm SoC drivers
#
CONFIG_QCOM_GENI_SE=m
CONFIG_QCOM_GSBI=m
# CONFIG_QCOM_LLCC is not set
# CONFIG_QCOM_RPMH is not set
# CONFIG_QCOM_SMEM is not set
# CONFIG_QCOM_SPM is not set
CONFIG_QCOM_ICC_BWMON=y
# end of Qualcomm SoC drivers

# CONFIG_SOC_RENESAS is not set
CONFIG_ROCKCHIP_GRF=y
CONFIG_ROCKCHIP_IODOMAIN=y
CONFIG_ROCKCHIP_DTPM=m
CONFIG_SOC_SAMSUNG=y
# CONFIG_EXYNOS_ASV_ARM is not set
CONFIG_EXYNOS_CHIPID=y
CONFIG_EXYNOS_USI=m
CONFIG_EXYNOS_PM_DOMAINS=y
# CONFIG_EXYNOS_REGULATOR_COUPLER is not set
# CONFIG_SOC_TEGRA20_VOLTAGE_COUPLER is not set
# CONFIG_SOC_TEGRA30_VOLTAGE_COUPLER is not set
CONFIG_SOC_TI=y
CONFIG_UX500_SOC_ID=y

#
# Xilinx SoC drivers
#
# end of Xilinx SoC drivers
# end of SOC (System On Chip) specific Drivers

CONFIG_PM_DEVFREQ=y

#
# DEVFREQ Governors
#
CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=y
CONFIG_DEVFREQ_GOV_PERFORMANCE=m
CONFIG_DEVFREQ_GOV_POWERSAVE=y
CONFIG_DEVFREQ_GOV_USERSPACE=y
CONFIG_DEVFREQ_GOV_PASSIVE=y

#
# DEVFREQ Drivers
#
CONFIG_ARM_EXYNOS_BUS_DEVFREQ=y
CONFIG_ARM_IMX_BUS_DEVFREQ=y
CONFIG_ARM_MEDIATEK_CCI_DEVFREQ=y
CONFIG_PM_DEVFREQ_EVENT=y
# CONFIG_DEVFREQ_EVENT_EXYNOS_NOCP is not set
CONFIG_DEVFREQ_EVENT_EXYNOS_PPMU=y
CONFIG_DEVFREQ_EVENT_ROCKCHIP_DFI=y
CONFIG_EXTCON=y

#
# Extcon Device Drivers
#
CONFIG_EXTCON_ADC_JACK=m
CONFIG_EXTCON_FSA9480=m
# CONFIG_EXTCON_GPIO is not set
# CONFIG_EXTCON_MAX14577 is not set
CONFIG_EXTCON_MAX3355=y
CONFIG_EXTCON_MAX77693=m
CONFIG_EXTCON_PTN5150=m
CONFIG_EXTCON_QCOM_SPMI_MISC=m
# CONFIG_EXTCON_RT8973A is not set
CONFIG_EXTCON_SM5502=m
CONFIG_EXTCON_USB_GPIO=y
CONFIG_MEMORY=y
CONFIG_ATMEL_SDRAMC=y
# CONFIG_ATMEL_EBI is not set
CONFIG_BRCMSTB_DPFE=m
CONFIG_BRCMSTB_MEMC=y
CONFIG_BT1_L2_CTL=y
CONFIG_TI_AEMIF=y
# CONFIG_TI_EMIF is not set
CONFIG_OMAP_GPMC=y
# CONFIG_OMAP_GPMC_DEBUG is not set
CONFIG_MVEBU_DEVBUS=y
# CONFIG_FSL_CORENET_CF is not set
CONFIG_FSL_IFC=y
CONFIG_JZ4780_NEMC=y
CONFIG_MTK_SMI=y
CONFIG_DA8XX_DDRCTL=y
# CONFIG_RENESAS_RPCIF is not set
CONFIG_STM32_FMC2_EBI=y
# CONFIG_SAMSUNG_MC is not set
CONFIG_IIO=m
CONFIG_IIO_BUFFER=y
CONFIG_IIO_BUFFER_CB=m
CONFIG_IIO_BUFFER_DMA=m
CONFIG_IIO_BUFFER_DMAENGINE=m
CONFIG_IIO_BUFFER_HW_CONSUMER=m
CONFIG_IIO_KFIFO_BUF=m
CONFIG_IIO_TRIGGERED_BUFFER=m
CONFIG_IIO_CONFIGFS=m
CONFIG_IIO_TRIGGER=y
CONFIG_IIO_CONSUMERS_PER_TRIGGER=2
CONFIG_IIO_SW_DEVICE=m
CONFIG_IIO_SW_TRIGGER=m
CONFIG_IIO_TRIGGERED_EVENT=m

#
# Accelerometers
#
CONFIG_ADXL313=m
CONFIG_ADXL313_I2C=m
CONFIG_ADXL345=m
CONFIG_ADXL345_I2C=m
CONFIG_ADXL355=m
CONFIG_ADXL355_I2C=m
# CONFIG_ADXL367_I2C is not set
CONFIG_ADXL372=m
CONFIG_ADXL372_I2C=m
CONFIG_BMA180=m
# CONFIG_BMA400 is not set
CONFIG_BMC150_ACCEL=m
CONFIG_BMC150_ACCEL_I2C=m
CONFIG_DA280=m
CONFIG_DA311=m
CONFIG_DMARD06=m
# CONFIG_DMARD09 is not set
CONFIG_DMARD10=m
CONFIG_FXLS8962AF=m
CONFIG_FXLS8962AF_I2C=m
CONFIG_IIO_ST_ACCEL_3AXIS=m
CONFIG_IIO_ST_ACCEL_I2C_3AXIS=m
CONFIG_IIO_KX022A=m
CONFIG_IIO_KX022A_I2C=m
CONFIG_KXSD9=m
# CONFIG_KXSD9_I2C is not set
CONFIG_KXCJK1013=m
# CONFIG_MC3230 is not set
# CONFIG_MMA7455_I2C is not set
CONFIG_MMA7660=m
CONFIG_MMA8452=m
# CONFIG_MMA9551 is not set
# CONFIG_MMA9553 is not set
# CONFIG_MSA311 is not set
CONFIG_MXC4005=m
CONFIG_MXC6255=m
CONFIG_STK8312=m
CONFIG_STK8BA50=m
# end of Accelerometers

#
# Analog to digital converters
#
# CONFIG_AD7091R5 is not set
CONFIG_AD7291=m
CONFIG_AD7606=m
CONFIG_AD7606_IFACE_PARALLEL=m
CONFIG_AD799X=m
CONFIG_ADI_AXI_ADC=m
CONFIG_AT91_ADC=m
CONFIG_AT91_SAMA5D2_ADC=m
# CONFIG_BCM_IPROC_ADC is not set
CONFIG_BERLIN2_ADC=m
CONFIG_DA9150_GPADC=m
CONFIG_ENVELOPE_DETECTOR=m
CONFIG_EXYNOS_ADC=m
# CONFIG_MXS_LRADC_ADC is not set
# CONFIG_HX711 is not set
CONFIG_INA2XX_ADC=m
CONFIG_INGENIC_ADC=m
CONFIG_IMX7D_ADC=m
# CONFIG_IMX8QXP_ADC is not set
# CONFIG_LPC18XX_ADC is not set
CONFIG_LPC32XX_ADC=m
CONFIG_LTC2471=m
CONFIG_LTC2485=m
CONFIG_LTC2497=m
# CONFIG_MAX1363 is not set
# CONFIG_MAX9611 is not set
# CONFIG_MCP3422 is not set
CONFIG_MEDIATEK_MT6360_ADC=m
# CONFIG_MEDIATEK_MT6370_ADC is not set
# CONFIG_MEDIATEK_MT6577_AUXADC is not set
# CONFIG_MEN_Z188_ADC is not set
CONFIG_NAU7802=m
# CONFIG_NPCM_ADC is not set
CONFIG_QCOM_VADC_COMMON=m
CONFIG_QCOM_SPMI_RRADC=m
CONFIG_QCOM_SPMI_IADC=m
CONFIG_QCOM_SPMI_VADC=m
CONFIG_QCOM_SPMI_ADC5=m
# CONFIG_RCAR_GYRO_ADC is not set
# CONFIG_RN5T618_ADC is not set
CONFIG_ROCKCHIP_SARADC=m
CONFIG_RICHTEK_RTQ6056=m
CONFIG_RZG2L_ADC=m
CONFIG_SC27XX_ADC=m
# CONFIG_SPEAR_ADC is not set
CONFIG_SD_ADC_MODULATOR=m
# CONFIG_STM32_ADC_CORE is not set
CONFIG_STM32_DFSDM_CORE=m
# CONFIG_STM32_DFSDM_ADC is not set
CONFIG_SUN4I_GPADC=m
CONFIG_TI_ADC081C=m
CONFIG_TI_ADS1015=m
CONFIG_VF610_ADC=m
CONFIG_VIPERBOARD_ADC=m
CONFIG_XILINX_XADC=m
# CONFIG_XILINX_AMS is not set
# end of Analog to digital converters

#
# Analog to digital and digital to analog converters
#
# end of Analog to digital and digital to analog converters

#
# Analog Front Ends
#
CONFIG_IIO_RESCALE=m
# end of Analog Front Ends

#
# Amplifiers
#
# CONFIG_HMC425 is not set
# end of Amplifiers

#
# Capacitance to digital converters
#
# CONFIG_AD7150 is not set
# CONFIG_AD7746 is not set
# end of Capacitance to digital converters

#
# Chemical Sensors
#
CONFIG_ATLAS_PH_SENSOR=m
CONFIG_ATLAS_EZO_SENSOR=m
CONFIG_BME680=m
CONFIG_BME680_I2C=m
CONFIG_CCS811=m
CONFIG_IAQCORE=m
CONFIG_PMS7003=m
# CONFIG_SCD30_CORE is not set
CONFIG_SCD4X=m
CONFIG_SENSIRION_SGP30=m
CONFIG_SENSIRION_SGP40=m
CONFIG_SPS30=m
CONFIG_SPS30_I2C=m
CONFIG_SPS30_SERIAL=m
CONFIG_SENSEAIR_SUNRISE_CO2=m
CONFIG_VZ89X=m
# end of Chemical Sensors

#
# Hid Sensor IIO Common
#
# end of Hid Sensor IIO Common

CONFIG_IIO_MS_SENSORS_I2C=m

#
# IIO SCMI Sensors
#
# end of IIO SCMI Sensors

#
# SSP Sensor Common
#
# end of SSP Sensor Common

CONFIG_IIO_ST_SENSORS_I2C=m
CONFIG_IIO_ST_SENSORS_CORE=m

#
# Digital to analog converters
#
CONFIG_AD5064=m
CONFIG_AD5380=m
# CONFIG_AD5446 is not set
CONFIG_AD5592R_BASE=m
CONFIG_AD5593R=m
CONFIG_AD5686=m
CONFIG_AD5696_I2C=m
CONFIG_DPOT_DAC=m
CONFIG_DS4424=m
CONFIG_LPC18XX_DAC=m
CONFIG_M62332=m
# CONFIG_MAX517 is not set
CONFIG_MAX5821=m
CONFIG_MCP4725=m
# CONFIG_STM32_DAC is not set
# CONFIG_TI_DAC5571 is not set
CONFIG_VF610_DAC=m
# end of Digital to analog converters

#
# IIO dummy driver
#
CONFIG_IIO_SIMPLE_DUMMY=m
# CONFIG_IIO_SIMPLE_DUMMY_EVENTS is not set
# CONFIG_IIO_SIMPLE_DUMMY_BUFFER is not set
# end of IIO dummy driver

#
# Filters
#
# end of Filters

#
# Frequency Synthesizers DDS/PLL
#

#
# Clock Generator/Distribution
#
# end of Clock Generator/Distribution

#
# Phase-Locked Loop (PLL) frequency synthesizers
#
# end of Phase-Locked Loop (PLL) frequency synthesizers
# end of Frequency Synthesizers DDS/PLL

#
# Digital gyroscope sensors
#
CONFIG_BMG160=m
CONFIG_BMG160_I2C=m
CONFIG_FXAS21002C=m
CONFIG_FXAS21002C_I2C=m
CONFIG_MPU3050=m
CONFIG_MPU3050_I2C=m
# CONFIG_IIO_ST_GYRO_3AXIS is not set
CONFIG_ITG3200=m
# end of Digital gyroscope sensors

#
# Health Sensors
#

#
# Heart Rate Monitors
#
CONFIG_AFE4404=m
CONFIG_MAX30100=m
CONFIG_MAX30102=m
# end of Heart Rate Monitors
# end of Health Sensors

#
# Humidity sensors
#
# CONFIG_AM2315 is not set
CONFIG_DHT11=m
CONFIG_HDC100X=m
CONFIG_HDC2010=m
# CONFIG_HTS221 is not set
CONFIG_HTU21=m
CONFIG_SI7005=m
CONFIG_SI7020=m
# end of Humidity sensors

#
# Inertial measurement units
#
CONFIG_BMI160=m
CONFIG_BMI160_I2C=m
CONFIG_BOSCH_BNO055=m
CONFIG_BOSCH_BNO055_SERIAL=m
CONFIG_BOSCH_BNO055_I2C=m
CONFIG_FXOS8700=m
CONFIG_FXOS8700_I2C=m
CONFIG_KMX61=m
CONFIG_INV_ICM42600=m
CONFIG_INV_ICM42600_I2C=m
CONFIG_INV_MPU6050_IIO=m
CONFIG_INV_MPU6050_I2C=m
# CONFIG_IIO_ST_LSM6DSX is not set
CONFIG_IIO_ST_LSM9DS0=m
CONFIG_IIO_ST_LSM9DS0_I2C=m
# end of Inertial measurement units

#
# Light sensors
#
CONFIG_ADJD_S311=m
CONFIG_ADUX1020=m
CONFIG_AL3010=m
CONFIG_AL3320A=m
# CONFIG_APDS9300 is not set
# CONFIG_APDS9960 is not set
CONFIG_AS73211=m
CONFIG_BH1750=m
CONFIG_BH1780=m
# CONFIG_CM32181 is not set
# CONFIG_CM3232 is not set
# CONFIG_CM3323 is not set
CONFIG_CM3605=m
# CONFIG_CM36651 is not set
CONFIG_GP2AP002=m
CONFIG_GP2AP020A00F=m
CONFIG_IQS621_ALS=m
CONFIG_SENSORS_ISL29018=m
CONFIG_SENSORS_ISL29028=m
CONFIG_ISL29125=m
# CONFIG_JSA1212 is not set
# CONFIG_RPR0521 is not set
# CONFIG_SENSORS_LM3533 is not set
CONFIG_LTR501=m
CONFIG_LTRF216A=m
CONFIG_LV0104CS=m
CONFIG_MAX44000=m
CONFIG_MAX44009=m
CONFIG_NOA1305=m
# CONFIG_OPT3001 is not set
# CONFIG_PA12203001 is not set
CONFIG_SI1133=m
CONFIG_SI1145=m
# CONFIG_STK3310 is not set
# CONFIG_ST_UVIS25 is not set
CONFIG_TCS3414=m
CONFIG_TCS3472=m
# CONFIG_SENSORS_TSL2563 is not set
CONFIG_TSL2583=m
CONFIG_TSL2591=m
CONFIG_TSL2772=m
CONFIG_TSL4531=m
CONFIG_US5182D=m
CONFIG_VCNL4000=m
CONFIG_VCNL4035=m
CONFIG_VEML6030=m
CONFIG_VEML6070=m
# CONFIG_VL6180 is not set
# CONFIG_ZOPT2201 is not set
# end of Light sensors

#
# Magnetometer sensors
#
# CONFIG_AK8974 is not set
CONFIG_AK8975=m
CONFIG_AK09911=m
CONFIG_BMC150_MAGN=m
CONFIG_BMC150_MAGN_I2C=m
CONFIG_MAG3110=m
CONFIG_MMC35240=m
CONFIG_IIO_ST_MAGN_3AXIS=m
CONFIG_IIO_ST_MAGN_I2C_3AXIS=m
# CONFIG_SENSORS_HMC5843_I2C is not set
# CONFIG_SENSORS_RM3100_I2C is not set
# CONFIG_YAMAHA_YAS530 is not set
# end of Magnetometer sensors

#
# Multiplexers
#
# CONFIG_IIO_MUX is not set
# end of Multiplexers

#
# Inclinometer sensors
#
# end of Inclinometer sensors

CONFIG_IIO_RESCALE_KUNIT_TEST=m
CONFIG_IIO_FORMAT_KUNIT_TEST=m

#
# Triggers - standalone
#
# CONFIG_IIO_HRTIMER_TRIGGER is not set
CONFIG_IIO_INTERRUPT_TRIGGER=m
# CONFIG_IIO_STM32_LPTIMER_TRIGGER is not set
CONFIG_IIO_STM32_TIMER_TRIGGER=m
CONFIG_IIO_TIGHTLOOP_TRIGGER=m
CONFIG_IIO_SYSFS_TRIGGER=m
# end of Triggers - standalone

#
# Linear and angular position sensors
#
CONFIG_IQS624_POS=m
# end of Linear and angular position sensors

#
# Digital potentiometers
#
# CONFIG_AD5110 is not set
CONFIG_AD5272=m
CONFIG_DS1803=m
CONFIG_MAX5432=m
# CONFIG_MCP4018 is not set
CONFIG_MCP4531=m
CONFIG_TPL0102=m
# end of Digital potentiometers

#
# Digital potentiostats
#
CONFIG_LMP91000=m
# end of Digital potentiostats

#
# Pressure sensors
#
CONFIG_ABP060MG=m
# CONFIG_BMP280 is not set
CONFIG_DLHL60D=m
# CONFIG_DPS310 is not set
# CONFIG_HP03 is not set
CONFIG_ICP10100=m
CONFIG_MPL115=m
CONFIG_MPL115_I2C=m
# CONFIG_MPL3115 is not set
# CONFIG_MS5611 is not set
# CONFIG_MS5637 is not set
CONFIG_IIO_ST_PRESS=m
CONFIG_IIO_ST_PRESS_I2C=m
# CONFIG_T5403 is not set
CONFIG_HP206C=m
CONFIG_ZPA2326=m
CONFIG_ZPA2326_I2C=m
# end of Pressure sensors

#
# Lightning sensors
#
# end of Lightning sensors

#
# Proximity and distance sensors
#
CONFIG_ISL29501=m
CONFIG_LIDAR_LITE_V2=m
# CONFIG_MB1232 is not set
CONFIG_PING=m
CONFIG_RFD77402=m
CONFIG_SRF04=m
CONFIG_SX_COMMON=m
CONFIG_SX9310=m
CONFIG_SX9324=m
CONFIG_SX9360=m
CONFIG_SX9500=m
# CONFIG_SRF08 is not set
CONFIG_VCNL3020=m
CONFIG_VL53L0X_I2C=m
# end of Proximity and distance sensors

#
# Resolver to digital converters
#
# end of Resolver to digital converters

#
# Temperature sensors
#
# CONFIG_IQS620AT_TEMP is not set
CONFIG_MLX90614=m
# CONFIG_MLX90632 is not set
# CONFIG_TMP006 is not set
# CONFIG_TMP007 is not set
CONFIG_TMP117=m
CONFIG_TSYS01=m
CONFIG_TSYS02D=m
CONFIG_MAX30208=m
# end of Temperature sensors

CONFIG_PWM=y
CONFIG_PWM_SYSFS=y
CONFIG_PWM_DEBUG=y
CONFIG_PWM_ATMEL=y
CONFIG_PWM_ATMEL_TCB=y
# CONFIG_PWM_BCM2835 is not set
CONFIG_PWM_BERLIN=y
CONFIG_PWM_BRCMSTB=y
# CONFIG_PWM_CLK is not set
# CONFIG_PWM_CLPS711X is not set
CONFIG_PWM_EP93XX=m
# CONFIG_PWM_FSL_FTM is not set
CONFIG_PWM_HIBVT=m
CONFIG_PWM_IMX1=y
CONFIG_PWM_IMX27=m
CONFIG_PWM_INTEL_LGM=y
CONFIG_PWM_IQS620A=y
CONFIG_PWM_LP3943=m
CONFIG_PWM_LPC18XX_SCT=m
CONFIG_PWM_LPC32XX=y
CONFIG_PWM_LPSS=y
CONFIG_PWM_LPSS_PLATFORM=y
CONFIG_PWM_MTK_DISP=y
# CONFIG_PWM_MEDIATEK is not set
CONFIG_PWM_MXS=y
CONFIG_PWM_OMAP_DMTIMER=y
CONFIG_PWM_PCA9685=m
# CONFIG_PWM_PXA is not set
# CONFIG_PWM_RASPBERRYPI_POE is not set
# CONFIG_PWM_RCAR is not set
# CONFIG_PWM_RENESAS_TPU is not set
# CONFIG_PWM_ROCKCHIP is not set
CONFIG_PWM_SAMSUNG=y
CONFIG_PWM_SL28CPLD=m
CONFIG_PWM_SPEAR=y
CONFIG_PWM_SPRD=m
# CONFIG_PWM_STI is not set
# CONFIG_PWM_STM32 is not set
# CONFIG_PWM_STM32_LP is not set
CONFIG_PWM_SUNPLUS=y
# CONFIG_PWM_TEGRA is not set
CONFIG_PWM_TIECAP=y
CONFIG_PWM_TIEHRPWM=m
CONFIG_PWM_VISCONTI=m
CONFIG_PWM_VT8500=y

#
# IRQ chip support
#
CONFIG_IRQCHIP=y
# CONFIG_AL_FIC is not set
CONFIG_MADERA_IRQ=m
CONFIG_JCORE_AIC=y
# CONFIG_RENESAS_INTC_IRQPIN is not set
CONFIG_RENESAS_IRQC=y
CONFIG_RENESAS_RZA1_IRQC=y
CONFIG_RENESAS_RZG2L_IRQC=y
# CONFIG_SL28CPLD_INTC is not set
# CONFIG_TS4800_IRQ is not set
CONFIG_XILINX_INTC=y
CONFIG_INGENIC_TCU_IRQ=y
CONFIG_IRQ_UNIPHIER_AIDET=y
CONFIG_MESON_IRQ_GPIO=m
CONFIG_IMX_IRQSTEER=y
CONFIG_IMX_INTMUX=y
# CONFIG_IMX_MU_MSI is not set
# CONFIG_EXYNOS_IRQ_COMBINER is not set
# CONFIG_MST_IRQ is not set
# CONFIG_MCHP_EIC is not set
# CONFIG_SUNPLUS_SP7021_INTC is not set
# end of IRQ chip support

CONFIG_IPACK_BUS=m
CONFIG_SERIAL_IPOCTAL=m
CONFIG_RESET_CONTROLLER=y
CONFIG_RESET_A10SR=m
CONFIG_RESET_ATH79=y
# CONFIG_RESET_AXS10X is not set
# CONFIG_RESET_BCM6345 is not set
CONFIG_RESET_BERLIN=m
# CONFIG_RESET_BRCMSTB is not set
CONFIG_RESET_BRCMSTB_RESCAL=y
# CONFIG_RESET_HSDK is not set
CONFIG_RESET_IMX7=m
# CONFIG_RESET_INTEL_GW is not set
CONFIG_RESET_K210=y
# CONFIG_RESET_LANTIQ is not set
# CONFIG_RESET_LPC18XX is not set
CONFIG_RESET_MCHP_SPARX5=y
CONFIG_RESET_MESON=m
CONFIG_RESET_MESON_AUDIO_ARB=y
# CONFIG_RESET_NPCM is not set
# CONFIG_RESET_PISTACHIO is not set
CONFIG_RESET_QCOM_AOSS=m
CONFIG_RESET_QCOM_PDC=m
CONFIG_RESET_RASPBERRYPI=y
CONFIG_RESET_RZG2L_USBPHY_CTRL=y
CONFIG_RESET_SCMI=m
CONFIG_RESET_SIMPLE=y
# CONFIG_RESET_SOCFPGA is not set
CONFIG_RESET_STARFIVE_JH7100=y
CONFIG_RESET_SUNPLUS=y
CONFIG_RESET_SUNXI=y
CONFIG_RESET_TI_SCI=y
CONFIG_RESET_TI_SYSCON=m
# CONFIG_RESET_TI_TPS380X is not set
CONFIG_RESET_TN48M_CPLD=m
CONFIG_RESET_UNIPHIER=m
CONFIG_RESET_UNIPHIER_GLUE=y
CONFIG_RESET_ZYNQ=y
CONFIG_COMMON_RESET_HI3660=m
CONFIG_COMMON_RESET_HI6220=y

#
# PHY Subsystem
#
CONFIG_GENERIC_PHY=y
CONFIG_GENERIC_PHY_MIPI_DPHY=y
# CONFIG_PHY_LPC18XX_USB_OTG is not set
CONFIG_PHY_PISTACHIO_USB=m
CONFIG_PHY_XGENE=y
CONFIG_USB_LGM_PHY=y
# CONFIG_PHY_CAN_TRANSCEIVER is not set
# CONFIG_PHY_SUN4I_USB is not set
CONFIG_PHY_SUN9I_USB=y
CONFIG_PHY_SUN50I_USB3=y
CONFIG_PHY_MESON8_HDMI_TX=m
# CONFIG_PHY_MESON8B_USB2 is not set
CONFIG_PHY_MESON_GXL_USB2=m
CONFIG_PHY_MESON_G12A_MIPI_DPHY_ANALOG=y
# CONFIG_PHY_MESON_G12A_USB2 is not set
CONFIG_PHY_MESON_G12A_USB3_PCIE=y
CONFIG_PHY_MESON_AXG_PCIE=y
CONFIG_PHY_MESON_AXG_MIPI_PCIE_ANALOG=y
CONFIG_PHY_MESON_AXG_MIPI_DPHY=y

#
# PHY drivers for Broadcom platforms
#
# CONFIG_PHY_BCM63XX_USBH is not set
# CONFIG_PHY_CYGNUS_PCIE is not set
# CONFIG_PHY_BCM_SR_USB is not set
CONFIG_BCM_KONA_USB2_PHY=m
# CONFIG_PHY_BCM_NS_USB2 is not set
# CONFIG_PHY_NS2_USB_DRD is not set
CONFIG_PHY_BRCM_SATA=y
# CONFIG_PHY_BRCM_USB is not set
# CONFIG_PHY_BCM_SR_PCIE is not set
# end of PHY drivers for Broadcom platforms

CONFIG_PHY_CADENCE_DPHY=m
CONFIG_PHY_CADENCE_DPHY_RX=m
# CONFIG_PHY_CADENCE_SALVO is not set
# CONFIG_PHY_FSL_IMX8MQ_USB is not set
CONFIG_PHY_MIXEL_LVDS_PHY=m
CONFIG_PHY_MIXEL_MIPI_DPHY=m
CONFIG_PHY_FSL_IMX8M_PCIE=y
# CONFIG_PHY_FSL_LYNX_28G is not set
# CONFIG_PHY_HI6220_USB is not set
CONFIG_PHY_HI3660_USB=m
CONFIG_PHY_HI3670_USB=y
# CONFIG_PHY_HI3670_PCIE is not set
CONFIG_PHY_HISTB_COMBPHY=m
# CONFIG_PHY_HISI_INNO_USB2 is not set
# CONFIG_PHY_INGENIC_USB is not set
CONFIG_PHY_LANTIQ_VRX200_PCIE=y
CONFIG_PHY_LANTIQ_RCU_USB2=y
CONFIG_ARMADA375_USBCLUSTER_PHY=y
CONFIG_PHY_BERLIN_SATA=y
CONFIG_PHY_BERLIN_USB=m
CONFIG_PHY_MVEBU_A3700_UTMI=y
CONFIG_PHY_MVEBU_A38X_COMPHY=y
CONFIG_PHY_MVEBU_CP110_UTMI=y
# CONFIG_PHY_PXA_28NM_HSIC is not set
CONFIG_PHY_PXA_28NM_USB2=m
# CONFIG_PHY_PXA_USB is not set
# CONFIG_PHY_MMP3_USB is not set
CONFIG_PHY_MMP3_HSIC=y
CONFIG_PHY_MTK_PCIE=y
# CONFIG_PHY_MTK_TPHY is not set
# CONFIG_PHY_MTK_UFS is not set
CONFIG_PHY_MTK_XSPHY=m
# CONFIG_PHY_MTK_DP is not set
CONFIG_PHY_SPARX5_SERDES=y
# CONFIG_PHY_LAN966X_SERDES is not set
CONFIG_PHY_CPCAP_USB=m
CONFIG_PHY_MAPPHONE_MDM6600=m
# CONFIG_PHY_OCELOT_SERDES is not set
CONFIG_PHY_ATH79_USB=y
CONFIG_PHY_QCOM_IPQ4019_USB=y
CONFIG_PHY_QCOM_QUSB2=y
CONFIG_PHY_QCOM_USB_HS=y
CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2=m
CONFIG_PHY_QCOM_USB_HSIC=y
CONFIG_PHY_QCOM_USB_HS_28NM=m
CONFIG_PHY_QCOM_USB_SS=m
# CONFIG_PHY_QCOM_IPQ806X_USB is not set
CONFIG_PHY_MT7621_PCI=m
CONFIG_PHY_RALINK_USB=m
# CONFIG_PHY_R8A779F0_ETHERNET_SERDES is not set
# CONFIG_PHY_RCAR_GEN3_USB3 is not set
# CONFIG_PHY_ROCKCHIP_DPHY_RX0 is not set
# CONFIG_PHY_ROCKCHIP_INNO_CSIDPHY is not set
CONFIG_PHY_ROCKCHIP_INNO_DSIDPHY=y
# CONFIG_PHY_ROCKCHIP_PCIE is not set
# CONFIG_PHY_ROCKCHIP_SNPS_PCIE3 is not set
CONFIG_PHY_ROCKCHIP_TYPEC=y
CONFIG_PHY_EXYNOS_DP_VIDEO=y
CONFIG_PHY_EXYNOS_MIPI_VIDEO=y
CONFIG_PHY_EXYNOS_PCIE=y
CONFIG_PHY_SAMSUNG_UFS=y
CONFIG_PHY_SAMSUNG_USB2=y
# CONFIG_PHY_S5PV210_USB2 is not set
CONFIG_PHY_UNIPHIER_USB2=m
# CONFIG_PHY_UNIPHIER_USB3 is not set
# CONFIG_PHY_UNIPHIER_PCIE is not set
CONFIG_PHY_UNIPHIER_AHCI=m
CONFIG_PHY_ST_SPEAR1310_MIPHY=y
CONFIG_PHY_ST_SPEAR1340_MIPHY=y
CONFIG_PHY_STIH407_USB=y
# CONFIG_PHY_SUNPLUS_USB is not set
CONFIG_PHY_TEGRA194_P2U=y
CONFIG_PHY_DA8XX_USB=m
CONFIG_PHY_DM816X_USB=y
CONFIG_OMAP_CONTROL_PHY=y
CONFIG_TI_PIPE3=y
CONFIG_PHY_TUSB1210=m
# CONFIG_PHY_INTEL_KEEMBAY_EMMC is not set
# CONFIG_PHY_INTEL_KEEMBAY_USB is not set
CONFIG_PHY_INTEL_LGM_COMBO=y
CONFIG_PHY_INTEL_LGM_EMMC=m
CONFIG_PHY_INTEL_THUNDERBAY_EMMC=m
# CONFIG_PHY_XILINX_ZYNQMP is not set
# end of PHY Subsystem

CONFIG_POWERCAP=y
CONFIG_DTPM=y
CONFIG_MCB=m
CONFIG_MCB_LPC=m
# CONFIG_RAS is not set

#
# Android
#
# end of Android

CONFIG_DAX=m
CONFIG_NVMEM=y
# CONFIG_NVMEM_SYSFS is not set
# CONFIG_NVMEM_APPLE_EFUSES is not set
CONFIG_NVMEM_BCM_OCOTP=m
# CONFIG_NVMEM_BRCM_NVRAM is not set
CONFIG_NVMEM_IMX_IIM=m
# CONFIG_NVMEM_IMX_OCOTP is not set
CONFIG_NVMEM_JZ4780_EFUSE=y
# CONFIG_NVMEM_LAN9662_OTPC is not set
CONFIG_NVMEM_LAYERSCAPE_SFP=m
# CONFIG_NVMEM_LPC18XX_EEPROM is not set
# CONFIG_NVMEM_LPC18XX_OTP is not set
CONFIG_NVMEM_MESON_MX_EFUSE=y
# CONFIG_NVMEM_MICROCHIP_OTPC is not set
CONFIG_NVMEM_MTK_EFUSE=y
CONFIG_NVMEM_MXS_OCOTP=y
CONFIG_NVMEM_NINTENDO_OTP=y
CONFIG_NVMEM_QCOM_QFPROM=m
# CONFIG_NVMEM_RAVE_SP_EEPROM is not set
CONFIG_NVMEM_RMEM=m
CONFIG_NVMEM_ROCKCHIP_EFUSE=m
CONFIG_NVMEM_ROCKCHIP_OTP=y
CONFIG_NVMEM_SC27XX_EFUSE=m
CONFIG_NVMEM_SNVS_LPGPR=y
# CONFIG_NVMEM_SPMI_SDAM is not set
# CONFIG_NVMEM_SPRD_EFUSE is not set
CONFIG_NVMEM_STM32_ROMEM=m
CONFIG_NVMEM_SUNPLUS_OCOTP=y
# CONFIG_NVMEM_U_BOOT_ENV is not set
CONFIG_NVMEM_UNIPHIER_EFUSE=y
# CONFIG_NVMEM_VF610_OCOTP is not set

#
# HW tracing support
#
# CONFIG_STM is not set
# end of HW tracing support

# CONFIG_FPGA is not set
CONFIG_FSI=m
CONFIG_FSI_NEW_DEV_NODE=y
# CONFIG_FSI_MASTER_GPIO is not set
# CONFIG_FSI_MASTER_HUB is not set
CONFIG_FSI_MASTER_ASPEED=m
CONFIG_FSI_SCOM=m
CONFIG_FSI_SBEFIFO=m
CONFIG_FSI_OCC=m
CONFIG_TEE=m
CONFIG_MULTIPLEXER=m

#
# Multiplexer drivers
#
CONFIG_MUX_ADG792A=m
CONFIG_MUX_GPIO=m
CONFIG_MUX_MMIO=m
# end of Multiplexer drivers

CONFIG_PM_OPP=y
# CONFIG_SIOX is not set
# CONFIG_SLIMBUS is not set
CONFIG_INTERCONNECT=y
# CONFIG_INTERCONNECT_IMX is not set
CONFIG_INTERCONNECT_QCOM_OSM_L3=m
# CONFIG_INTERCONNECT_SAMSUNG is not set
CONFIG_COUNTER=m
CONFIG_104_QUAD_8=m
# CONFIG_INTERRUPT_CNT is not set
# CONFIG_STM32_TIMER_CNT is not set
CONFIG_STM32_LPTIMER_CNT=m
CONFIG_TI_EQEP=m
CONFIG_FTM_QUADDEC=m
# CONFIG_MICROCHIP_TCB_CAPTURE is not set
# CONFIG_TI_ECAP_CAPTURE is not set
CONFIG_PECI=m
CONFIG_PECI_CPU=m
CONFIG_HTE=y
# end of Device Drivers

#
# File systems
#
# CONFIG_VALIDATE_FS_PARSER is not set
CONFIG_FS_IOMAP=y
# CONFIG_EXT2_FS is not set
CONFIG_EXT3_FS=m
CONFIG_EXT3_FS_POSIX_ACL=y
# CONFIG_EXT3_FS_SECURITY is not set
CONFIG_EXT4_FS=m
CONFIG_EXT4_USE_FOR_EXT2=y
CONFIG_EXT4_FS_POSIX_ACL=y
# CONFIG_EXT4_FS_SECURITY is not set
CONFIG_EXT4_DEBUG=y
CONFIG_EXT4_KUNIT_TESTS=m
CONFIG_JBD2=m
# CONFIG_JBD2_DEBUG is not set
CONFIG_FS_MBCACHE=m
CONFIG_REISERFS_FS=m
# CONFIG_REISERFS_CHECK is not set
CONFIG_REISERFS_PROC_INFO=y
# CONFIG_REISERFS_FS_XATTR is not set
CONFIG_JFS_FS=y
CONFIG_JFS_POSIX_ACL=y
CONFIG_JFS_SECURITY=y
CONFIG_JFS_DEBUG=y
# CONFIG_JFS_STATISTICS is not set
# CONFIG_XFS_FS is not set
# CONFIG_GFS2_FS is not set
CONFIG_BTRFS_FS=m
# CONFIG_BTRFS_FS_POSIX_ACL is not set
CONFIG_BTRFS_FS_CHECK_INTEGRITY=y
# CONFIG_BTRFS_FS_RUN_SANITY_TESTS is not set
# CONFIG_BTRFS_DEBUG is not set
CONFIG_BTRFS_ASSERT=y
CONFIG_BTRFS_FS_REF_VERIFY=y
# CONFIG_NILFS2_FS is not set
# CONFIG_F2FS_FS is not set
CONFIG_ZONEFS_FS=y
CONFIG_FS_POSIX_ACL=y
CONFIG_EXPORTFS=m
# CONFIG_EXPORTFS_BLOCK_OPS is not set
CONFIG_FILE_LOCKING=y
# CONFIG_FS_ENCRYPTION is not set
CONFIG_FS_VERITY=y
# CONFIG_FS_VERITY_BUILTIN_SIGNATURES is not set
CONFIG_FSNOTIFY=y
CONFIG_DNOTIFY=y
CONFIG_INOTIFY_USER=y
# CONFIG_FANOTIFY is not set
CONFIG_QUOTA=y
CONFIG_PRINT_QUOTA_WARNING=y
CONFIG_QUOTA_DEBUG=y
CONFIG_QFMT_V1=m
# CONFIG_QFMT_V2 is not set
CONFIG_QUOTACTL=y
# CONFIG_AUTOFS4_FS is not set
CONFIG_AUTOFS_FS=m
CONFIG_FUSE_FS=y
CONFIG_CUSE=y
CONFIG_VIRTIO_FS=y
CONFIG_OVERLAY_FS=m
CONFIG_OVERLAY_FS_REDIRECT_DIR=y
CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW=y
# CONFIG_OVERLAY_FS_INDEX is not set
CONFIG_OVERLAY_FS_METACOPY=y
CONFIG_COMPOSEFS_FS=m

#
# Caches
#
CONFIG_NETFS_SUPPORT=m
CONFIG_NETFS_STATS=y
CONFIG_FSCACHE=m
CONFIG_FSCACHE_STATS=y
CONFIG_FSCACHE_DEBUG=y
# CONFIG_CACHEFILES is not set
# end of Caches

#
# CD-ROM/DVD Filesystems
#
CONFIG_ISO9660_FS=y
CONFIG_JOLIET=y
CONFIG_ZISOFS=y
CONFIG_UDF_FS=y
# end of CD-ROM/DVD Filesystems

#
# DOS/FAT/EXFAT/NT Filesystems
#
CONFIG_FAT_FS=y
CONFIG_MSDOS_FS=m
CONFIG_VFAT_FS=y
CONFIG_FAT_DEFAULT_CODEPAGE=437
CONFIG_FAT_DEFAULT_IOCHARSET="iso8859-1"
CONFIG_FAT_DEFAULT_UTF8=y
CONFIG_FAT_KUNIT_TEST=y
CONFIG_EXFAT_FS=m
CONFIG_EXFAT_DEFAULT_IOCHARSET="utf8"
CONFIG_NTFS_FS=y
# CONFIG_NTFS_DEBUG is not set
# CONFIG_NTFS_RW is not set
CONFIG_NTFS3_FS=m
CONFIG_NTFS3_LZX_XPRESS=y
CONFIG_NTFS3_FS_POSIX_ACL=y
# end of DOS/FAT/EXFAT/NT Filesystems

#
# Pseudo filesystems
#
CONFIG_PROC_FS=y
CONFIG_PROC_SYSCTL=y
# CONFIG_PROC_CHILDREN is not set
CONFIG_KERNFS=y
CONFIG_SYSFS=y
CONFIG_CONFIGFS_FS=y
# end of Pseudo filesystems

# CONFIG_MISC_FILESYSTEMS is not set
CONFIG_NLS=y
CONFIG_NLS_DEFAULT="iso8859-1"
# CONFIG_NLS_CODEPAGE_437 is not set
CONFIG_NLS_CODEPAGE_737=y
# CONFIG_NLS_CODEPAGE_775 is not set
# CONFIG_NLS_CODEPAGE_850 is not set
CONFIG_NLS_CODEPAGE_852=m
CONFIG_NLS_CODEPAGE_855=m
CONFIG_NLS_CODEPAGE_857=m
CONFIG_NLS_CODEPAGE_860=m
CONFIG_NLS_CODEPAGE_861=m
# CONFIG_NLS_CODEPAGE_862 is not set
CONFIG_NLS_CODEPAGE_863=m
CONFIG_NLS_CODEPAGE_864=m
CONFIG_NLS_CODEPAGE_865=y
CONFIG_NLS_CODEPAGE_866=m
CONFIG_NLS_CODEPAGE_869=y
CONFIG_NLS_CODEPAGE_936=m
CONFIG_NLS_CODEPAGE_950=m
CONFIG_NLS_CODEPAGE_932=y
CONFIG_NLS_CODEPAGE_949=y
# CONFIG_NLS_CODEPAGE_874 is not set
# CONFIG_NLS_ISO8859_8 is not set
CONFIG_NLS_CODEPAGE_1250=m
CONFIG_NLS_CODEPAGE_1251=m
CONFIG_NLS_ASCII=y
CONFIG_NLS_ISO8859_1=y
# CONFIG_NLS_ISO8859_2 is not set
CONFIG_NLS_ISO8859_3=y
CONFIG_NLS_ISO8859_4=m
# CONFIG_NLS_ISO8859_5 is not set
# CONFIG_NLS_ISO8859_6 is not set
CONFIG_NLS_ISO8859_7=m
CONFIG_NLS_ISO8859_9=m
CONFIG_NLS_ISO8859_13=y
# CONFIG_NLS_ISO8859_14 is not set
# CONFIG_NLS_ISO8859_15 is not set
# CONFIG_NLS_KOI8_R is not set
CONFIG_NLS_KOI8_U=m
CONFIG_NLS_MAC_ROMAN=m
CONFIG_NLS_MAC_CELTIC=y
CONFIG_NLS_MAC_CENTEURO=y
CONFIG_NLS_MAC_CROATIAN=y
CONFIG_NLS_MAC_CYRILLIC=m
CONFIG_NLS_MAC_GAELIC=y
CONFIG_NLS_MAC_GREEK=y
CONFIG_NLS_MAC_ICELAND=m
CONFIG_NLS_MAC_INUIT=y
CONFIG_NLS_MAC_ROMANIAN=m
CONFIG_NLS_MAC_TURKISH=m
# CONFIG_NLS_UTF8 is not set
CONFIG_UNICODE=y
CONFIG_UNICODE_NORMALIZATION_SELFTEST=m
CONFIG_IO_WQ=y
# end of File systems

#
# Security options
#
CONFIG_KEYS=y
# CONFIG_KEYS_REQUEST_CACHE is not set
CONFIG_PERSISTENT_KEYRINGS=y
CONFIG_TRUSTED_KEYS=y

#
# No trust source selected!
#
CONFIG_ENCRYPTED_KEYS=m
# CONFIG_USER_DECRYPTED_DATA is not set
# CONFIG_KEY_DH_OPERATIONS is not set
# CONFIG_KEY_NOTIFICATIONS is not set
# CONFIG_SECURITY_DMESG_RESTRICT is not set
# CONFIG_SECURITYFS is not set
# CONFIG_STATIC_USERMODEHELPER is not set
CONFIG_DEFAULT_SECURITY_DAC=y
CONFIG_LSM="landlock,lockdown,yama,loadpin,safesetid,integrity,bpf"

#
# Kernel hardening options
#

#
# Memory initialization
#
CONFIG_CC_HAS_AUTO_VAR_INIT_PATTERN=y
CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO_BARE=y
CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO=y
# CONFIG_INIT_STACK_NONE is not set
# CONFIG_INIT_STACK_ALL_PATTERN is not set
CONFIG_INIT_STACK_ALL_ZERO=y
CONFIG_INIT_ON_ALLOC_DEFAULT_ON=y
CONFIG_INIT_ON_FREE_DEFAULT_ON=y
CONFIG_CC_HAS_ZERO_CALL_USED_REGS=y
CONFIG_ZERO_CALL_USED_REGS=y
# end of Memory initialization

CONFIG_RANDSTRUCT_NONE=y
# end of Kernel hardening options
# end of Security options

CONFIG_XOR_BLOCKS=m
CONFIG_CRYPTO=y

#
# Crypto core or helper
#
CONFIG_CRYPTO_FIPS=y
CONFIG_CRYPTO_FIPS_NAME="Linux Kernel Cryptographic API"
# CONFIG_CRYPTO_FIPS_CUSTOM_VERSION is not set
CONFIG_CRYPTO_ALGAPI=y
CONFIG_CRYPTO_ALGAPI2=y
CONFIG_CRYPTO_AEAD=y
CONFIG_CRYPTO_AEAD2=y
CONFIG_CRYPTO_SKCIPHER=y
CONFIG_CRYPTO_SKCIPHER2=y
CONFIG_CRYPTO_HASH=y
CONFIG_CRYPTO_HASH2=y
CONFIG_CRYPTO_RNG=y
CONFIG_CRYPTO_RNG2=y
CONFIG_CRYPTO_RNG_DEFAULT=y
CONFIG_CRYPTO_AKCIPHER2=y
CONFIG_CRYPTO_AKCIPHER=y
CONFIG_CRYPTO_KPP2=y
CONFIG_CRYPTO_KPP=y
CONFIG_CRYPTO_ACOMP2=y
CONFIG_CRYPTO_MANAGER=y
CONFIG_CRYPTO_MANAGER2=y
# CONFIG_CRYPTO_MANAGER_DISABLE_TESTS is not set
CONFIG_CRYPTO_MANAGER_EXTRA_TESTS=y
CONFIG_CRYPTO_NULL=y
CONFIG_CRYPTO_NULL2=y
# CONFIG_CRYPTO_CRYPTD is not set
CONFIG_CRYPTO_AUTHENC=m
# CONFIG_CRYPTO_TEST is not set
# end of Crypto core or helper

#
# Public-key cryptography
#
CONFIG_CRYPTO_RSA=y
CONFIG_CRYPTO_DH=y
CONFIG_CRYPTO_DH_RFC7919_GROUPS=y
CONFIG_CRYPTO_ECC=y
CONFIG_CRYPTO_ECDH=y
CONFIG_CRYPTO_ECDSA=y
CONFIG_CRYPTO_ECRDSA=y
CONFIG_CRYPTO_SM2=m
CONFIG_CRYPTO_CURVE25519=y
# end of Public-key cryptography

#
# Block ciphers
#
CONFIG_CRYPTO_AES=y
CONFIG_CRYPTO_AES_TI=y
# CONFIG_CRYPTO_ARIA is not set
# CONFIG_CRYPTO_BLOWFISH is not set
CONFIG_CRYPTO_CAMELLIA=m
CONFIG_CRYPTO_CAST_COMMON=y
CONFIG_CRYPTO_CAST5=y
CONFIG_CRYPTO_CAST6=m
CONFIG_CRYPTO_DES=m
CONFIG_CRYPTO_FCRYPT=m
# CONFIG_CRYPTO_SERPENT is not set
CONFIG_CRYPTO_SM4=y
CONFIG_CRYPTO_SM4_GENERIC=y
CONFIG_CRYPTO_TWOFISH=y
CONFIG_CRYPTO_TWOFISH_COMMON=y
# end of Block ciphers

#
# Length-preserving ciphers and modes
#
CONFIG_CRYPTO_ADIANTUM=m
CONFIG_CRYPTO_CHACHA20=y
CONFIG_CRYPTO_CBC=y
CONFIG_CRYPTO_CFB=m
CONFIG_CRYPTO_CTR=y
# CONFIG_CRYPTO_CTS is not set
CONFIG_CRYPTO_ECB=y
# CONFIG_CRYPTO_HCTR2 is not set
# CONFIG_CRYPTO_KEYWRAP is not set
CONFIG_CRYPTO_LRW=y
# CONFIG_CRYPTO_OFB is not set
# CONFIG_CRYPTO_PCBC is not set
CONFIG_CRYPTO_XTS=m
CONFIG_CRYPTO_NHPOLY1305=m
# end of Length-preserving ciphers and modes

#
# AEAD (authenticated encryption with associated data) ciphers
#
# CONFIG_CRYPTO_AEGIS128 is not set
CONFIG_CRYPTO_CHACHA20POLY1305=m
CONFIG_CRYPTO_CCM=y
CONFIG_CRYPTO_GCM=m
# CONFIG_CRYPTO_SEQIV is not set
CONFIG_CRYPTO_ECHAINIV=y
# CONFIG_CRYPTO_ESSIV is not set
# end of AEAD (authenticated encryption with associated data) ciphers

#
# Hashes, digests, and MACs
#
CONFIG_CRYPTO_BLAKE2B=m
# CONFIG_CRYPTO_CMAC is not set
CONFIG_CRYPTO_GHASH=m
CONFIG_CRYPTO_HMAC=y
CONFIG_CRYPTO_MD4=y
CONFIG_CRYPTO_MD5=y
# CONFIG_CRYPTO_MICHAEL_MIC is not set
CONFIG_CRYPTO_POLY1305=y
CONFIG_CRYPTO_RMD160=m
CONFIG_CRYPTO_SHA1=y
CONFIG_CRYPTO_SHA256=y
CONFIG_CRYPTO_SHA512=y
CONFIG_CRYPTO_SHA3=m
CONFIG_CRYPTO_SM3=y
CONFIG_CRYPTO_SM3_GENERIC=y
CONFIG_CRYPTO_STREEBOG=y
CONFIG_CRYPTO_VMAC=y
CONFIG_CRYPTO_WP512=y
CONFIG_CRYPTO_XCBC=y
CONFIG_CRYPTO_XXHASH=m
# end of Hashes, digests, and MACs

#
# CRCs (cyclic redundancy checks)
#
CONFIG_CRYPTO_CRC32C=m
CONFIG_CRYPTO_CRC32=y
CONFIG_CRYPTO_CRCT10DIF=y
CONFIG_CRYPTO_CRC64_ROCKSOFT=y
# end of CRCs (cyclic redundancy checks)

#
# Compression
#
CONFIG_CRYPTO_DEFLATE=m
# CONFIG_CRYPTO_LZO is not set
# CONFIG_CRYPTO_842 is not set
# CONFIG_CRYPTO_LZ4 is not set
# CONFIG_CRYPTO_LZ4HC is not set
# CONFIG_CRYPTO_ZSTD is not set
# end of Compression

#
# Random number generation
#
CONFIG_CRYPTO_ANSI_CPRNG=m
CONFIG_CRYPTO_DRBG_MENU=y
CONFIG_CRYPTO_DRBG_HMAC=y
CONFIG_CRYPTO_DRBG_HASH=y
CONFIG_CRYPTO_DRBG_CTR=y
CONFIG_CRYPTO_DRBG=y
CONFIG_CRYPTO_JITTERENTROPY=y
# end of Random number generation

#
# Userspace interface
#
# end of Userspace interface

CONFIG_CRYPTO_HASH_INFO=y
# CONFIG_CRYPTO_HW is not set
CONFIG_ASYMMETRIC_KEY_TYPE=y
CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=y
CONFIG_X509_CERTIFICATE_PARSER=y
CONFIG_PKCS8_PRIVATE_KEY_PARSER=m
CONFIG_PKCS7_MESSAGE_PARSER=y
# CONFIG_PKCS7_TEST_KEY is not set
# CONFIG_SIGNED_PE_FILE_VERIFICATION is not set
# CONFIG_FIPS_SIGNATURE_SELFTEST is not set

#
# Certificates for signature checking
#
CONFIG_MODULE_SIG_KEY="certs/signing_key.pem"
# CONFIG_MODULE_SIG_KEY_TYPE_RSA is not set
CONFIG_MODULE_SIG_KEY_TYPE_ECDSA=y
CONFIG_SYSTEM_TRUSTED_KEYRING=y
CONFIG_SYSTEM_TRUSTED_KEYS=""
# CONFIG_SYSTEM_EXTRA_CERTIFICATE is not set
CONFIG_SECONDARY_TRUSTED_KEYRING=y
# CONFIG_SYSTEM_BLACKLIST_KEYRING is not set
# end of Certificates for signature checking

#
# Library routines
#
CONFIG_RAID6_PQ=m
# CONFIG_RAID6_PQ_BENCHMARK is not set
CONFIG_LINEAR_RANGES=y
CONFIG_PACKING=y
CONFIG_BITREVERSE=y
CONFIG_GENERIC_STRNCPY_FROM_USER=y
CONFIG_GENERIC_STRNLEN_USER=y
CONFIG_CORDIC=y
CONFIG_PRIME_NUMBERS=m
CONFIG_RATIONAL=m
CONFIG_GENERIC_PCI_IOMAP=y
CONFIG_GENERIC_IOMAP=y
CONFIG_STMP_DEVICE=y

#
# Crypto library routines
#
CONFIG_CRYPTO_LIB_UTILS=y
CONFIG_CRYPTO_LIB_AES=y
CONFIG_CRYPTO_LIB_GF128MUL=y
CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC=y
CONFIG_CRYPTO_LIB_CHACHA_GENERIC=y
CONFIG_CRYPTO_LIB_CHACHA=m
CONFIG_CRYPTO_LIB_CURVE25519_GENERIC=y
CONFIG_CRYPTO_LIB_CURVE25519=m
CONFIG_CRYPTO_LIB_DES=m
CONFIG_CRYPTO_LIB_POLY1305_RSIZE=1
CONFIG_CRYPTO_LIB_POLY1305_GENERIC=y
CONFIG_CRYPTO_LIB_POLY1305=m
CONFIG_CRYPTO_LIB_CHACHA20POLY1305=m
CONFIG_CRYPTO_LIB_SHA1=y
CONFIG_CRYPTO_LIB_SHA256=y
# end of Crypto library routines

CONFIG_CRC_CCITT=y
CONFIG_CRC16=y
CONFIG_CRC_T10DIF=y
CONFIG_CRC64_ROCKSOFT=y
CONFIG_CRC_ITU_T=y
CONFIG_CRC32=y
CONFIG_CRC32_SELFTEST=y
# CONFIG_CRC32_SLICEBY8 is not set
CONFIG_CRC32_SLICEBY4=y
# CONFIG_CRC32_SARWATE is not set
# CONFIG_CRC32_BIT is not set
CONFIG_CRC64=y
CONFIG_CRC4=m
CONFIG_CRC7=y
CONFIG_LIBCRC32C=m
CONFIG_CRC8=m
CONFIG_XXHASH=y
CONFIG_RANDOM32_SELFTEST=y
CONFIG_ZLIB_INFLATE=y
CONFIG_ZLIB_DEFLATE=m
CONFIG_LZO_COMPRESS=m
CONFIG_LZO_DECOMPRESS=y
CONFIG_ZSTD_COMMON=y
CONFIG_ZSTD_COMPRESS=m
CONFIG_ZSTD_DECOMPRESS=y
CONFIG_XZ_DEC=y
CONFIG_XZ_DEC_X86=y
CONFIG_XZ_DEC_POWERPC=y
CONFIG_XZ_DEC_IA64=y
CONFIG_XZ_DEC_ARM=y
CONFIG_XZ_DEC_ARMTHUMB=y
# CONFIG_XZ_DEC_SPARC is not set
CONFIG_XZ_DEC_MICROLZMA=y
CONFIG_XZ_DEC_BCJ=y
# CONFIG_XZ_DEC_TEST is not set
CONFIG_DECOMPRESS_BZIP2=y
CONFIG_DECOMPRESS_LZMA=y
CONFIG_DECOMPRESS_XZ=y
CONFIG_DECOMPRESS_LZO=y
CONFIG_DECOMPRESS_ZSTD=y
CONFIG_GENERIC_ALLOCATOR=y
CONFIG_BCH=m
CONFIG_BCH_CONST_PARAMS=y
CONFIG_INTERVAL_TREE=y
CONFIG_ASSOCIATIVE_ARRAY=y
CONFIG_HAS_IOMEM=y
CONFIG_NO_DMA=y
CONFIG_DMA_NONCOHERENT_MMAP=y
# CONFIG_DMA_API_DEBUG is not set
CONFIG_DMA_MAP_BENCHMARK=y
CONFIG_SGL_ALLOC=y
CONFIG_GLOB=y
CONFIG_GLOB_SELFTEST=y
CONFIG_GENERIC_ATOMIC64=y
CONFIG_CLZ_TAB=y
# CONFIG_IRQ_POLL is not set
CONFIG_MPILIB=y
CONFIG_LIBFDT=y
CONFIG_OID_REGISTRY=y
CONFIG_SG_POOL=y
CONFIG_UACCESS_MEMCPY=y
CONFIG_SBITMAP=y
CONFIG_PARMAN=m
CONFIG_OBJAGG=m
# end of Library routines

CONFIG_POLYNOMIAL=y

#
# Kernel hacking
#

#
# printk and dmesg options
#
# CONFIG_PRINTK_TIME is not set
CONFIG_PRINTK_CALLER=y
# CONFIG_STACKTRACE_BUILD_ID is not set
CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
CONFIG_CONSOLE_LOGLEVEL_QUIET=4
CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
CONFIG_BOOT_PRINTK_DELAY=y
# CONFIG_DYNAMIC_DEBUG is not set
CONFIG_DYNAMIC_DEBUG_CORE=y
CONFIG_SYMBOLIC_ERRNAME=y
# end of printk and dmesg options

CONFIG_DEBUG_KERNEL=y
# CONFIG_DEBUG_MISC is not set

#
# Compile-time checks and compiler options
#
CONFIG_DEBUG_INFO=y
CONFIG_AS_HAS_NON_CONST_LEB128=y
# CONFIG_DEBUG_INFO_NONE is not set
# CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT is not set
CONFIG_DEBUG_INFO_DWARF4=y
# CONFIG_DEBUG_INFO_DWARF5 is not set
CONFIG_DEBUG_INFO_REDUCED=y
CONFIG_DEBUG_INFO_COMPRESSED_NONE=y
# CONFIG_DEBUG_INFO_COMPRESSED_ZLIB is not set
# CONFIG_DEBUG_INFO_SPLIT is not set
CONFIG_PAHOLE_HAS_SPLIT_BTF=y
CONFIG_GDB_SCRIPTS=y
CONFIG_FRAME_WARN=1024
# CONFIG_STRIP_ASM_SYMS is not set
CONFIG_READABLE_ASM=y
# CONFIG_HEADERS_INSTALL is not set
CONFIG_DEBUG_SECTION_MISMATCH=y
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
CONFIG_FRAME_POINTER=y
CONFIG_VMLINUX_MAP=y
CONFIG_DEBUG_FORCE_WEAK_PER_CPU=y
# end of Compile-time checks and compiler options

#
# Generic Kernel Debugging Instruments
#
CONFIG_MAGIC_SYSRQ=y
CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=0x1
# CONFIG_MAGIC_SYSRQ_SERIAL is not set
CONFIG_DEBUG_FS=y
CONFIG_DEBUG_FS_ALLOW_ALL=y
# CONFIG_DEBUG_FS_DISALLOW_MOUNT is not set
# CONFIG_DEBUG_FS_ALLOW_NONE is not set
CONFIG_UBSAN=y
CONFIG_CC_HAS_UBSAN_BOUNDS=y
# CONFIG_UBSAN_BOUNDS is not set
CONFIG_UBSAN_SHIFT=y
# CONFIG_UBSAN_DIV_ZERO is not set
CONFIG_UBSAN_UNREACHABLE=y
# CONFIG_UBSAN_BOOL is not set
# CONFIG_UBSAN_ENUM is not set
CONFIG_TEST_UBSAN=m
CONFIG_HAVE_KCSAN_COMPILER=y
# end of Generic Kernel Debugging Instruments

#
# Networking Debugging
#
# end of Networking Debugging

#
# Memory Debugging
#
# CONFIG_PAGE_EXTENSION is not set
CONFIG_DEBUG_PAGEALLOC=y
# CONFIG_DEBUG_PAGEALLOC_ENABLE_DEFAULT is not set
CONFIG_PAGE_POISONING=y
CONFIG_DEBUG_OBJECTS=y
CONFIG_DEBUG_OBJECTS_SELFTEST=y
CONFIG_DEBUG_OBJECTS_FREE=y
CONFIG_DEBUG_OBJECTS_TIMERS=y
# CONFIG_DEBUG_OBJECTS_WORK is not set
CONFIG_DEBUG_OBJECTS_RCU_HEAD=y
CONFIG_DEBUG_OBJECTS_PERCPU_COUNTER=y
CONFIG_DEBUG_OBJECTS_ENABLE_DEFAULT=1
# CONFIG_SHRINKER_DEBUG is not set
CONFIG_DEBUG_STACK_USAGE=y
CONFIG_SCHED_STACK_END_CHECK=y
# CONFIG_DEBUG_VM is not set
CONFIG_DEBUG_NOMMU_REGIONS=y
# CONFIG_DEBUG_MEMORY_INIT is not set
CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=y
# end of Memory Debugging

CONFIG_DEBUG_SHIRQ=y

#
# Debug Oops, Lockups and Hangs
#
# CONFIG_PANIC_ON_OOPS is not set
CONFIG_PANIC_ON_OOPS_VALUE=0
CONFIG_PANIC_TIMEOUT=0
# CONFIG_SOFTLOCKUP_DETECTOR is not set
CONFIG_DETECT_HUNG_TASK=y
CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=120
# CONFIG_BOOTPARAM_HUNG_TASK_PANIC is not set
# CONFIG_WQ_WATCHDOG is not set
CONFIG_TEST_LOCKUP=m
# end of Debug Oops, Lockups and Hangs

#
# Scheduler Debugging
#
CONFIG_SCHED_DEBUG=y
CONFIG_SCHED_INFO=y
CONFIG_SCHEDSTATS=y
# end of Scheduler Debugging

# CONFIG_DEBUG_TIMEKEEPING is not set

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
CONFIG_DEBUG_RT_MUTEXES=y
# CONFIG_DEBUG_SPINLOCK is not set
# CONFIG_DEBUG_MUTEXES is not set
CONFIG_DEBUG_RWSEMS=y
CONFIG_DEBUG_LOCKING_API_SELFTESTS=y
CONFIG_LOCK_TORTURE_TEST=y
CONFIG_WW_MUTEX_SELFTEST=y
# CONFIG_SCF_TORTURE_TEST is not set
# end of Lock Debugging (spinlocks, mutexes, etc...)

# CONFIG_DEBUG_IRQFLAGS is not set
CONFIG_WARN_ALL_UNSEEDED_RANDOM=y
CONFIG_DEBUG_KOBJECT=y
CONFIG_DEBUG_KOBJECT_RELEASE=y
CONFIG_HAVE_DEBUG_BUGVERBOSE=y

#
# Debug kernel data structures
#
CONFIG_DEBUG_LIST=y
CONFIG_DEBUG_PLIST=y
# CONFIG_DEBUG_SG is not set
# CONFIG_DEBUG_NOTIFIERS is not set
CONFIG_BUG_ON_DATA_CORRUPTION=y
# CONFIG_DEBUG_MAPLE_TREE is not set
# end of Debug kernel data structures

# CONFIG_DEBUG_CREDENTIALS is not set

#
# RCU Debugging
#
CONFIG_TORTURE_TEST=y
# CONFIG_RCU_SCALE_TEST is not set
CONFIG_RCU_TORTURE_TEST=y
CONFIG_RCU_REF_SCALE_TEST=m
# CONFIG_RCU_TRACE is not set
# CONFIG_RCU_EQS_DEBUG is not set
# end of RCU Debugging

CONFIG_DEBUG_WQ_FORCE_RR_CPU=y
# CONFIG_SAMPLES is not set

#
# m68k Debugging
#
CONFIG_BOOTPARAM=y
CONFIG_BOOTPARAM_STRING="console=ttyS0,19200"
# CONFIG_FULLDEBUG is not set
CONFIG_NO_KERNEL_MSG=y
# end of m68k Debugging

#
# Kernel Testing and Coverage
#
CONFIG_KUNIT=y
CONFIG_KUNIT_DEBUGFS=y
CONFIG_KUNIT_TEST=y
CONFIG_KUNIT_EXAMPLE_TEST=y
CONFIG_KUNIT_ALL_TESTS=y
# CONFIG_KUNIT_DEFAULT_ENABLED is not set
CONFIG_NOTIFIER_ERROR_INJECTION=m
CONFIG_OF_RECONFIG_NOTIFIER_ERROR_INJECT=m
CONFIG_FAULT_INJECTION=y
CONFIG_FAIL_PAGE_ALLOC=y
# CONFIG_FAULT_INJECTION_USERCOPY is not set
CONFIG_FAIL_MAKE_REQUEST=y
# CONFIG_FAIL_IO_TIMEOUT is not set
# CONFIG_FAIL_FUTEX is not set
CONFIG_FAULT_INJECTION_DEBUG_FS=y
CONFIG_FAIL_MMC_REQUEST=y
CONFIG_CC_HAS_SANCOV_TRACE_PC=y
# CONFIG_RUNTIME_TESTING_MENU is not set
# end of Kernel Testing and Coverage

#
# Rust hacking
#
# end of Rust hacking

# CONFIG_WARN_MISSING_DOCUMENTS is not set
CONFIG_WARN_ABI_ERRORS=y
# end of Kernel hacking

--ZHxnAHRbnShX6hmY--

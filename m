Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07697C
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Apr 2023 05:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681450640; x=1712986640;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=GTKVMI22No76ddlVqFrBDYAmVFJSi9gXxQ2WU4badxI=;
  b=KVI5cO3X+m4/gIQlZca/WVc+lazNH5YboMjIEiV6HDE3U0rwGVzpD2oN
   VsPI5ORwI5LCvUhEAjK38Wa03pmPFj01eNAaE8N8+9sPnizfe3i7Nav8F
   Cj3gK5S8szw3dfGIPRAVGo9dGciDBGDIh8L/0FwsMkvGt0gXbwer9Gza7
   D5V061yvTK17Pm0ZVO1NVWumrkpwmfvigmVBxXsmhK9wX04xRR2yx4MAG
   2MY50UKOVa5mhWIQ4rwLAZURVr2Q9RhrHPJ3AvkvhqkkKnsZsnb3Ue0c6
   iuyRWMuVFtgIjT6dHmbm5luNnctZAOirGir2yh2x66XZ+mKNxLvUSFtMf
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="324014800"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="324014800"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2023 22:37:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="864074458"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="864074458"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 13 Apr 2023 22:37:17 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnC7Y-000ZH1-1E;
	Fri, 14 Apr 2023 05:37:16 +0000
Date: Fri, 14 Apr 2023 13:36:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [ceph-client:testing 14/77] fs/ceph/mds_client.c:218
 parse_reply_info_in() warn: missing unwind goto?
Message-ID: <202304141339.hI61myEG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: ceph-devel@vger.kernel.org
TO: Jeff Layton <jlayton@kernel.org>
CC: Xiubo Li <xiubli@redhat.com>
CC: "Luís Henriques" <lhenriques@suse.de>

tree:   https://github.com/ceph/ceph-client.git testing
head:   1e100514184d3b952bb0ed339bde4035c3ca946e
commit: 2267f6a66c3507bb3ffd8f73c1545091b7219a58 [14/77] ceph: fscrypt_auth handling for ceph
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: csky-randconfig-m041-20230409 (https://download.01.org/0day-ci/archive/20230414/202304141339.hI61myEG-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304141339.hI61myEG-lkp@intel.com/

smatch warnings:
fs/ceph/mds_client.c:218 parse_reply_info_in() warn: missing unwind goto?

vim +218 fs/ceph/mds_client.c

b37fe1f923fb4b Yan, Zheng       2019-01-09   96  
2f2dc053404feb Sage Weil        2009-10-06   97  /*
2f2dc053404feb Sage Weil        2009-10-06   98   * parse individual inode info
2f2dc053404feb Sage Weil        2009-10-06   99   */
2f2dc053404feb Sage Weil        2009-10-06  100  static int parse_reply_info_in(void **p, void *end,
14303d20f3ae3e Sage Weil        2010-12-14  101  			       struct ceph_mds_reply_info_in *info,
12b4629a9fb80f Ilya Dryomov     2013-12-24  102  			       u64 features)
2f2dc053404feb Sage Weil        2009-10-06  103  {
b37fe1f923fb4b Yan, Zheng       2019-01-09  104  	int err = 0;
b37fe1f923fb4b Yan, Zheng       2019-01-09  105  	u8 struct_v = 0;
b37fe1f923fb4b Yan, Zheng       2019-01-09  106  
b37fe1f923fb4b Yan, Zheng       2019-01-09  107  	if (features == (u64)-1) {
b37fe1f923fb4b Yan, Zheng       2019-01-09  108  		u32 struct_len;
b37fe1f923fb4b Yan, Zheng       2019-01-09  109  		u8 struct_compat;
b37fe1f923fb4b Yan, Zheng       2019-01-09  110  		ceph_decode_8_safe(p, end, struct_v, bad);
b37fe1f923fb4b Yan, Zheng       2019-01-09  111  		ceph_decode_8_safe(p, end, struct_compat, bad);
b37fe1f923fb4b Yan, Zheng       2019-01-09  112  		/* struct_v is expected to be >= 1. we only understand
b37fe1f923fb4b Yan, Zheng       2019-01-09  113  		 * encoding with struct_compat == 1. */
b37fe1f923fb4b Yan, Zheng       2019-01-09  114  		if (!struct_v || struct_compat != 1)
b37fe1f923fb4b Yan, Zheng       2019-01-09  115  			goto bad;
b37fe1f923fb4b Yan, Zheng       2019-01-09  116  		ceph_decode_32_safe(p, end, struct_len, bad);
b37fe1f923fb4b Yan, Zheng       2019-01-09  117  		ceph_decode_need(p, end, struct_len, bad);
b37fe1f923fb4b Yan, Zheng       2019-01-09  118  		end = *p + struct_len;
b37fe1f923fb4b Yan, Zheng       2019-01-09  119  	}
2f2dc053404feb Sage Weil        2009-10-06  120  
b37fe1f923fb4b Yan, Zheng       2019-01-09  121  	ceph_decode_need(p, end, sizeof(struct ceph_mds_reply_inode), bad);
2f2dc053404feb Sage Weil        2009-10-06  122  	info->in = *p;
2f2dc053404feb Sage Weil        2009-10-06  123  	*p += sizeof(struct ceph_mds_reply_inode) +
2f2dc053404feb Sage Weil        2009-10-06  124  		sizeof(*info->in->fragtree.splits) *
2f2dc053404feb Sage Weil        2009-10-06  125  		le32_to_cpu(info->in->fragtree.nsplits);
2f2dc053404feb Sage Weil        2009-10-06  126  
2f2dc053404feb Sage Weil        2009-10-06  127  	ceph_decode_32_safe(p, end, info->symlink_len, bad);
2f2dc053404feb Sage Weil        2009-10-06  128  	ceph_decode_need(p, end, info->symlink_len, bad);
2f2dc053404feb Sage Weil        2009-10-06  129  	info->symlink = *p;
2f2dc053404feb Sage Weil        2009-10-06  130  	*p += info->symlink_len;
2f2dc053404feb Sage Weil        2009-10-06  131  
14303d20f3ae3e Sage Weil        2010-12-14  132  	ceph_decode_copy_safe(p, end, &info->dir_layout,
14303d20f3ae3e Sage Weil        2010-12-14  133  			      sizeof(info->dir_layout), bad);
2f2dc053404feb Sage Weil        2009-10-06  134  	ceph_decode_32_safe(p, end, info->xattr_len, bad);
2f2dc053404feb Sage Weil        2009-10-06  135  	ceph_decode_need(p, end, info->xattr_len, bad);
2f2dc053404feb Sage Weil        2009-10-06  136  	info->xattr_data = *p;
2f2dc053404feb Sage Weil        2009-10-06  137  	*p += info->xattr_len;
fb01d1f8b0343f Yan, Zheng       2014-11-14  138  
b37fe1f923fb4b Yan, Zheng       2019-01-09  139  	if (features == (u64)-1) {
b37fe1f923fb4b Yan, Zheng       2019-01-09  140  		/* inline data */
b37fe1f923fb4b Yan, Zheng       2019-01-09  141  		ceph_decode_64_safe(p, end, info->inline_version, bad);
b37fe1f923fb4b Yan, Zheng       2019-01-09  142  		ceph_decode_32_safe(p, end, info->inline_len, bad);
b37fe1f923fb4b Yan, Zheng       2019-01-09  143  		ceph_decode_need(p, end, info->inline_len, bad);
b37fe1f923fb4b Yan, Zheng       2019-01-09  144  		info->inline_data = *p;
b37fe1f923fb4b Yan, Zheng       2019-01-09  145  		*p += info->inline_len;
b37fe1f923fb4b Yan, Zheng       2019-01-09  146  		/* quota */
b37fe1f923fb4b Yan, Zheng       2019-01-09  147  		err = parse_reply_info_quota(p, end, info);
b37fe1f923fb4b Yan, Zheng       2019-01-09  148  		if (err < 0)
b37fe1f923fb4b Yan, Zheng       2019-01-09  149  			goto out_bad;
b37fe1f923fb4b Yan, Zheng       2019-01-09  150  		/* pool namespace */
b37fe1f923fb4b Yan, Zheng       2019-01-09  151  		ceph_decode_32_safe(p, end, info->pool_ns_len, bad);
b37fe1f923fb4b Yan, Zheng       2019-01-09  152  		if (info->pool_ns_len > 0) {
b37fe1f923fb4b Yan, Zheng       2019-01-09  153  			ceph_decode_need(p, end, info->pool_ns_len, bad);
b37fe1f923fb4b Yan, Zheng       2019-01-09  154  			info->pool_ns_data = *p;
b37fe1f923fb4b Yan, Zheng       2019-01-09  155  			*p += info->pool_ns_len;
b37fe1f923fb4b Yan, Zheng       2019-01-09  156  		}
245ce991cca55e Jeff Layton      2019-05-29  157  
245ce991cca55e Jeff Layton      2019-05-29  158  		/* btime */
245ce991cca55e Jeff Layton      2019-05-29  159  		ceph_decode_need(p, end, sizeof(info->btime), bad);
245ce991cca55e Jeff Layton      2019-05-29  160  		ceph_decode_copy(p, &info->btime, sizeof(info->btime));
245ce991cca55e Jeff Layton      2019-05-29  161  
245ce991cca55e Jeff Layton      2019-05-29  162  		/* change attribute */
a35ead314e0b92 Jeff Layton      2019-06-06  163  		ceph_decode_64_safe(p, end, info->change_attr, bad);
b37fe1f923fb4b Yan, Zheng       2019-01-09  164  
08796873a5183b Yan, Zheng       2019-01-09  165  		/* dir pin */
08796873a5183b Yan, Zheng       2019-01-09  166  		if (struct_v >= 2) {
08796873a5183b Yan, Zheng       2019-01-09  167  			ceph_decode_32_safe(p, end, info->dir_pin, bad);
08796873a5183b Yan, Zheng       2019-01-09  168  		} else {
08796873a5183b Yan, Zheng       2019-01-09  169  			info->dir_pin = -ENODATA;
08796873a5183b Yan, Zheng       2019-01-09  170  		}
08796873a5183b Yan, Zheng       2019-01-09  171  
193e7b37628e97 David Disseldorp 2019-04-18  172  		/* snapshot birth time, remains zero for v<=2 */
193e7b37628e97 David Disseldorp 2019-04-18  173  		if (struct_v >= 3) {
193e7b37628e97 David Disseldorp 2019-04-18  174  			ceph_decode_need(p, end, sizeof(info->snap_btime), bad);
193e7b37628e97 David Disseldorp 2019-04-18  175  			ceph_decode_copy(p, &info->snap_btime,
193e7b37628e97 David Disseldorp 2019-04-18  176  					 sizeof(info->snap_btime));
193e7b37628e97 David Disseldorp 2019-04-18  177  		} else {
193e7b37628e97 David Disseldorp 2019-04-18  178  			memset(&info->snap_btime, 0, sizeof(info->snap_btime));
193e7b37628e97 David Disseldorp 2019-04-18  179  		}
193e7b37628e97 David Disseldorp 2019-04-18  180  
e7f72952508ac4 Yanhu Cao        2020-08-28  181  		/* snapshot count, remains zero for v<=3 */
e7f72952508ac4 Yanhu Cao        2020-08-28  182  		if (struct_v >= 4) {
e7f72952508ac4 Yanhu Cao        2020-08-28  183  			ceph_decode_64_safe(p, end, info->rsnaps, bad);
e7f72952508ac4 Yanhu Cao        2020-08-28  184  		} else {
e7f72952508ac4 Yanhu Cao        2020-08-28  185  			info->rsnaps = 0;
e7f72952508ac4 Yanhu Cao        2020-08-28  186  		}
e7f72952508ac4 Yanhu Cao        2020-08-28  187  
2267f6a66c3507 Jeff Layton      2020-07-27  188  		if (struct_v >= 5) {
2267f6a66c3507 Jeff Layton      2020-07-27  189  			u32 alen;
2267f6a66c3507 Jeff Layton      2020-07-27  190  
2267f6a66c3507 Jeff Layton      2020-07-27  191  			ceph_decode_32_safe(p, end, alen, bad);
2267f6a66c3507 Jeff Layton      2020-07-27  192  
2267f6a66c3507 Jeff Layton      2020-07-27  193  			while (alen--) {
2267f6a66c3507 Jeff Layton      2020-07-27  194  				u32 len;
2267f6a66c3507 Jeff Layton      2020-07-27  195  
2267f6a66c3507 Jeff Layton      2020-07-27  196  				/* key */
2267f6a66c3507 Jeff Layton      2020-07-27  197  				ceph_decode_32_safe(p, end, len, bad);
2267f6a66c3507 Jeff Layton      2020-07-27  198  				ceph_decode_skip_n(p, end, len, bad);
2267f6a66c3507 Jeff Layton      2020-07-27  199  				/* value */
2267f6a66c3507 Jeff Layton      2020-07-27  200  				ceph_decode_32_safe(p, end, len, bad);
2267f6a66c3507 Jeff Layton      2020-07-27  201  				ceph_decode_skip_n(p, end, len, bad);
2267f6a66c3507 Jeff Layton      2020-07-27  202  			}
2267f6a66c3507 Jeff Layton      2020-07-27  203  		}
2267f6a66c3507 Jeff Layton      2020-07-27  204  
2267f6a66c3507 Jeff Layton      2020-07-27  205  		/* fscrypt flag -- ignore */
2267f6a66c3507 Jeff Layton      2020-07-27  206  		if (struct_v >= 6)
2267f6a66c3507 Jeff Layton      2020-07-27  207  			ceph_decode_skip_8(p, end, bad);
2267f6a66c3507 Jeff Layton      2020-07-27  208  
2267f6a66c3507 Jeff Layton      2020-07-27  209  		info->fscrypt_auth = NULL;
2267f6a66c3507 Jeff Layton      2020-07-27  210  		info->fscrypt_auth_len = 0;
2267f6a66c3507 Jeff Layton      2020-07-27  211  		info->fscrypt_file = NULL;
2267f6a66c3507 Jeff Layton      2020-07-27  212  		info->fscrypt_file_len = 0;
2267f6a66c3507 Jeff Layton      2020-07-27  213  		if (struct_v >= 7) {
2267f6a66c3507 Jeff Layton      2020-07-27  214  			ceph_decode_32_safe(p, end, info->fscrypt_auth_len, bad);
2267f6a66c3507 Jeff Layton      2020-07-27  215  			if (info->fscrypt_auth_len) {
2267f6a66c3507 Jeff Layton      2020-07-27  216  				info->fscrypt_auth = kmalloc(info->fscrypt_auth_len, GFP_KERNEL);
2267f6a66c3507 Jeff Layton      2020-07-27  217  				if (!info->fscrypt_auth)
2267f6a66c3507 Jeff Layton      2020-07-27 @218  					return -ENOMEM;
2267f6a66c3507 Jeff Layton      2020-07-27  219  				ceph_decode_copy_safe(p, end, info->fscrypt_auth,
2267f6a66c3507 Jeff Layton      2020-07-27  220  						      info->fscrypt_auth_len, bad);
2267f6a66c3507 Jeff Layton      2020-07-27  221  			}
2267f6a66c3507 Jeff Layton      2020-07-27  222  			ceph_decode_32_safe(p, end, info->fscrypt_file_len, bad);
2267f6a66c3507 Jeff Layton      2020-07-27  223  			if (info->fscrypt_file_len) {
2267f6a66c3507 Jeff Layton      2020-07-27  224  				info->fscrypt_file = kmalloc(info->fscrypt_file_len, GFP_KERNEL);
2267f6a66c3507 Jeff Layton      2020-07-27  225  				if (!info->fscrypt_file)
2267f6a66c3507 Jeff Layton      2020-07-27  226  					return -ENOMEM;
2267f6a66c3507 Jeff Layton      2020-07-27  227  				ceph_decode_copy_safe(p, end, info->fscrypt_file,
2267f6a66c3507 Jeff Layton      2020-07-27  228  						      info->fscrypt_file_len, bad);
2267f6a66c3507 Jeff Layton      2020-07-27  229  			}
2267f6a66c3507 Jeff Layton      2020-07-27  230  		}
b37fe1f923fb4b Yan, Zheng       2019-01-09  231  		*p = end;
b37fe1f923fb4b Yan, Zheng       2019-01-09  232  	} else {
2267f6a66c3507 Jeff Layton      2020-07-27  233  		/* legacy (unversioned) struct */
fb01d1f8b0343f Yan, Zheng       2014-11-14  234  		if (features & CEPH_FEATURE_MDS_INLINE_DATA) {
fb01d1f8b0343f Yan, Zheng       2014-11-14  235  			ceph_decode_64_safe(p, end, info->inline_version, bad);
fb01d1f8b0343f Yan, Zheng       2014-11-14  236  			ceph_decode_32_safe(p, end, info->inline_len, bad);
fb01d1f8b0343f Yan, Zheng       2014-11-14  237  			ceph_decode_need(p, end, info->inline_len, bad);
fb01d1f8b0343f Yan, Zheng       2014-11-14  238  			info->inline_data = *p;
fb01d1f8b0343f Yan, Zheng       2014-11-14  239  			*p += info->inline_len;
fb01d1f8b0343f Yan, Zheng       2014-11-14  240  		} else
fb01d1f8b0343f Yan, Zheng       2014-11-14  241  			info->inline_version = CEPH_INLINE_NONE;
fb01d1f8b0343f Yan, Zheng       2014-11-14  242  
fb18a57568c2b8 Luis Henriques   2018-01-05  243  		if (features & CEPH_FEATURE_MDS_QUOTA) {
b37fe1f923fb4b Yan, Zheng       2019-01-09  244  			err = parse_reply_info_quota(p, end, info);
b37fe1f923fb4b Yan, Zheng       2019-01-09  245  			if (err < 0)
b37fe1f923fb4b Yan, Zheng       2019-01-09  246  				goto out_bad;
fb18a57568c2b8 Luis Henriques   2018-01-05  247  		} else {
fb18a57568c2b8 Luis Henriques   2018-01-05  248  			info->max_bytes = 0;
fb18a57568c2b8 Luis Henriques   2018-01-05  249  			info->max_files = 0;
fb18a57568c2b8 Luis Henriques   2018-01-05  250  		}
fb18a57568c2b8 Luis Henriques   2018-01-05  251  
779fe0fb8e1883 Yan, Zheng       2016-03-07  252  		info->pool_ns_len = 0;
779fe0fb8e1883 Yan, Zheng       2016-03-07  253  		info->pool_ns_data = NULL;
5ea5c5e0a7f70b Yan, Zheng       2016-02-14  254  		if (features & CEPH_FEATURE_FS_FILE_LAYOUT_V2) {
5ea5c5e0a7f70b Yan, Zheng       2016-02-14  255  			ceph_decode_32_safe(p, end, info->pool_ns_len, bad);
779fe0fb8e1883 Yan, Zheng       2016-03-07  256  			if (info->pool_ns_len > 0) {
5ea5c5e0a7f70b Yan, Zheng       2016-02-14  257  				ceph_decode_need(p, end, info->pool_ns_len, bad);
779fe0fb8e1883 Yan, Zheng       2016-03-07  258  				info->pool_ns_data = *p;
5ea5c5e0a7f70b Yan, Zheng       2016-02-14  259  				*p += info->pool_ns_len;
779fe0fb8e1883 Yan, Zheng       2016-03-07  260  			}
5ea5c5e0a7f70b Yan, Zheng       2016-02-14  261  		}
08796873a5183b Yan, Zheng       2019-01-09  262  
245ce991cca55e Jeff Layton      2019-05-29  263  		if (features & CEPH_FEATURE_FS_BTIME) {
245ce991cca55e Jeff Layton      2019-05-29  264  			ceph_decode_need(p, end, sizeof(info->btime), bad);
245ce991cca55e Jeff Layton      2019-05-29  265  			ceph_decode_copy(p, &info->btime, sizeof(info->btime));
a35ead314e0b92 Jeff Layton      2019-06-06  266  			ceph_decode_64_safe(p, end, info->change_attr, bad);
245ce991cca55e Jeff Layton      2019-05-29  267  		}
245ce991cca55e Jeff Layton      2019-05-29  268  
08796873a5183b Yan, Zheng       2019-01-09  269  		info->dir_pin = -ENODATA;
e7f72952508ac4 Yanhu Cao        2020-08-28  270  		/* info->snap_btime and info->rsnaps remain zero */
b37fe1f923fb4b Yan, Zheng       2019-01-09  271  	}
2f2dc053404feb Sage Weil        2009-10-06  272  	return 0;
2f2dc053404feb Sage Weil        2009-10-06  273  bad:
b37fe1f923fb4b Yan, Zheng       2019-01-09  274  	err = -EIO;
b37fe1f923fb4b Yan, Zheng       2019-01-09  275  out_bad:
2f2dc053404feb Sage Weil        2009-10-06  276  	return err;
2f2dc053404feb Sage Weil        2009-10-06  277  }
2f2dc053404feb Sage Weil        2009-10-06  278  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

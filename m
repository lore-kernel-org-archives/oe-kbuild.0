Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF0631ED71
	for <oe-kbuild@lists.linux.dev>; Fri, 19 Dec 2025 14:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766155121; cv=none; b=dhgJUBG8KRWDITIqOMZQxkeVC6Zt9iD8Mp/KWCFowlAWzuFIpq938N08LPzv320tj8XciuXT7Kp4p4UqxsNP3Awu3a84Xx26t5MBTNnU53NrLIFDnuX1Zg38t+ba9Ykcslueh6vBBlRLGrPPyTaywTu5pEbw9EbYVCUrgxW8/dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766155121; c=relaxed/simple;
	bh=82qynce+AIhSsN92+W8QWWurEb/lqn9fmuV2UtXaGJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BqNY6LTM0aqrFUft5K0R5NFU48dTYxjqIJFN/fDgBBAkYnZtV77NrXETUcJIH9Ysc7DHPcfW3cedtX2bk+dWmnpuwk7BIfKxv4mrmQ5dyZwzgh3dO1aun/5So7d6Ur40PSZIhAGPuaGV7s+OmyiuR9uRFpNntdQvFYL8DKzCtf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G9yuwyj1; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G9yuwyj1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766155117; x=1797691117;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=82qynce+AIhSsN92+W8QWWurEb/lqn9fmuV2UtXaGJQ=;
  b=G9yuwyj1cBZS2AZNcsxqYOTNRFhbVlQRS19PDH4t29/c8G0EjrM29vfm
   vA6bFB5Giq7CG+neu4f1gQxpFHaHCNe/G65ARY7A8cnQR50nzGOxs6Obm
   NcJLZzl1g7gIA21LgPlBv8omPmmE0ya142dhcFaZ0Z1xuSF9SrtizDBUV
   QRbWJcNX1PLRd+vDJApFj6jjUohvjNyGWwUH97vIFWYbPLubluE9JHS8O
   UwMOmTtTBBqZoDWaJf58j9WIgo1eIfB8BCeiKfKLvJGrMFolks4rb24oo
   wPYAujW8hNuw18/mwpN0ajC3UC9rQhMavnCviyxEOUlKK/aN0gjvZvF1w
   g==;
X-CSE-ConnectionGUID: u66/+k9BSWiQEimVllsZaA==
X-CSE-MsgGUID: ZTw9OlqpQBmQml3Cy+G80g==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="68156580"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="68156580"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 06:38:31 -0800
X-CSE-ConnectionGUID: OyRbB7vHRaa6tQqAmAw9+w==
X-CSE-MsgGUID: 904ivKhvQKueUthiG/JrPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="236300055"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 Dec 2025 06:38:29 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWbch-000000003db-0dwg;
	Fri, 19 Dec 2025 14:38:27 +0000
Date: Fri, 19 Dec 2025 22:37:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: security/apparmor/label.c:1886 aa_label_strn_parse() warn:
 potentially one past the end of array 'vec[i]'
Message-ID: <202512192253.FO3umbD0-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Suren Baghdasaryan <surenb@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dd9b004b7ff3289fb7bae35130c0a5c0537266af
commit: 07438779313caafe52ac1a1a6958d735a5938988 alloc_tag: avoid current->alloc_tag manipulations when profiling is disabled
date:   11 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 11 months ago
config: x86_64-randconfig-161-20251213 (https://download.01.org/0day-ci/archive/20251219/202512192253.FO3umbD0-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512192253.FO3umbD0-lkp@intel.com/

smatch warnings:
security/apparmor/label.c:1886 aa_label_strn_parse() warn: potentially one past the end of array 'vec[i]'
security/apparmor/label.c:1886 aa_label_strn_parse() warn: potentially one past the end of array 'vec[i]'

vim +1886 security/apparmor/label.c

f1bd904175e8190 John Johansen 2017-06-09  1841  
f1bd904175e8190 John Johansen 2017-06-09  1842  /**
95652cac83605d9 John Johansen 2017-09-06  1843   * aa_label_strn_parse - parse, validate and convert a text string to a label
f1bd904175e8190 John Johansen 2017-06-09  1844   * @base: base label to use for lookups (NOT NULL)
f1bd904175e8190 John Johansen 2017-06-09  1845   * @str: null terminated text string (NOT NULL)
95652cac83605d9 John Johansen 2017-09-06  1846   * @n: length of str to parse, will stop at \0 if encountered before n
f1bd904175e8190 John Johansen 2017-06-09  1847   * @gfp: allocation type
f1bd904175e8190 John Johansen 2017-06-09  1848   * @create: true if should create compound labels if they don't exist
f1bd904175e8190 John Johansen 2017-06-09  1849   * @force_stack: true if should stack even if no leading &
f1bd904175e8190 John Johansen 2017-06-09  1850   *
f1bd904175e8190 John Johansen 2017-06-09  1851   * Returns: the matching refcounted label if present
f1bd904175e8190 John Johansen 2017-06-09  1852   *     else ERRPTR
f1bd904175e8190 John Johansen 2017-06-09  1853   */
95652cac83605d9 John Johansen 2017-09-06  1854  struct aa_label *aa_label_strn_parse(struct aa_label *base, const char *str,
95652cac83605d9 John Johansen 2017-09-06  1855  				     size_t n, gfp_t gfp, bool create,
95652cac83605d9 John Johansen 2017-09-06  1856  				     bool force_stack)
f1bd904175e8190 John Johansen 2017-06-09  1857  {
f1bd904175e8190 John Johansen 2017-06-09  1858  	DEFINE_VEC(profile, vec);
f1bd904175e8190 John Johansen 2017-06-09  1859  	struct aa_label *label, *currbase = base;
f1bd904175e8190 John Johansen 2017-06-09  1860  	int i, len, stack = 0, error;
95652cac83605d9 John Johansen 2017-09-06  1861  	const char *end = str + n;
6e0654d20ed9679 John Johansen 2017-09-06  1862  	const char *split;
f1bd904175e8190 John Johansen 2017-06-09  1863  
f1bd904175e8190 John Johansen 2017-06-09  1864  	AA_BUG(!base);
f1bd904175e8190 John Johansen 2017-06-09  1865  	AA_BUG(!str);
f1bd904175e8190 John Johansen 2017-06-09  1866  
95652cac83605d9 John Johansen 2017-09-06  1867  	str = skipn_spaces(str, n);
511f7b5b835726e John Johansen 2021-12-14  1868  	if (str == NULL || (AA_DEBUG_LABEL && *str == '_' &&
511f7b5b835726e John Johansen 2021-12-14  1869  			    base != &root_ns->unconfined->label))
95652cac83605d9 John Johansen 2017-09-06  1870  		return ERR_PTR(-EINVAL);
475bdda1f000747 John Johansen 2017-09-08  1871  
95652cac83605d9 John Johansen 2017-09-06  1872  	len = label_count_strn_entries(str, end - str);
f1bd904175e8190 John Johansen 2017-06-09  1873  	if (*str == '&' || force_stack) {
f1bd904175e8190 John Johansen 2017-06-09  1874  		/* stack on top of base */
f1bd904175e8190 John Johansen 2017-06-09  1875  		stack = base->size;
f1bd904175e8190 John Johansen 2017-06-09  1876  		len += stack;
f1bd904175e8190 John Johansen 2017-06-09  1877  		if (*str == '&')
f1bd904175e8190 John Johansen 2017-06-09  1878  			str++;
f1bd904175e8190 John Johansen 2017-06-09  1879  	}
26b7899510ae243 John Johansen 2017-08-06  1880  
f1bd904175e8190 John Johansen 2017-06-09  1881  	error = vec_setup(profile, vec, len, gfp);
f1bd904175e8190 John Johansen 2017-06-09  1882  	if (error)
f1bd904175e8190 John Johansen 2017-06-09  1883  		return ERR_PTR(error);
f1bd904175e8190 John Johansen 2017-06-09  1884  
f1bd904175e8190 John Johansen 2017-06-09  1885  	for (i = 0; i < stack; i++)
f1bd904175e8190 John Johansen 2017-06-09 @1886  		vec[i] = aa_get_profile(base->vec[i]);
f1bd904175e8190 John Johansen 2017-06-09  1887  
95652cac83605d9 John Johansen 2017-09-06  1888  	for (split = aa_label_strn_split(str, end - str), i = stack;
6e0654d20ed9679 John Johansen 2017-09-06  1889  	     split && i < len; i++) {
f1bd904175e8190 John Johansen 2017-06-09  1890  		vec[i] = fqlookupn_profile(base, currbase, str, split - str);
f1bd904175e8190 John Johansen 2017-06-09  1891  		if (!vec[i])
f1bd904175e8190 John Johansen 2017-06-09  1892  			goto fail;
f1bd904175e8190 John Johansen 2017-06-09  1893  		/*
f1bd904175e8190 John Johansen 2017-06-09  1894  		 * if component specified a new ns it becomes the new base
f1bd904175e8190 John Johansen 2017-06-09  1895  		 * so that subsequent lookups are relative to it
f1bd904175e8190 John Johansen 2017-06-09  1896  		 */
f1bd904175e8190 John Johansen 2017-06-09  1897  		if (vec[i]->ns != labels_ns(currbase))
f1bd904175e8190 John Johansen 2017-06-09  1898  			currbase = &vec[i]->label;
f1bd904175e8190 John Johansen 2017-06-09  1899  		str = split + 3;
95652cac83605d9 John Johansen 2017-09-06  1900  		split = aa_label_strn_split(str, end - str);
f1bd904175e8190 John Johansen 2017-06-09  1901  	}
f1bd904175e8190 John Johansen 2017-06-09  1902  	/* last element doesn't have a split */
f1bd904175e8190 John Johansen 2017-06-09  1903  	if (i < len) {
95652cac83605d9 John Johansen 2017-09-06  1904  		vec[i] = fqlookupn_profile(base, currbase, str, end - str);
f1bd904175e8190 John Johansen 2017-06-09  1905  		if (!vec[i])
f1bd904175e8190 John Johansen 2017-06-09  1906  			goto fail;
f1bd904175e8190 John Johansen 2017-06-09  1907  	}
f1bd904175e8190 John Johansen 2017-06-09  1908  	if (len == 1)
f1bd904175e8190 John Johansen 2017-06-09  1909  		/* no need to free vec as len < LOCAL_VEC_ENTRIES */
f1bd904175e8190 John Johansen 2017-06-09  1910  		return &vec[0]->label;
f1bd904175e8190 John Johansen 2017-06-09  1911  
f1bd904175e8190 John Johansen 2017-06-09  1912  	len -= aa_vec_unique(vec, len, VEC_FLAG_TERMINATE);
f1bd904175e8190 John Johansen 2017-06-09  1913  	/* TODO: deal with reference labels */
f1bd904175e8190 John Johansen 2017-06-09  1914  	if (len == 1) {
f1bd904175e8190 John Johansen 2017-06-09  1915  		label = aa_get_label(&vec[0]->label);
f1bd904175e8190 John Johansen 2017-06-09  1916  		goto out;
f1bd904175e8190 John Johansen 2017-06-09  1917  	}
f1bd904175e8190 John Johansen 2017-06-09  1918  
f1bd904175e8190 John Johansen 2017-06-09  1919  	if (create)
f1bd904175e8190 John Johansen 2017-06-09  1920  		label = aa_vec_find_or_create_label(vec, len, gfp);
f1bd904175e8190 John Johansen 2017-06-09  1921  	else
f1bd904175e8190 John Johansen 2017-06-09  1922  		label = vec_find(vec, len);
f1bd904175e8190 John Johansen 2017-06-09  1923  	if (!label)
f1bd904175e8190 John Johansen 2017-06-09  1924  		goto fail;
f1bd904175e8190 John Johansen 2017-06-09  1925  
f1bd904175e8190 John Johansen 2017-06-09  1926  out:
f1bd904175e8190 John Johansen 2017-06-09  1927  	/* use adjusted len from after vec_unique, not original */
f1bd904175e8190 John Johansen 2017-06-09  1928  	vec_cleanup(profile, vec, len);
f1bd904175e8190 John Johansen 2017-06-09  1929  	return label;
f1bd904175e8190 John Johansen 2017-06-09  1930  
f1bd904175e8190 John Johansen 2017-06-09  1931  fail:
f1bd904175e8190 John Johansen 2017-06-09  1932  	label = ERR_PTR(-ENOENT);
f1bd904175e8190 John Johansen 2017-06-09  1933  	goto out;
f1bd904175e8190 John Johansen 2017-06-09  1934  }
f1bd904175e8190 John Johansen 2017-06-09  1935  

:::::: The code at line 1886 was first introduced by commit
:::::: f1bd904175e8190ce14aedee37e207ab51fe3b30 apparmor: add the base fns() for domain labels

:::::: TO: John Johansen <john.johansen@canonical.com>
:::::: CC: John Johansen <john.johansen@canonical.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

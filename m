Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0E4180A99
	for <oe-kbuild@lists.linux.dev>; Wed, 12 Jun 2024 17:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718214309; cv=none; b=LCrmxyAM8D6C0QdDHon5uSJzp9h5d27wA3FJtNVZmMjHQXj8DS05rtaOwFfLe7z4h1/X0JyH2A4FNWFdDzthoKeg2ziEWij0u9LFfe9PqJQJUemYmCTot29k7RNQzcuA2g/+6kzXgAT3e6v9De9N9DdjvwD6SYqR391tO8Agwlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718214309; c=relaxed/simple;
	bh=Nr5D2+RZjteSqUfcRgUqmlu2ZOs4GZZwnrjyjmrUzMc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lzmg9v0aBmjnlr/y94HLZdWEkfa1YliL+aGhyPvLbI18dgMo43UxOZSV317IKD7NW9js9d8npzoz3oaGlEJliTKBj/x3p+d3k8rOt7sRuODq2fs3IAbye5L89+8U+mfcknJLpUBwbzxpZkyk2WzFKeD3dai7dxIheufF959iznk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nZeAlnV/; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nZeAlnV/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718214307; x=1749750307;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Nr5D2+RZjteSqUfcRgUqmlu2ZOs4GZZwnrjyjmrUzMc=;
  b=nZeAlnV/6+7s4BzRp44Ha86vuHkok9lZR7TsSxxIz+P9zK5zmizPqvnE
   8ZwExoueR7UmCoO8FiX97NNpSSL55SA9XxVX79tkafe2eIPurBDvgSxTa
   gOHXLkw4uQS7IrrU5xPzFqEK7mebq6OxpQckLYncx6vVmjYNTVzxzbBRO
   Wt3KQvUJj+1RjstKNFxppVAMNnR434KrwddIRAqkm+Mz4/ANxFv/jmx/8
   jZjaC4gyVXpte2brV2ElKzW6kjBR+zUDFjmAA5D1Ehpgjvs14XqeoxONx
   bO3uS05SP5/PpX58rTeE7fpKW8MRGjBfUaHkjWacvZ2Ki94zGcaw5YZAw
   Q==;
X-CSE-ConnectionGUID: XJEUrLZ7Tc6jIIPwAZrdyA==
X-CSE-MsgGUID: 4uXB/7c0SSyQrpPAeSWv0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="25676161"
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; 
   d="scan'208";a="25676161"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 10:45:06 -0700
X-CSE-ConnectionGUID: J6mfj8mTT1Sn4It5HYRFWQ==
X-CSE-MsgGUID: X/M1pOqCR1yagPz4mfKuaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; 
   d="scan'208";a="39972316"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 12 Jun 2024 10:45:04 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHS1u-0001mc-1H;
	Wed, 12 Jun 2024 17:45:02 +0000
Date: Thu, 13 Jun 2024 01:44:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [trace:ring-buffer/core 7/13] kernel/trace/ring_buffer.c:1817
 rb_meta_validate_events() error: uninitialized symbol 'head_page'.
Message-ID: <202406130130.JtTGRf7W-lkp@intel.com>
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
TO: "Steven Rostedt (Google)" <rostedt@goodmis.org>

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace ring-buffer/core
head:   640e052ba42d577a7f57052dbee714cf470dd145
commit: ab776f502cfd06bb217d62cb6f4408349246a233 [7/13] ring-buffer: Validate boot range memory events
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: i386-randconfig-141-20240612 (https://download.01.org/0day-ci/archive/20240613/202406130130.JtTGRf7W-lkp@intel.com/config)
compiler: gcc-12 (Ubuntu 12.3.0-9ubuntu2) 12.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406130130.JtTGRf7W-lkp@intel.com/

smatch warnings:
kernel/trace/ring_buffer.c:1817 rb_meta_validate_events() error: uninitialized symbol 'head_page'.

vim +/head_page +1817 kernel/trace/ring_buffer.c

ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1742) 
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1743) /* If the meta data has been validated, now validate the events */
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1744) static void rb_meta_validate_events(struct ring_buffer_per_cpu *cpu_buffer)
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1745) {
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1746) 	struct ring_buffer_meta *meta = cpu_buffer->ring_meta;
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1747) 	struct buffer_page *head_page;
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1748) 	unsigned long entry_bytes = 0;
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1749) 	unsigned long entries = 0;
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1750) 	int ret;
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1751) 	int i;
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1752) 
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1753) 	if (!meta || !meta->head_buffer)
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1754) 		return;
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1755) 
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1756) 	/* Do the reader page first */
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1757) 	ret = rb_validate_buffer(cpu_buffer->reader_page->page, cpu_buffer->cpu);
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1758) 	if (ret < 0) {
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1759) 		pr_info("Ring buffer reader page is invalid\n");
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1760) 		goto invalid;
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1761) 	}
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1762) 	entries += ret;
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1763) 	entry_bytes += local_read(&cpu_buffer->reader_page->page->commit);
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1764) 	local_set(&cpu_buffer->reader_page->entries, ret);
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1765) 
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1766) 	head_page = cpu_buffer->head_page;
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1767) 
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1768) 	/* If both the head and commit are on the reader_page then we are done. */
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1769) 	if (head_page == cpu_buffer->reader_page &&
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1770) 	    head_page == cpu_buffer->commit_page)
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1771) 		goto done;
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1772) 
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1773) 	/* Iterate until finding the commit page */
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1774) 	for (i = 0; i < meta->nr_subbufs + 1; i++, rb_inc_page(&head_page)) {
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1775) 
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1776) 		/* Reader page has already been done */
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1777) 		if (head_page == cpu_buffer->reader_page)
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1778) 			continue;
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1779) 
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1780) 		ret = rb_validate_buffer(head_page->page, cpu_buffer->cpu);
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1781) 		if (ret < 0) {
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1782) 			pr_info("Ring buffer meta [%d] invalid buffer page\n",
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1783) 				cpu_buffer->cpu);
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1784) 			goto invalid;
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1785) 		}
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1786) 		entries += ret;
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1787) 		entry_bytes += local_read(&head_page->page->commit);
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1788) 		local_set(&cpu_buffer->head_page->entries, ret);
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1789) 
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1790) 		if (head_page == cpu_buffer->commit_page)
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1791) 			break;
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1792) 	}
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1793) 
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1794) 	if (head_page != cpu_buffer->commit_page) {
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1795) 		pr_info("Ring buffer meta [%d] commit page not found\n",
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1796) 			cpu_buffer->cpu);
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1797) 		goto invalid;
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1798) 	}
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1799)  done:
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1800) 	local_set(&cpu_buffer->entries, entries);
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1801) 	local_set(&cpu_buffer->entries_bytes, entry_bytes);
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1802) 
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1803) 	pr_info("Ring buffer meta [%d] is from previous boot!\n", cpu_buffer->cpu);
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1804) 	return;
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1805) 
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1806)  invalid:
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1807) 	/* The content of the buffers are invalid, reset the meta data */
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1808) 	meta->head_buffer = 0;
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1809) 	meta->commit_buffer = 0;
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1810) 
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1811) 	/* Reset the reader page */
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1812) 	local_set(&cpu_buffer->reader_page->entries, 0);
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1813) 	local_set(&cpu_buffer->reader_page->page->commit, 0);
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1814) 
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1815) 	/* Reset all the subbuffers */
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1816) 	for (i = 0; i < meta->nr_subbufs - 1; i++, rb_inc_page(&head_page)) {
ab776f502cfd06 Steven Rostedt (Google  2024-06-11 @1817) 		local_set(&head_page->entries, 0);
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1818) 		local_set(&head_page->page->commit, 0);
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1819) 	}
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1820) }
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1821) 

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

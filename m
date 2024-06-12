Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C40180A93
	for <oe-kbuild@lists.linux.dev>; Wed, 12 Jun 2024 17:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718214963; cv=none; b=KvodgtmUZKi+eoNuV/0MtO9sAmRymwVovBg6nt713GKtH9T+vOdK+HviYk72wJhNKXRI738AkzljOAVthhEkJF65k6KnmEWzyuvj/C8rDIPhOsQvv39O6wie7vKJNhmOjVvCkmRK1KMr1AIl5D2XmSiwhU3tcvPlHDpVQbgDMqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718214963; c=relaxed/simple;
	bh=kjXnqITOCXKQbqhL//7UtkdojvaYLKHWUvaDTgZsslk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=etOFG8dwBLklij8z4cpNneeSqdDpCBWa3deRU9qzRENJLO6m0gtMdxXA4PstqU1YzoZXBebqufgw5CD4y8v79trOuqn0rD1nTTsLXEkA9AAlJegbSD+hdfj7enOTBwvb/IA6NWTJctpeXG6JNmcpE2s3eBysVNvDbcZnqRbbC+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZnxXaSxv; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZnxXaSxv"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42172ed3597so1023065e9.0
        for <oe-kbuild@lists.linux.dev>; Wed, 12 Jun 2024 10:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718214960; x=1718819760; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tvJCQXS3/Tl+3mYlxlklY6MBoMrYDOVhMrYLnEZI3dE=;
        b=ZnxXaSxvACg8exiSxvYAKQVupzcVcH6r04jQ4e8hILzGNbAPpZdRDKXbCYC/69KOp8
         G5O4yaPd8fL+xorn5/H/VhvWQQxlt/O0hSP4ss7m3KmpzmnK8OLJLckolkE3Z/Ohg5Nv
         Xms69juVugDPs/xX0IuilaOGqYy4eE+13jOOSX8EFMoCLJJcsLloIvLsZLN0NAg95/+3
         hyGDVQi1tgbFXkconVLKzwOshG9xdISCe8Efuo8DezNOfrRrp2fCkOtVtbQrjaG2KGjh
         0yGLx+imqdo/nKo34Y8UFlVQFr1my22zMj0XMjUDZXqwNLcyHiW5CfmENx+Scuxfl9RN
         qbvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718214960; x=1718819760;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tvJCQXS3/Tl+3mYlxlklY6MBoMrYDOVhMrYLnEZI3dE=;
        b=W9KPomYMB1yZhAzCAZfSxy5txTxFWOS70zUIJUNXfi7Lg+dk8hwluAdb6eUGBbpEye
         9PnPcD7cSnJnu0Ao/l5Pv75pmGmMjYuJacW3G1OmzOJsofGeF47u+To5fvma3z7YbP41
         EcSbRmJdpEqQRnZM2QFXuCqKre8R68XuxL0Aguqx+StV5W9el8aH7rYtKIk1U9yDWFRR
         WFX1j0YTFfQdiT8kxDc0luMXHBWH76MDBvloHdm5ArRyi89+uvOAab6Y1xlQvAQDi+sQ
         mHMs2mMeEwVLsIeWCvEeXE0LP3DI/FTJ2p7iCFe3mPGk0LqcxPiPqLUNPlBLaOXVhpz1
         om6w==
X-Gm-Message-State: AOJu0Yw90JptMFn+K21bnQoQV6FyVDLAbxgZZwhgxZjt65h6xrJe3J9T
	BZYZssjbTqd30BTXKIsYcbJZ+qnnDz6OlgTrzEcJUIjmafr4Jhgs5BKxqdnbgV9BiT3U8TntwjY
	z
X-Google-Smtp-Source: AGHT+IFoKhOeHxPYxrsA1enZPu6y9KEeOGeQNAPrF9ALvtH32osWCLosEJykDr8cajBHUdI2GMQsIw==
X-Received: by 2002:a05:600c:444c:b0:41b:4caa:554c with SMTP id 5b1f17b1804b1-422b6ebfc0bmr4556065e9.2.1718214959638;
        Wed, 12 Jun 2024 10:55:59 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35ef5d2e73dsm17468817f8f.16.2024.06.12.10.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 10:55:59 -0700 (PDT)
Date: Wed, 12 Jun 2024 20:55:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [trace:ring-buffer/core 7/13] kernel/trace/ring_buffer.c:1817
 rb_meta_validate_events() error: uninitialized symbol 'head_page'.
Message-ID: <dda74df5-db9b-42dd-8cb3-5afa641f1479@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace ring-buffer/core
head:   640e052ba42d577a7f57052dbee714cf470dd145
commit: ab776f502cfd06bb217d62cb6f4408349246a233 [7/13] ring-buffer: Validate boot range memory events
config: i386-randconfig-141-20240612 (https://download.01.org/0day-ci/archive/20240613/202406130130.JtTGRf7W-lkp@intel.com/config)
compiler: gcc-12 (Ubuntu 12.3.0-9ubuntu2) 12.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202406130130.JtTGRf7W-lkp@intel.com/

smatch warnings:
kernel/trace/ring_buffer.c:1817 rb_meta_validate_events() error: uninitialized symbol 'head_page'.

vim +/head_page +1817 kernel/trace/ring_buffer.c

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

head_page not set

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
                                                                                                                        ^^^^^^^^^
Uninitialized here.  Btw, what's going on with nr_subbufs +/- 1?  Why
is it + 1 earlier and - 1 here?

ab776f502cfd06 Steven Rostedt (Google  2024-06-11 @1817) 		local_set(&head_page->entries, 0);
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1818) 		local_set(&head_page->page->commit, 0);
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1819) 	}
ab776f502cfd06 Steven Rostedt (Google  2024-06-11  1820) }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


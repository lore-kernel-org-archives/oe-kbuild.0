Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02AE4245008
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Mar 2026 05:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773380479; cv=none; b=Z1P9Kg5yZx7OgZxKcYW7t0hhMWCREDKdtxhNab/Oah8RvFTKb08DsSgpiZfwkWog7OvuDsT+sQd6HUcM7Z+pRf0JqWcNmmE3yB+VlBZqOKWsXjN9l+PbIzQ4zavC+XdH0ylFijW9YyMBCTSpR2q+I40++AMo8m/GY7ll2SVJsjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773380479; c=relaxed/simple;
	bh=naB0S/9z7eJ1kH5MEuznWiNyGZgTkjtMroYRMPhB6KE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eDhUmvgXxydFlAKlTGhZgQmZo25tO2ba+rjS05fhnkVyTPHeHzNdtzWLE6zXIQU1qOey/7WtE77fJ0JURhhJnCiqHyq3PRVHpSKmkQIb7a+X0iz9UmxY7WBmZXSWiAeSryTQMEfUNS48EsGsgdMLJUlB3mP8vVnT+jB9HOao91s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e0H9nK8q; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e0H9nK8q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773380476; x=1804916476;
  h=date:from:to:cc:subject:message-id;
  bh=naB0S/9z7eJ1kH5MEuznWiNyGZgTkjtMroYRMPhB6KE=;
  b=e0H9nK8qsN2o9dMmOPoFZRwcDhfDEEO97NDDpvZ8EEA+qwYyKW12PZkL
   6JeLJ8A7OdSkMPPUcTKKPb3gXbrDg/PBusv1SgqXacos63WOwyC2Nf02i
   jN3+Y2FjZPv0n3JjUyUWViqNPbnSX04sHyT3cK74Bqtgv5/AgvTaLeEfF
   7KoE+9pmteeWmFaRaBo6IPdvQAKo2APhJBoJQWYdzWCmv89ji0E/J3iUq
   TUw4tWykFn/yx2s+AMa+2V6Izi+2o3Lex5/wOy9KXqVYBQAiIQW44ZlZg
   q96EGbXEUn6blhbNFXT94XtVqlqrE460PHjYyU/cqSZ9RZQTpnJ9R7feT
   A==;
X-CSE-ConnectionGUID: YdJWWEyNSGKOwjrX1wlNJA==
X-CSE-MsgGUID: Z4HVfjbsS9WeZGlfkSPm/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="62056391"
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="62056391"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 22:41:15 -0700
X-CSE-ConnectionGUID: f2zgQHSIRYWsEvd5wjdrFQ==
X-CSE-MsgGUID: lqcBG5z6Q4m6MhV9O/UxjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="225751808"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 12 Mar 2026 22:41:14 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0vGp-000000003VR-38Tr;
	Fri, 13 Mar 2026 05:41:11 +0000
Date: Fri, 13 Mar 2026 13:40:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe:rw_iter 359/471]
 drivers/remoteproc/remoteproc_debugfs.c:86 rproc_coredump_write() warn:
 potential spectre issue 'buf' [w]
Message-ID: <202603131316.CxwAEITa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git rw_iter
head:   0a49759be1c3b29207758e467fdc1a90d0716d06
commit: 2d3f6e1e7fa5b2337a446adc4bf0d0dcf785c726 [359/471] drivers/remoteproc: convert to read/write iterators
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: openrisc-randconfig-r071-20260307 (https://download.01.org/0day-ci/archive/20260313/202603131316.CxwAEITa-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603131316.CxwAEITa-lkp@intel.com/

smatch warnings:
drivers/remoteproc/remoteproc_debugfs.c:86 rproc_coredump_write() warn: potential spectre issue 'buf' [w]
drivers/remoteproc/remoteproc_debugfs.c:220 rproc_recovery_write() warn: potential spectre issue 'buf' [w]

vim +/buf +86 drivers/remoteproc/remoteproc_debugfs.c

3afdc59e439048 Rishabh Bhatnagar    2020-07-16   53  
3afdc59e439048 Rishabh Bhatnagar    2020-07-16   54  /*
3afdc59e439048 Rishabh Bhatnagar    2020-07-16   55   * By writing to the 'coredump' debugfs entry, we control the behavior of the
bf41a0910cb2dd Rishabh Bhatnagar    2020-10-02   56   * coredump mechanism dynamically. The default value of this entry is "disabled".
3afdc59e439048 Rishabh Bhatnagar    2020-07-16   57   *
3afdc59e439048 Rishabh Bhatnagar    2020-07-16   58   * The 'coredump' debugfs entry supports these commands:
3afdc59e439048 Rishabh Bhatnagar    2020-07-16   59   *
bf41a0910cb2dd Rishabh Bhatnagar    2020-10-02   60   * disabled:	By default coredump collection is disabled. Recovery will
bf41a0910cb2dd Rishabh Bhatnagar    2020-10-02   61   *		proceed without collecting any dump.
bf41a0910cb2dd Rishabh Bhatnagar    2020-10-02   62   *
bf41a0910cb2dd Rishabh Bhatnagar    2020-10-02   63   * enabled:	When the remoteproc crashes the entire coredump will be copied
bf41a0910cb2dd Rishabh Bhatnagar    2020-10-02   64   *		to a separate buffer and exposed to userspace.
3afdc59e439048 Rishabh Bhatnagar    2020-07-16   65   *
3afdc59e439048 Rishabh Bhatnagar    2020-07-16   66   * inline:	The coredump will not be copied to a separate buffer and the
3afdc59e439048 Rishabh Bhatnagar    2020-07-16   67   *		recovery process will have to wait until data is read by
3afdc59e439048 Rishabh Bhatnagar    2020-07-16   68   *		userspace. But this avoid usage of extra memory.
3afdc59e439048 Rishabh Bhatnagar    2020-07-16   69   */
2d3f6e1e7fa5b2 Jens Axboe           2024-04-06   70  static ssize_t rproc_coredump_write(struct kiocb *iocb, struct iov_iter *from)
3afdc59e439048 Rishabh Bhatnagar    2020-07-16   71  {
2d3f6e1e7fa5b2 Jens Axboe           2024-04-06   72  	struct rproc *rproc = iocb->ki_filp->private_data;
2d3f6e1e7fa5b2 Jens Axboe           2024-04-06   73  	size_t count = iov_iter_count(from);
3afdc59e439048 Rishabh Bhatnagar    2020-07-16   74  	int ret, err = 0;
3afdc59e439048 Rishabh Bhatnagar    2020-07-16   75  	char buf[20];
3afdc59e439048 Rishabh Bhatnagar    2020-07-16   76  
f89672cc368195 Alistair Delva       2022-01-19   77  	if (count < 1 || count > sizeof(buf))
3afdc59e439048 Rishabh Bhatnagar    2020-07-16   78  		return -EINVAL;
3afdc59e439048 Rishabh Bhatnagar    2020-07-16   79  
2d3f6e1e7fa5b2 Jens Axboe           2024-04-06   80  	ret = !copy_from_iter_full(buf, count, from);
3afdc59e439048 Rishabh Bhatnagar    2020-07-16   81  	if (ret)
3afdc59e439048 Rishabh Bhatnagar    2020-07-16   82  		return -EFAULT;
3afdc59e439048 Rishabh Bhatnagar    2020-07-16   83  
3afdc59e439048 Rishabh Bhatnagar    2020-07-16   84  	/* remove end of line */
3afdc59e439048 Rishabh Bhatnagar    2020-07-16   85  	if (buf[count - 1] == '\n')
3afdc59e439048 Rishabh Bhatnagar    2020-07-16  @86  		buf[count - 1] = '\0';
3afdc59e439048 Rishabh Bhatnagar    2020-07-16   87  
3afdc59e439048 Rishabh Bhatnagar    2020-07-16   88  	if (rproc->state == RPROC_CRASHED) {
3afdc59e439048 Rishabh Bhatnagar    2020-07-16   89  		dev_err(&rproc->dev, "can't change coredump configuration\n");
3afdc59e439048 Rishabh Bhatnagar    2020-07-16   90  		err = -EBUSY;
3afdc59e439048 Rishabh Bhatnagar    2020-07-16   91  		goto out;
3afdc59e439048 Rishabh Bhatnagar    2020-07-16   92  	}
3afdc59e439048 Rishabh Bhatnagar    2020-07-16   93  
18946226367452 Sibi Sankar          2020-09-16   94  	if (!strncmp(buf, "disabled", count)) {
3afdc59e439048 Rishabh Bhatnagar    2020-07-16   95  		rproc->dump_conf = RPROC_COREDUMP_DISABLED;
bf41a0910cb2dd Rishabh Bhatnagar    2020-10-02   96  	} else if (!strncmp(buf, "enabled", count)) {
bf41a0910cb2dd Rishabh Bhatnagar    2020-10-02   97  		rproc->dump_conf = RPROC_COREDUMP_ENABLED;
3afdc59e439048 Rishabh Bhatnagar    2020-07-16   98  	} else if (!strncmp(buf, "inline", count)) {
3afdc59e439048 Rishabh Bhatnagar    2020-07-16   99  		rproc->dump_conf = RPROC_COREDUMP_INLINE;
3afdc59e439048 Rishabh Bhatnagar    2020-07-16  100  	} else {
3afdc59e439048 Rishabh Bhatnagar    2020-07-16  101  		dev_err(&rproc->dev, "Invalid coredump configuration\n");
3afdc59e439048 Rishabh Bhatnagar    2020-07-16  102  		err = -EINVAL;
3afdc59e439048 Rishabh Bhatnagar    2020-07-16  103  	}
3afdc59e439048 Rishabh Bhatnagar    2020-07-16  104  out:
3afdc59e439048 Rishabh Bhatnagar    2020-07-16  105  	return err ? err : count;
3afdc59e439048 Rishabh Bhatnagar    2020-07-16  106  }
3afdc59e439048 Rishabh Bhatnagar    2020-07-16  107  
3afdc59e439048 Rishabh Bhatnagar    2020-07-16  108  static const struct file_operations rproc_coredump_fops = {
2d3f6e1e7fa5b2 Jens Axboe           2024-04-06  109  	.read_iter = rproc_coredump_read,
2d3f6e1e7fa5b2 Jens Axboe           2024-04-06  110  	.write_iter = rproc_coredump_write,
3afdc59e439048 Rishabh Bhatnagar    2020-07-16  111  	.open = simple_open,
3afdc59e439048 Rishabh Bhatnagar    2020-07-16  112  	.llseek = generic_file_llseek,
3afdc59e439048 Rishabh Bhatnagar    2020-07-16  113  };
3afdc59e439048 Rishabh Bhatnagar    2020-07-16  114  
6391a70682b173 Ohad Ben-Cohen       2011-10-20  115  /*
6391a70682b173 Ohad Ben-Cohen       2011-10-20  116   * Some remote processors may support dumping trace logs into a shared
6391a70682b173 Ohad Ben-Cohen       2011-10-20  117   * memory buffer. We expose this trace buffer using debugfs, so users
6391a70682b173 Ohad Ben-Cohen       2011-10-20  118   * can easily tell what's going on remotely.
6391a70682b173 Ohad Ben-Cohen       2011-10-20  119   *
6391a70682b173 Ohad Ben-Cohen       2011-10-20  120   * We will most probably improve the rproc tracing facilities later on,
6391a70682b173 Ohad Ben-Cohen       2011-10-20  121   * but this kind of lightweight and simple mechanism is always good to have,
6391a70682b173 Ohad Ben-Cohen       2011-10-20  122   * as it provides very early tracing with little to no dependencies at all.
6391a70682b173 Ohad Ben-Cohen       2011-10-20  123   */
2d3f6e1e7fa5b2 Jens Axboe           2024-04-06  124  static ssize_t rproc_trace_read(struct kiocb *iocb, struct iov_iter *to)
6391a70682b173 Ohad Ben-Cohen       2011-10-20  125  {
2d3f6e1e7fa5b2 Jens Axboe           2024-04-06  126  	struct rproc_debug_trace *data = iocb->ki_filp->private_data;
a987e6b91a5ac0 Loic Pallardy        2019-01-10  127  	struct rproc_mem_entry *trace = &data->trace_mem;
a987e6b91a5ac0 Loic Pallardy        2019-01-10  128  	void *va;
a987e6b91a5ac0 Loic Pallardy        2019-01-10  129  	char buf[100];
a987e6b91a5ac0 Loic Pallardy        2019-01-10  130  	int len;
a987e6b91a5ac0 Loic Pallardy        2019-01-10  131  
40df0a91b2a522 Peng Fan             2021-03-06  132  	va = rproc_da_to_va(data->rproc, trace->da, trace->len, NULL);
a987e6b91a5ac0 Loic Pallardy        2019-01-10  133  
a987e6b91a5ac0 Loic Pallardy        2019-01-10  134  	if (!va) {
a987e6b91a5ac0 Loic Pallardy        2019-01-10  135  		len = scnprintf(buf, sizeof(buf), "Trace %s not available\n",
a987e6b91a5ac0 Loic Pallardy        2019-01-10  136  				trace->name);
a987e6b91a5ac0 Loic Pallardy        2019-01-10  137  		va = buf;
a987e6b91a5ac0 Loic Pallardy        2019-01-10  138  	} else {
a987e6b91a5ac0 Loic Pallardy        2019-01-10  139  		len = strnlen(va, trace->len);
a987e6b91a5ac0 Loic Pallardy        2019-01-10  140  	}
6391a70682b173 Ohad Ben-Cohen       2011-10-20  141  
2d3f6e1e7fa5b2 Jens Axboe           2024-04-06  142  	return simple_copy_to_iter(va, &iocb->ki_pos, len, to);
6391a70682b173 Ohad Ben-Cohen       2011-10-20  143  }
6391a70682b173 Ohad Ben-Cohen       2011-10-20  144  
6391a70682b173 Ohad Ben-Cohen       2011-10-20  145  static const struct file_operations trace_rproc_ops = {
2d3f6e1e7fa5b2 Jens Axboe           2024-04-06  146  	.read_iter = rproc_trace_read,
234e3405829012 Stephen Boyd         2012-04-05  147  	.open = simple_open,
6391a70682b173 Ohad Ben-Cohen       2011-10-20  148  	.llseek	= generic_file_llseek,
6391a70682b173 Ohad Ben-Cohen       2011-10-20  149  };
6391a70682b173 Ohad Ben-Cohen       2011-10-20  150  
6391a70682b173 Ohad Ben-Cohen       2011-10-20  151  /* expose the name of the remote processor via debugfs */
2d3f6e1e7fa5b2 Jens Axboe           2024-04-06  152  static ssize_t rproc_name_read(struct kiocb *iocb, struct iov_iter *to)
6391a70682b173 Ohad Ben-Cohen       2011-10-20  153  {
2d3f6e1e7fa5b2 Jens Axboe           2024-04-06  154  	struct rproc *rproc = iocb->ki_filp->private_data;
6391a70682b173 Ohad Ben-Cohen       2011-10-20  155  	/* need room for the name, a newline and a terminating null */
6391a70682b173 Ohad Ben-Cohen       2011-10-20  156  	char buf[100];
6391a70682b173 Ohad Ben-Cohen       2011-10-20  157  	int i;
6391a70682b173 Ohad Ben-Cohen       2011-10-20  158  
ae768d5fac18cd Dan Carpenter        2012-09-25  159  	i = scnprintf(buf, sizeof(buf), "%.98s\n", rproc->name);
6391a70682b173 Ohad Ben-Cohen       2011-10-20  160  
2d3f6e1e7fa5b2 Jens Axboe           2024-04-06  161  	return simple_copy_to_iter(buf, &iocb->ki_pos, i, to);
6391a70682b173 Ohad Ben-Cohen       2011-10-20  162  }
6391a70682b173 Ohad Ben-Cohen       2011-10-20  163  
6391a70682b173 Ohad Ben-Cohen       2011-10-20  164  static const struct file_operations rproc_name_ops = {
2d3f6e1e7fa5b2 Jens Axboe           2024-04-06  165  	.read_iter = rproc_name_read,
234e3405829012 Stephen Boyd         2012-04-05  166  	.open = simple_open,
6391a70682b173 Ohad Ben-Cohen       2011-10-20  167  	.llseek	= generic_file_llseek,
6391a70682b173 Ohad Ben-Cohen       2011-10-20  168  };
6391a70682b173 Ohad Ben-Cohen       2011-10-20  169  
2e37abb89a2ef1 Fernando Guzman Lugo 2012-09-18  170  /* expose recovery flag via debugfs */
2d3f6e1e7fa5b2 Jens Axboe           2024-04-06  171  static ssize_t rproc_recovery_read(struct kiocb *iocb, struct iov_iter *to)
2e37abb89a2ef1 Fernando Guzman Lugo 2012-09-18  172  {
2d3f6e1e7fa5b2 Jens Axboe           2024-04-06  173  	struct rproc *rproc = iocb->ki_filp->private_data;
2e37abb89a2ef1 Fernando Guzman Lugo 2012-09-18  174  	char *buf = rproc->recovery_disabled ? "disabled\n" : "enabled\n";
2e37abb89a2ef1 Fernando Guzman Lugo 2012-09-18  175  
2d3f6e1e7fa5b2 Jens Axboe           2024-04-06  176  	return simple_copy_to_iter(buf, &iocb->ki_pos, strlen(buf), to);
2e37abb89a2ef1 Fernando Guzman Lugo 2012-09-18  177  }
2e37abb89a2ef1 Fernando Guzman Lugo 2012-09-18  178  
2e37abb89a2ef1 Fernando Guzman Lugo 2012-09-18  179  /*
2e37abb89a2ef1 Fernando Guzman Lugo 2012-09-18  180   * By writing to the 'recovery' debugfs entry, we control the behavior of the
2e37abb89a2ef1 Fernando Guzman Lugo 2012-09-18  181   * recovery mechanism dynamically. The default value of this entry is "enabled".
2e37abb89a2ef1 Fernando Guzman Lugo 2012-09-18  182   *
2e37abb89a2ef1 Fernando Guzman Lugo 2012-09-18  183   * The 'recovery' debugfs entry supports these commands:
2e37abb89a2ef1 Fernando Guzman Lugo 2012-09-18  184   *
2e37abb89a2ef1 Fernando Guzman Lugo 2012-09-18  185   * enabled:	When enabled, the remote processor will be automatically
2e37abb89a2ef1 Fernando Guzman Lugo 2012-09-18  186   *		recovered whenever it crashes. Moreover, if the remote
2e37abb89a2ef1 Fernando Guzman Lugo 2012-09-18  187   *		processor crashes while recovery is disabled, it will
2e37abb89a2ef1 Fernando Guzman Lugo 2012-09-18  188   *		be automatically recovered too as soon as recovery is enabled.
2e37abb89a2ef1 Fernando Guzman Lugo 2012-09-18  189   *
2e37abb89a2ef1 Fernando Guzman Lugo 2012-09-18  190   * disabled:	When disabled, a remote processor will remain in a crashed
2e37abb89a2ef1 Fernando Guzman Lugo 2012-09-18  191   *		state if it crashes. This is useful for debugging purposes;
2e37abb89a2ef1 Fernando Guzman Lugo 2012-09-18  192   *		without it, debugging a crash is substantially harder.
2e37abb89a2ef1 Fernando Guzman Lugo 2012-09-18  193   *
2e37abb89a2ef1 Fernando Guzman Lugo 2012-09-18  194   * recover:	This function will trigger an immediate recovery if the
2e37abb89a2ef1 Fernando Guzman Lugo 2012-09-18  195   *		remote processor is in a crashed state, without changing
2e37abb89a2ef1 Fernando Guzman Lugo 2012-09-18  196   *		or checking the recovery state (enabled/disabled).
2e37abb89a2ef1 Fernando Guzman Lugo 2012-09-18  197   *		This is useful during debugging sessions, when one expects
2e37abb89a2ef1 Fernando Guzman Lugo 2012-09-18  198   *		additional crashes to happen after enabling recovery. In this
2e37abb89a2ef1 Fernando Guzman Lugo 2012-09-18  199   *		case, enabling recovery will make it hard to debug subsequent
2e37abb89a2ef1 Fernando Guzman Lugo 2012-09-18  200   *		crashes, so it's recommended to keep recovery disabled, and
2e37abb89a2ef1 Fernando Guzman Lugo 2012-09-18  201   *		instead use the "recover" command as needed.
2e37abb89a2ef1 Fernando Guzman Lugo 2012-09-18  202   */
2e37abb89a2ef1 Fernando Guzman Lugo 2012-09-18  203  static ssize_t
2d3f6e1e7fa5b2 Jens Axboe           2024-04-06  204  rproc_recovery_write(struct kiocb *iocb, struct iov_iter *from)
2e37abb89a2ef1 Fernando Guzman Lugo 2012-09-18  205  {
2d3f6e1e7fa5b2 Jens Axboe           2024-04-06  206  	struct rproc *rproc = iocb->ki_filp->private_data;
2d3f6e1e7fa5b2 Jens Axboe           2024-04-06  207  	size_t count = iov_iter_count(from);
2e37abb89a2ef1 Fernando Guzman Lugo 2012-09-18  208  	char buf[10];
2e37abb89a2ef1 Fernando Guzman Lugo 2012-09-18  209  	int ret;
2e37abb89a2ef1 Fernando Guzman Lugo 2012-09-18  210  
92792e48e2ae60 Arnd Bergmann        2015-11-20  211  	if (count < 1 || count > sizeof(buf))
47fff9fd8a7848 Lee Jones            2016-01-12  212  		return -EINVAL;
2e37abb89a2ef1 Fernando Guzman Lugo 2012-09-18  213  
2d3f6e1e7fa5b2 Jens Axboe           2024-04-06  214  	ret = !copy_from_iter_full(buf, count, from);
2e37abb89a2ef1 Fernando Guzman Lugo 2012-09-18  215  	if (ret)
bec109a430e8c6 Dan Carpenter        2012-09-25  216  		return -EFAULT;
2e37abb89a2ef1 Fernando Guzman Lugo 2012-09-18  217  
2e37abb89a2ef1 Fernando Guzman Lugo 2012-09-18  218  	/* remove end of line */
2e37abb89a2ef1 Fernando Guzman Lugo 2012-09-18  219  	if (buf[count - 1] == '\n')
2e37abb89a2ef1 Fernando Guzman Lugo 2012-09-18 @220  		buf[count - 1] = '\0';
2e37abb89a2ef1 Fernando Guzman Lugo 2012-09-18  221  
2e37abb89a2ef1 Fernando Guzman Lugo 2012-09-18  222  	if (!strncmp(buf, "enabled", count)) {
e138cce3e3736e Alex Elder           2020-02-28  223  		/* change the flag and begin the recovery process if needed */
2e37abb89a2ef1 Fernando Guzman Lugo 2012-09-18  224  		rproc->recovery_disabled = false;
2e37abb89a2ef1 Fernando Guzman Lugo 2012-09-18  225  		rproc_trigger_recovery(rproc);
2e37abb89a2ef1 Fernando Guzman Lugo 2012-09-18  226  	} else if (!strncmp(buf, "disabled", count)) {
2e37abb89a2ef1 Fernando Guzman Lugo 2012-09-18  227  		rproc->recovery_disabled = true;
2e37abb89a2ef1 Fernando Guzman Lugo 2012-09-18  228  	} else if (!strncmp(buf, "recover", count)) {
e138cce3e3736e Alex Elder           2020-02-28  229  		/* begin the recovery process without changing the flag */
2e37abb89a2ef1 Fernando Guzman Lugo 2012-09-18  230  		rproc_trigger_recovery(rproc);
1f2f65c41034ac Alex Elder           2020-02-28  231  	} else {
1f2f65c41034ac Alex Elder           2020-02-28  232  		return -EINVAL;
2e37abb89a2ef1 Fernando Guzman Lugo 2012-09-18  233  	}
2e37abb89a2ef1 Fernando Guzman Lugo 2012-09-18  234  
2e37abb89a2ef1 Fernando Guzman Lugo 2012-09-18  235  	return count;
2e37abb89a2ef1 Fernando Guzman Lugo 2012-09-18  236  }
2e37abb89a2ef1 Fernando Guzman Lugo 2012-09-18  237  

:::::: The code at line 86 was first introduced by commit
:::::: 3afdc59e4390487f04f2435b7e8a6289984e0a1e remoteproc: Add coredump debugfs entry

:::::: TO: Rishabh Bhatnagar <rishabhb@codeaurora.org>
:::::: CC: Bjorn Andersson <bjorn.andersson@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

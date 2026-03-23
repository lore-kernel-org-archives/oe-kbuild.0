Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F743BFE3B
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Mar 2026 15:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774279464; cv=none; b=f5QZiuonpj22KhL7gFFNPbZpNZxUv761ptiodgGWVagVqSxEijf6KmYKcX/ifLAwgt3jD9qJB4NJqMhNCgAZ2gQ3G8BhcOvq7+HLgXU/iuzwJIkmk6SkWx5i/s69OfEcg0ZBlzqG5hJtsbjDDlpHqHC9Cy7zjWYQuEvdyUl/kto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774279464; c=relaxed/simple;
	bh=zPEN7fimfubVK8yonIOcs4JGEvezTfMc1IfkD71msZE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rSHPCYSRH7HdcWZOZf1/AqcAFdIUJuhH0k2uGlcbNuZlsCIHzVV5ZUU2Zvl490gCl36szVe0ORZ4rpy5M4m5y9QhMKEcxBVlDKCscHj5BimkI8Yb2d1dXYPt59vbqOyiVkHe4wQwIS68XMHt+gwsEWgR/dwb1WJc1BpcJXLZtks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WpKhSZOr; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WpKhSZOr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774279463; x=1805815463;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=zPEN7fimfubVK8yonIOcs4JGEvezTfMc1IfkD71msZE=;
  b=WpKhSZOrZdZ3MxWbdS5iiA8daBjMB7HYeuRlziwKh0rLUcaPVSx3u+0I
   xaahS0G3yR3gAi+KxG3M5G7aCSjUtk62Fmnn0eK6DRKysP7/tRYBuNgol
   48+6oKygQ/7t8CZpMMH3ZY5WBTGugbLOx/GoV5P3DcsWSUZiR4e/m94Pm
   UfyqtmCGSnYBbTTRSdtchU9234YaNwXZZxSnDw2OqmipoYQVjxc/0/IGG
   ulu0dCY8VQF+T5oBmDEgJSt7PxbcELHMWmAipHRT+ImYACctgA+oRI11j
   38ctLmpFF5NhD8ZNUniULenpBoVcKsLXVrAf7EMvBqKzc0/7/sF1/hL/j
   A==;
X-CSE-ConnectionGUID: 5vXcahIyRbimxadSjrDQZw==
X-CSE-MsgGUID: etcFo3S5SUKboFBFXH5igA==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="85590995"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="85590995"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 08:24:22 -0700
X-CSE-ConnectionGUID: lDWwoq7vSVGYvfapIDNs/g==
X-CSE-MsgGUID: m4peVHt5T2eKz3JwON/WAg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 23 Mar 2026 08:24:20 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4h8c-000000001sJ-0E8y;
	Mon, 23 Mar 2026 15:24:18 +0000
Date: Mon, 23 Mar 2026 23:23:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/auxdisplay/line-display.c:110 to_linedisp() warn:
 iterator used outside loop: 'attachment'
Message-ID: <202603232331.Z0ifsIrP-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: "Jean-Fran=C3=A7ois Lessard" <jefflessard3@gmail.com>
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c369299895a591d96745d6492d4888259b004a9e
commit: 3ba5c78fe7c5d60edae0c47361f191d40c5c1cf0 auxdisplay: linedisp: supp=
ort attribute attachment to auxdisplay devices
date:   5 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 5 months ago
config: i386-randconfig-141-20260323 (https://download.01.org/0day-ci/archi=
ve/20260323/202603232331.Z0ifsIrP-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f022=
7cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603232331.Z0ifsIrP-lkp@intel.com/

New smatch warnings:
drivers/auxdisplay/line-display.c:110 to_linedisp() warn: iterator used out=
side loop: 'attachment'

Old smatch warnings:
drivers/auxdisplay/line-display.c:89 delete_attachment() warn: iterator use=
d outside loop: 'attachment'

vim +/attachment +110 drivers/auxdisplay/line-display.c

3ba5c78fe7c5d6 Jean-Fran=C3=A7ois Lessard 2025-09-18   95 =20
66c93809487e62 Jean-Fran=C3=A7ois Lessard 2025-09-18   96  static struct li=
nedisp *to_linedisp(struct device *dev)
66c93809487e62 Jean-Fran=C3=A7ois Lessard 2025-09-18   97  {
3ba5c78fe7c5d6 Jean-Fran=C3=A7ois Lessard 2025-09-18   98  	struct linedisp=
_attachment *attachment;
3ba5c78fe7c5d6 Jean-Fran=C3=A7ois Lessard 2025-09-18   99 =20
3ba5c78fe7c5d6 Jean-Fran=C3=A7ois Lessard 2025-09-18  100  	guard(spinlock)=
(&linedisp_attachments_lock);
3ba5c78fe7c5d6 Jean-Fran=C3=A7ois Lessard 2025-09-18  101 =20
3ba5c78fe7c5d6 Jean-Fran=C3=A7ois Lessard 2025-09-18  102  	list_for_each_e=
ntry(attachment, &linedisp_attachments, list) {
3ba5c78fe7c5d6 Jean-Fran=C3=A7ois Lessard 2025-09-18  103  		if (attachment=
->device =3D=3D dev)
3ba5c78fe7c5d6 Jean-Fran=C3=A7ois Lessard 2025-09-18  104  			break;
3ba5c78fe7c5d6 Jean-Fran=C3=A7ois Lessard 2025-09-18  105  	}
3ba5c78fe7c5d6 Jean-Fran=C3=A7ois Lessard 2025-09-18  106 =20
3ba5c78fe7c5d6 Jean-Fran=C3=A7ois Lessard 2025-09-18  107  	if (list_entry_=
is_head(attachment, &linedisp_attachments, list))
3ba5c78fe7c5d6 Jean-Fran=C3=A7ois Lessard 2025-09-18  108  		return NULL;
3ba5c78fe7c5d6 Jean-Fran=C3=A7ois Lessard 2025-09-18  109 =20
3ba5c78fe7c5d6 Jean-Fran=C3=A7ois Lessard 2025-09-18 @110  	return attachme=
nt->linedisp;
66c93809487e62 Jean-Fran=C3=A7ois Lessard 2025-09-18  111  }
66c93809487e62 Jean-Fran=C3=A7ois Lessard 2025-09-18  112 =20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

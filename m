Received: from out203-205-251-84.mail.qq.com (unknown [203.205.251.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FAC2E3E1
	for <oe-kbuild@lists.linux.dev>; Sat, 16 Dec 2023 12:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="T+G8uu6d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1702730819; bh=KkmgHGEm2UsLq3TeXNZiiAlrO5hWvTj5k/H52eiv40Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=T+G8uu6drpO0AzvO9Twxr2FhHNJxE125qxOC5sHD1wCNwrqJfaPz5c/9TlmY0Un8J
	 42HPFmyoJfOAfb26A/KjghtkNmxCXfKWHAkM2uwv+LqltGf/kqP3hArFfBXzNqE6lQ
	 9oIiJelypfZik4B7Aoz5Gz7WRNIXigMExGdC+dy8=
Received: from pek-lxu-l1.wrs.com ([111.198.225.215])
	by newxmesmtplogicsvrszc5-1.qq.com (NewEsmtp) with SMTP
	id A318A4EE; Sat, 16 Dec 2023 20:40:49 +0800
X-QQ-mid: xmsmtpt1702730449tyn0hcw6v
Message-ID: <tencent_7D76CF818DC6A5DE0D8D1232DDFBDDEC1907@qq.com>
X-QQ-XMAILINFO: MvM61XSVXCtD1aoAANvcck73crN01yFuAD6OqTuYfTzKZXaypNqIwvEykzsaRG
	 pG0mYUeQyIWIxjPCVhD485OHLEcxg/Wd/As8/sD4COTcN/ZkD6LL0BtBRa6ZgL4N2Dvg1G/lDVoP
	 XNTg0R/Hzr5Gp6+U49JynfmMdyKJasy/prlQvag2agfe2D81FOrOEfXfi4XogfUIBEs+RWPNEjc4
	 2IzOiJCd05w6dx4k4jo4OdVP6giryyoiPtaXiN7wUqVSwhjJwDLjeaXypk/48qCJoaDWn+E23jA3
	 jPl710bPao4QXwRq0ALwy9NLPuP2oiAHkgbgfiKBGHsPdYkc5D3DYiSIz69uIC+NWWusYMDt+A5a
	 7eF4KidifFd1P94hAhMojpW3l2oj7/Askcxwv4VWshapFLezdN+UMYSYBLYlrD/2zh0iCUIECsyL
	 I98S+WE9XPYXHxSB+dYGKxIg9vh7m5rEEXmkseZDPjMzZKX9XxFufch8uWykH44BJRu2LIfvRixj
	 f6hEodHz6PKRu52g7klFxQ8r7Yz4j6sVd96YOVzO9KN2/fhWbEIC2UzbwvAoTBROW7dXWIwhS5M/
	 NeHFY50svY2pqurexIX8KETiVScU5a/HXfGerviDqtAdittwuyis0qVrSNgNn7kglkKvK4UMgDpb
	 5TWLxUnRU1/2BFjWzM1RnfKit+eqVILF0tzbKf/S+7Cv9OMxu9Q1+kMon+oRO9priEfizlFoG85n
	 4oOhmSgBVjAEgA/T+++QJj1IHSfthUhZ1mqrokKjSO00sWkyHqure89xdMD8yhPIt3QE8vDMq908
	 fwYkuBBU6hoOdXGKJ4ysR4qi8JLNC7khZ6PZkKq/ne+gPQDLYca2I3URbdZYPI+GHVPB5utvnlj/
	 pKbHks9ZAL0nHAGp1O8/njK2TXpePWTAlGQlINhcC/rgULv0nfRgsVCWyM2CO1ow==
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
From: Edward Adam Davis <eadavis@qq.com>
To: lkp@intel.com
Cc: error27@gmail.com,
	oe-kbuild@lists.linux.dev
Subject: Re: [PATCH] jfs: fix array-index-out-of-bounds in diNewExt
Date: Sat, 16 Dec 2023 20:40:50 +0800
X-OQ-MSGID: <20231216124049.3387656-2-eadavis@qq.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <202312142348.6HRZtXTB-lkp@intel.com>
References: <202312142348.6HRZtXTB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 14 Dec 2023 23:45:45 +0800, kernel test robot <lkp@intel.com> wrote:
> kernel test robot noticed the following build warnings:
> 
> New smatch warnings:
> fs/jfs/jfs_imap.c:2213 diNewExt() error: buffer overflow 'imap->im_imap.in_agctl' 128 <= 128
Please ignore this build warning as it will not introduce any issues.
> 
> Old smatch warnings:
> fs/jfs/jfs_imap.c:2229 diNewExt() error: buffer overflow 'imap->im_imap.in_agctl' 128 <= 128
> fs/jfs/jfs_imap.c:2304 diNewExt() error: buffer overflow 'imap->im_imap.in_agctl' 128 <= 128
> fs/jfs/jfs_imap.c:2318 diNewExt() error: buffer overflow 'imap->im_imap.in_agctl' 128 <= 128

BR,
edward


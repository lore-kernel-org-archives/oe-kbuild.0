Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1044049DB82;
	Fri, 11 Sep 2026 15:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141716; cv=none; b=SjTqOEd+VKOuZPPN+R5rjNbj31bAIcBNARCLRQbdC9HA4AWm8jP+qncxpFjaDE90V57gJMMMu5cz8GgZCLScHDBnkvs9THtzY4+EGgOLYiowEjbuV7f4esyUof/I5myrgfu2qaG4sfuyE0WfK5U75XWe8Ga149KIOno4QWKmXdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141716; c=relaxed/simple;
	bh=R2VaoaDNm/WvOiqy/1h5w0ZjVOaHnI9zGBN+aewbLyk=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=LPHN6ggh5W44Sise4PHeGcv9+D3i5FSiruwJYCkJTNmvNxHmpKbGzE9p/tzq+2S+BJ8BTExurH8TowLoz9xTM7RK6rGsyE+kxwxmncpvM/ygyuHw1KGTAUQGZFBxrV72ZU0aNXHCAjlDaHuc6WoZmhHADnQHwici6PK0K1KXFSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=VMzcAXDT; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=HRzxEQsD; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="VMzcAXDT";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="HRzxEQsD"
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id 69D9EEC040D;
	Fri, 11 Sep 2026 11:48:33 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Fri, 11 Sep 2026 11:48:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1789141712;
	 x=1789228112; bh=76W/T3cm12M72x4+3eNdXCRYKQDmGkS57clCXK/ieLc=; b=
	VMzcAXDT9CmBgrfBGifhN6+CXzsT4Df+y18RkLKk478yGxDy/2Kc+d9HZm6rHF6Z
	sGhiLFD8XA2q8n8VfAG4bz86TDSk0HIVliPGsmlQdaqWKOon/4u2aixOuGHFj0rh
	mOchaTjYfKWXxFtqBgZb2PRHA/8fl/nRHyz2AW8ieNr2p4TSutt79Zm5RqyjB8Jt
	pjobLhzMYaH+yJw/eyRmE+hpJPjjDjuX+RO5kW520cJt+U2y1e1VQwhswyhF7FiW
	ngN/zqt35iIQZfRIdnpMwoQkYkrC2O0TqTQzyMr934bNh7MP4mcDxTEJQSK7boj0
	ER1lrnhBvMzu5wk7wxe+cQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1789141712; x=
	1789228112; bh=76W/T3cm12M72x4+3eNdXCRYKQDmGkS57clCXK/ieLc=; b=H
	RzxEQsDthogzduY1fHIgb4Wg/ZNJQEn/dc6Pttymrh+mPh6UQUm2vS46y5FfOihF
	p7xcrJ1JS0AA9f4TlevCxLFWSqNKnEEQMCu/3kO8mz5k+fwYFIcPkboKpSdK74SF
	R/PmjPqJVDbrBMW/rkU7LBUPDsPozfHvZahIIL3Qfo0Q6C9yr6lq/TxrQuYKso5N
	3JvzwHC1mByTXtUCG+r6JC2Sz06nLJSDi5m4397V2A1uuWPmU3Ol5RvPzSBOAjVH
	t3ZyEoTvCqh2gz0r2Gz1uKywGb+cI3NQVTqOoaGMCIhmoI8REgmzLtRuHjPz/2HX
	MZq6UDZ2tVXG2xoT+Xbbg==
X-ME-Sender: <xms:zSKkalbDEypcrtgJ9puzjj8UO9Fu3SX7aXySWmtLnd7X-5yYrlNEsw>
    <xme:zSKkanNDwC7lABVvvcSl7HcODqci-_EnNRf3MboG0PmOq-21jPE-Tzz7iTUuc3OVK
    -vBXPU577XFT9Q_KNrqvnDEfQLXFm6ZUdlks5RI-3bIXjZIpExW6Zq3eQ>
X-ME-Proxy-Cause: dmFkZTFNUhvwxGXllS8qM4l9WodmQ60N5h4Kockcar850J98qt2UmqCZ4cj1e+ETKkVpxl
    JRG0Uhn3brp8olA3lrsdvO8WRwVUIAtpIPqlYwv+5c/V4fHlqOO7rtZE4qXvZkQUBVU4l0
    Mj9Wgo/JiQUDBycQJXUe6JbgDaWk0mxiWpVxTJpx51PGqJVK3EMyOFl55XKJtJxCLkjpt3
    Utyyd1AaiVQcaCqgPnqJ0SdC1Py+u/jKnf4yfcm+N7ukKt/YXoinSvp9q+7WEWMjcgXITT
    dVZETxdqiM8H9mKDS8yRfvCMg/OhkRXF56Awht5whZmFVd979XoBymQ+MZVtHBQev3hBWW
    vIJ0Ju2lf4A7QHTmj1QfUNVC7ElmFBQrE8nboF+Yldksfzq8ItmaS3LxwN04Cd4nAHGMJt
    Y+qI+6iDgZe289k/wb52NTYWPjvy5a06Gbz+mv/eLNNFv0FrQQgc6zbEUoRKWLERQITGCQ
    o23oNGJMB0VRMZMof3q7iaOe/LBWpM9FZ0fT5lcIljOsP5G+md1iEx0xRBFSHx38vA14Y5
    S7liOqW0eRmZ9B+8wO0zhO8zK7aJREQ7467TnzPzr0ldAMCjUL3GbiMOQIKhchJ0vYxAF3
    BvnScxC/DX1fiDZCkPT/qJKRthedbWJ1tFdx/BX2MePv5NCf7YqSw3LnVyjQ
X-ME-Proxy: <xmx:zyKkav8GNompK4RaWiFRRf4TXTrNWeR2225YurULlRqSJmuo1SBlXQ>
    <xmx:zyKkat8YLIrsk6Ko5oA9N-qE5VYqS5cVHkVuAoRb8CXWVr33ZiLSww>
    <xmx:zyKkavTM9q1JeP0DjU4dRmtA_VWo_llpAgxRFMRpWRHHEZ8-1iu7FQ>
    <xmx:zyKkahfq1-XdNZs-eVWzBT-ok_5pjaB43464pAkEixL76JcchNn0MA>
    <xmx:0CKkaoehfv5ni_KL1fKbVTDHRWbo_pT4UG_a9VRN6A-AI2obOEGOXvEV>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id BDCC232A007E; Fri, 11 Sep 2026 11:48:29 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: Aj3OoT1esCJR
Date: Fri, 11 Sep 2026 17:48:09 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Dan Carpenter" <error27@gmail.com>, oe-kbuild@lists.linux.dev
Cc: "kernel test robot" <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, arm <arm@kernel.org>
Message-Id: <2e3cd096-f39f-4545-8558-a6ce9cae8b04@app.fastmail.com>
In-Reply-To: <202609111050.oiut4oST-lkp@intel.com>
References: <202609111050.oiut4oST-lkp@intel.com>
Subject: Re: [soc:board-remove-7.3 182/295] drivers/hwmon/ads7828.c:121 ads7828_probe()
 warn: if statement not indented
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Sep 11, 2026, at 14:23, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git 
> board-remove-7.3
> head:   cf983087c51a9c74c3d4d3b353eb811ae5030823
> commit: 4df92b98525f08e1eab92a25f5da2045c78403e8 [182/295] hwmon: 
> asd7828: remove pdata based probing
> config: arm-randconfig-r071-20260911 
> (https://download.01.org/0day-ci/archive/20260911/202609111050.oiut4oST-lkp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 
> 6009708b4367171ccdbf4b5905cb6a803753fe18)
> smatch: v0.5.0-9187-g5189e3fb
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Closes: https://lore.kernel.org/r/202609111050.oiut4oST-lkp@intel.com/

Fixed now, thanks for the report!

     Arnd

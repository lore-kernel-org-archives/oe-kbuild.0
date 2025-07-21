Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681C2170A2B
	for <oe-kbuild@lists.linux.dev>; Mon, 21 Jul 2025 15:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753112546; cv=none; b=uj6xAju83rYC8phuECVbyJWjmKGTw3+XFaLSjOHKyg5PWONLRGKQ+Ve05qBwmfccI2CwMaPWzWsMJjLV61JbrNu03Y0pF8aSSKBDP4NbPAkIC0IzyrGVUW4CGj+55b3eDY5u1e0Hcr1CaGGkpmKH9Prut0PeKHA4TWseQB/dk/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753112546; c=relaxed/simple;
	bh=e0zWZSuIvp7kk1Rq+UlVCutqOSGHXuupZe5VYQxaBCE=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Content-Type; b=LGIr9AzSv3maSqf6yMi94JPVZ/3K0fgO+SS1czVOqtYHngfKDA/NT33Vh3g7evvFkcR6A4TK0++HcO2xM8PJL7hx5Og4Mkm9jPRFGimBnK3aQQyNOtKHQo/j40I1VsDiLRlDRtwBeZCsE6RLhuauRYlYowGluStO6cnNuzmIy4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nQiaTB9A; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nQiaTB9A"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-60cc11b34f6so9794355a12.0
        for <oe-kbuild@lists.linux.dev>; Mon, 21 Jul 2025 08:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753112544; x=1753717344; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=e0zWZSuIvp7kk1Rq+UlVCutqOSGHXuupZe5VYQxaBCE=;
        b=nQiaTB9ARKGt4ix3l+O3wwfgN7WcL9rfbioAulYjfClrARBVq2MO9V2AMUkQQ2lQPw
         Rvko+wTMcuh3G0Ra6mdeGmYDz6c/I27hMfP9lCD2ENQuRUmtWuZJPpjCh7UrpiaKPIuR
         DwBn5ncwI9RPZOJ1PFpIyUtyrg/22jdfho5VSdcpGGOZoAd9ydhjOhJDZkpWu1kfkCal
         ud6reYkdHLglqEPDNUUu/H/I54Q0mzioxrqufDbdwGEiRq5+l4lfMPq8rMJY94vW3Fis
         8AFbYvd2fHShIz3dXY+SPBRRlCAwVSLJVfRjvkHUd+v1bke4T5SVDbBLkl8g1GfSbKY/
         XCXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753112544; x=1753717344;
        h=content-transfer-encoding:subject:to:from:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e0zWZSuIvp7kk1Rq+UlVCutqOSGHXuupZe5VYQxaBCE=;
        b=OY6VgoFKepoPsZCoG/52+pTt7kg2xY4EM80tmticNPub4xj0+TEJNhepCr6PVFFw/1
         ZR1tAHV33cJqVA3R6XRVTtzKCATcpcWvgWXGHqaz680+UZpje+cy7UMaHHbTPNK+QVLH
         KvGZYywaifYOSKJsobAPWcH0MVgKhteQ9qHc5ZoTecdTqvEaH2uFAosectVj02yPB3Vp
         4lLGNC+L+zxvVex02lj7KN/5vbI2AQ2aBjEFXEgFDm3E1WaevnyTIQrljONwW8d1LN0D
         bYWd/Ho/4ko9kfT9Pfo0mY4av+v99bikcCbQBQlfqyFmZXcT5I5bfJ+N+HTTxj11IsFa
         FYZw==
X-Gm-Message-State: AOJu0YxRKc6wRjTcGI4pZQxDWiT6DElQWaRMRMX7xzykelLHNSjfXsz5
	RYKM09ubT836GiIJ1cG8hyO8ScZHMrdRpoyN8cNCZAyQq1J8ORYRTFUJqkkYMg==
X-Gm-Gg: ASbGncsL/adr/3yrUtwje/mxAyLKJ1BlZhiN4NYwO2UoNK71FkUc+mK7GEdtj1ySXdV
	SYzBhqmXZklv9cZ9EBVPgI48MXJoX9iElbnLkVAjRVGkAj5QTgwRJpHWy8DHKLDpbJojapeZxA2
	9H2jXPytYbKAEcn6Jdubl3HjKlZ9bdBmL3PLq1HAViMh51tl21g70mAHTRkRKNDlxyB2MY/RRTD
	zmOW6r7I1PVgALWSd5vDtFBMETDOTM9tWN8/R3kY1+GPOsWLB7u4eVX1ZtX+35XXD4KGNd5ZudC
	/h1LGpSOzztDLK/q+ePHs7gFeK1VXl1qliJV3cJnOIc94EGSheAVTGw2e3I1LLpEZFQu819wSt/
	TeqoqxyhUNZICgjvVeMWw2fTzdxQ3wwO0VwTlPw==
X-Google-Smtp-Source: AGHT+IHRWky2Gt3xJ8KfBmSFMzsMbO3bqz2Ieiyqq1RcksdwNoWzu1n4arSd4MRoqQ1ILtBUY56bjw==
X-Received: by 2002:a17:906:7303:b0:ad5:6174:f947 with SMTP id a640c23a62f3a-af154e3a1e0mr53566b.22.1753112542993;
        Mon, 21 Jul 2025 08:42:22 -0700 (PDT)
Received: from Uzair ([39.46.230.6])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6c795282sm698840366b.6.2025.07.21.08.42.22
        for <oe-kbuild@lists.linux.dev>
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Mon, 21 Jul 2025 08:42:22 -0700 (PDT)
Message-ID: <687e5fde.170a0220.3cf6fb.03c5@mx.google.com>
Date: Mon, 21 Jul 2025 08:42:22 -0700 (PDT)
X-Google-Original-Date: 21 Jul 2025 08:42:22 -0700
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: richard.mypackagingpro@gmail.com
To: oe-kbuild@lists.linux.dev
Subject: Personalized Bags and Boxes
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

SGksDQoNCldlIG1ha2UgcGVyc29uYWxpemVkIHBhY2thZ2luZ+KAlHR1Y2sgYm94ZXMs
IENCRCBib3hlcywgbWFpbGVyIGJveGVzLCByaWdpZCBib3hlcywgYmFrZXJ5IGJveGVz
LCByZXRhaWwgYm94ZXMsIHNob3BwaW5nIGJhZ3MsIGxhYmVsIHN0aWNrZXJzIGFuZCBt
b3JlLg0KDQpTaW1wbHkgcHJvdmlkZSB1cyB3aXRoIHRoZSBkaW1lbnNpb25zIChMIHgg
VyB4IEgpLCBxdWFudGl0eSwgYW5kIHByZWZlcnJlZCBib3ggc3R5bGUsIGFuZCB3ZSds
bCBwcm92aWRlIHlvdSB3aXRoIGEgY29tcGV0aXRpdmUgcXVvdGUuIFBsdXMsIGZvciBh
IGxpbWl0ZWQgdGltZSwgd2XigJlyZSBhbHNvIHByb3ZpZGluZyBjb21wbGltZW50YXJ5
IGRlc2lnbiBzZXJ2aWNlcyBhbmQgc2hpcHBpbmcgb24gYWxsIG9yZGVycy4NCg0KVGhh
bmtzLCBhbmQgbG9va2luZyBmb3J3YXJkIHRvIHBvdGVudGlhbGx5IHdvcmtpbmcgdG9n
ZXRoZXIuDQoNCkJlc3QgcmVnYXJkcywNClJpY2hhcmQgQW5kZXJzb24NClBhY2thZ2lu
ZyBFeHBlcnQNCk15IFBhY2thZ2luZyBQcm8u


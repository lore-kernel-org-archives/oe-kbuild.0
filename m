Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231D65C96
	for <oe-kbuild@lists.linux.dev>; Thu, 20 Oct 2022 17:03:45 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id bp11so35732444wrb.9
        for <oe-kbuild@lists.linux.dev>; Thu, 20 Oct 2022 10:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=contractor.linuxfoundation.org; s=google;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HlMN+22BUNFW1mP1o79Sj/Wf7eydl8TwFZ63mGlxRE8=;
        b=cDJzyawAoQxycOrpuYW8J47dxJVPfXj6mdfjjvFlUoPc3usHBP+2KcdGPABtdX9JEm
         CWcAyVz23lDg08Jri7aHw0bXLNL1c+wY/l5RbJvobj1Hhg8zuWTPS/KjHRxBfC73APd0
         JOwy94H8pYVwEdeKLofs7jLNqnSq8oVCj4OJhFkgNZeaCCtucOL/vQNciQKi6JMifCkM
         we2V7Xfqw/53dezBipD/tVt+F3r/ortibptqo6F7fkhhyH9Xjdf1CYt4v/mycUoGux7U
         tCrt9pdLKytzyz+tgpuHPUj6eIIoCthAa17ZYb7RCM7wV9twfX1u/OUMjnoDs/f9CSDx
         onEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HlMN+22BUNFW1mP1o79Sj/Wf7eydl8TwFZ63mGlxRE8=;
        b=dIkJ+vruYA7fe/R4U3Epx8FAXi+7yxJ0KjhPx8sBogjg5gVnRRmvPeVdj1EX6VaZIp
         kGWllI9+WUIICKt0/+KKMgilccwKWzOEb5BPe0lkGvWffpmD8N04nFamIM4dwcpz8zte
         qP0fdbkGOfhH58DTsfwASjMPW8LEuJHd27l0AqxwkRLNl8BDbDVT52PjBBDi7hDDbH6j
         0v1ZU4/oYGAS2Bri6d+OItAZU2YsCYf46xkqvjcZGBgq4HxklW4ef1zLeoX1sUQo0Xo7
         UV4jUqjFGiE2rKFZCx9wxDsh+Ny1jl1sG+iGdweoDA4yT/0G6sxZt3uhlcjA+FI5jkHS
         +SYg==
X-Gm-Message-State: ACrzQf1M6Q5FcuScB9mSu4Cjo/JtjAG5v8MW3G6hcJ+wsQW+TteiWeLZ
	KvSSgnFVtQJ20SMSxK9Yuv/2b1oLnHGXjVf9psk6yxIyGPFfpg==
X-Google-Smtp-Source: AMsMyM5jTpwCS8UDYCvnmTIiJfmvGdM2QSRSFEnE7HuaIR7M/5YPr+tFKEOgr8lkHsTVkwvkOvnyXGb9EA0RWdI9u04=
X-Received: by 2002:a5d:5942:0:b0:225:7425:4e39 with SMTP id
 e2-20020a5d5942000000b0022574254e39mr9049698wri.566.1666285423234; Thu, 20
 Oct 2022 10:03:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Shyam Kumar <skachukattu@contractor.linuxfoundation.org>
Date: Thu, 20 Oct 2022 22:33:32 +0530
Message-ID: <CAH=dH9-RAkw++DyxKN6mgZLgwJkpMMHLu=fC-woOKph+xz_-9w@mail.gmail.com>
Subject: Test Mail
To: oe-kbuild@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello

Test mail

-- 
Regards
Shyam Kumar
The Linux Foundation Core Projects

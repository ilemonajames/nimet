<?php 

return [
    'accepted' => ': 속성이 허용되어야합니다.',
    'active_url' => ': attribute은 (는) 유효한 URL이 아닙니다.',
    'after' => ': attribute는 : date 이후의 날짜 여야합니다.',
    'after_or_equal' => ': attribute는 : date 이후의 날짜 여야합니다.',
    'alpha' => ': 속성은 문자 만 포함 할 수 있습니다.',
    'alpha_dash' => ': 속성은 문자, 숫자, 대시 및 밑줄 만 포함 할 수 있습니다.',
    'alpha_num' => ': 속성은 문자와 숫자 만 포함 할 수 있습니다.',
    'array' => ': attribute는 배열이어야합니다.',
    'before' => ': attribute는 : date 이전의 날짜 여야합니다.',
    'before_or_equal' => ': attribute는 : date 이전의 날짜 여야합니다.',
    'between' => [
        'numeric' => ': 속성은 : min과 : max 사이에 있어야합니다.',
        'file' => ': attribute는 : min에서 : maxKB 사이 여야합니다.',
        'string' => ': attribute는 : min과 : max 문자 사이 여야합니다.',
        'array' => ': attribute에는 : min과 : max 항목이 있어야합니다.',
    ],
    'boolean' => ': attribute 필드는 true 또는 false 여야합니다.',
    'confirmed' => ': attribute 확인이 일치하지 않습니다.',
    'date' => ': attribute은 (는) 유효한 날짜가 아닙니다.',
    'date_equals' => ': attribute는 : date와 같은 날짜 여야합니다.',
    'date_format' => ': attribute가 : format 형식과 일치하지 않습니다.',
    'different' => ': attribute 및 : other는 달라야합니다.',
    'digits' => ': 속성은 : digits 자리 여야합니다.',
    'digits_between' => ': 속성은 : min과 : max 사이 여야합니다.',
    'dimensions' => ': 속성에 잘못된 이미지 크기가 있습니다.',
    'distinct' => ': attribute 필드에 중복 된 값이 있습니다.',
    'email' => ': attribute는 유효한 이메일 주소 여야합니다.',
    'ends_with' => ': attribute는 다음 중 하나로 끝나야합니다. : values.',
    'exists' => '선택한 : 속성이 잘못되었습니다.',
    'file' => ': attribute는 파일이어야합니다.',
    'filled' => ': attribute 필드에는 값이 있어야합니다.',
    'gt' => [
        'numeric' => ': attribute는 : value보다 커야합니다.',
        'file' => ': attribute는 : value KB보다 커야합니다.',
        'string' => ': attribute는 : value 문자보다 커야합니다.',
        'array' => ': attribute에는 : value 이상의 항목이 있어야합니다.',
    ],
    'gte' => [
        'numeric' => ': attribute은 (는) : value보다 크거나 같아야합니다.',
        'file' => ': attribute은 (는) : value KB보다 크거나 같아야합니다.',
        'string' => ': attribute는 : value 문자보다 크거나 같아야합니다.',
        'array' => ': attribute에는 : value 항목 이상이 있어야합니다.',
    ],
    'image' => ': attribute는 이미지 여야합니다.',
    'in' => '선택한 : 속성이 잘못되었습니다.',
    'in_array' => ': attribute 필드가 : other에 없습니다.',
    'integer' => ': attribute는 정수 여야합니다.',
    'ip' => ': attribute는 유효한 IP 주소 여야합니다.',
    'ipv4' => ': attribute는 유효한 IPv4 주소 여야합니다.',
    'ipv6' => ': attribute는 유효한 IPv6 주소 여야합니다.',
    'json' => ': attribute는 유효한 JSON 문자열이어야합니다.',
    'lt' => [
        'numeric' => ': attribute는 : value보다 작아야합니다.',
        'file' => ': attribute은 (는) : value KB보다 작아야합니다.',
        'string' => ': attribute는 : value 문자보다 작아야합니다.',
        'array' => ': attribute에는 : value보다 작은 항목이 있어야합니다.',
    ],
    'lte' => [
        'numeric' => ': attribute는 : value보다 작거나 같아야합니다.',
        'file' => ': attribute는 : value KB보다 작거나 같아야합니다.',
        'string' => ': attribute는 : value 문자보다 작거나 같아야합니다.',
        'array' => ': attribute에는 : value 항목을 초과 할 수 없습니다.',
    ],
    'max' => [
        'numeric' => ': 속성은 : max보다 클 수 없습니다.',
        'file' => ': 속성은 : max KB보다 클 수 없습니다.',
        'string' => ': 속성은 : max 자보다 클 수 없습니다.',
        'array' => ': 속성은 : max 항목을 초과 할 수 없습니다.',
    ],
    'mimes' => ': attribute는 : values ​​유형의 파일이어야합니다.',
    'mimetypes' => ': attribute는 : values ​​유형의 파일이어야합니다.',
    'min' => [
        'numeric' => ': attribute은 (는) 최소한 : min이어야합니다.',
        'file' => ': attribute은 최소한 : min KB 여야합니다.',
        'string' => ': attribute는 최소한 : min 자 이상이어야합니다.',
        'array' => ': attribute에는 최소한 : min 항목이 있어야합니다.',
    ],
    'not_in' => '선택한 : 속성이 잘못되었습니다.',
    'not_regex' => ': attribute 형식이 잘못되었습니다.',
    'numeric' => ': 속성은 숫자 여야합니다.',
    'password' => '비밀번호가 올바르지 않습니다.',
    'present' => ': attribute 필드가 있어야합니다.',
    'regex' => ': attribute 형식이 잘못되었습니다.',
    'required' => ': attribute 필드는 필수입니다.',
    'required_if' => ': other가 : value 인 경우 : attribute 필드가 필요합니다.',
    'required_unless' => ': other가 : values에 있지 않으면 : attribute 필드가 필요합니다.',
    'required_with' => ': values가있는 경우 : attribute 필드가 필요합니다.',
    'required_with_all' => ': values가있는 경우 : attribute 필드가 필요합니다.',
    'required_without' => ': values가없는 경우 : attribute 필드가 필요합니다.',
    'required_without_all' => ': values가없는 경우 : attribute 필드가 필요합니다.',
    'same' => ': attribute 및 : other가 일치해야합니다.',
    'size' => [
        'numeric' => ': attribute는 : size 여야합니다.',
        'file' => ': attribute은 (는) : size KB 여야합니다.',
        'string' => ': attribute는 : size 문자 여야합니다.',
        'array' => ': attribute에는 : size 항목이 포함되어야합니다.',
    ],
    'starts_with' => ': attribute는 다음 중 하나로 시작해야합니다. : values.',
    'string' => ': attribute는 문자열이어야합니다.',
    'timezone' => ': attribute는 유효한 영역이어야합니다.',
    'unique' => ': 속성은 이미 사용되었습니다.',
    'uploaded' => ': 속성을 업로드하지 못했습니다.',
    'url' => ': attribute 형식이 잘못되었습니다.',
    'uuid' => ': attribute는 유효한 UUID 여야합니다.',
    'custom' => [
        'attribute-name' => [
            'rule-name' => '맞춤 메시지',
        ],
    ],
    'attributes' => '',
];
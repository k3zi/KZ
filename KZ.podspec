Pod::Spec.new do |spec|
    spec.name = "KZ"

    spec.version = "3.0.0"
    spec.summary = "Framework base for iOS projects"
    spec.homepage = "https://github.com/k3zi/KZ"
    spec.license = { type: 'MIT', file: 'LICENSE' }
    spec.authors = { "Kesi Maduka" => 'me@kez.io' }
    spec.social_media_url = "https://twitter.com/k3zi_"

    spec.platform = :ios, "10.0"
    spec.requires_arc = true
    spec.source = { git: "https://github.com/k3zi/KZ.git", tag: spec.version.to_s, submodules: true }
    spec.source_files = "KZ/**/*.{swift}"

    spec.dependency "PureLayout"
    spec.dependency "Reusable"
end

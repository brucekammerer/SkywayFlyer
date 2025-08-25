extends Node


const RECORD_RESOURCE_PATH: String = "user://tappy.tres"


var record: int = 0:
    get:
        return record
    set(value):
        if value > record:
            record = value
            _save_record()

    
func _ready() -> void:
    _load_record()


func _load_record() -> void:
    if ResourceLoader.exists(RECORD_RESOURCE_PATH):
        var rr: RecordResource = ResourceLoader.load(
            RECORD_RESOURCE_PATH,
            "RecordResource"
        )
        if rr:
            record = rr.get("record")


func _save_record() -> void:
    var rr: RecordResource = RecordResource.new()
    rr.set("record", record)
    ResourceSaver.save(rr, RECORD_RESOURCE_PATH)